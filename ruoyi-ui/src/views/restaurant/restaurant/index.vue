<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch">
      <el-form-item label="food type" prop="foodType">
        <el-input
          v-model="queryParams.foodType"
          placeholder="input food type"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="restaurant name" prop="restaurantName">
        <el-input
          v-model="queryParams.restaurantName"
          placeholder="input restaurant name"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">Search</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">Reset</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['restaurant:restaurant:add']"
        >New</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="restaurantList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="restaurant id" align="center" prop="restaurantId" />
      <el-table-column label="food type" align="center" prop="foodType" />
      <el-table-column label="restaurant picture" align="center" prop="restaurantPic" />
      <el-table-column label="restaurant name" align="center" prop="restaurantName" />
      <el-table-column label="order number" align="center" prop="orderNum" />
      <el-table-column label="contact" align="center" prop="contact" />
      <el-table-column label="restaurant status (0 is open 1 is closed.)" align="center" prop="status" />
      <el-table-column label="Operation" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['restaurant:restaurant:edit']"
          >Modify</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['restaurant:restaurant:remove']"
          >Delete</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改restaurant对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="food type" prop="foodType">
          <el-input v-model="form.foodType" placeholder="请输入food type" />
        </el-form-item>
        <el-form-item label="restaurant picture" prop="restaurantPic">
          <el-input v-model="form.restaurantPic" placeholder="请输入restaurant picture" />
        </el-form-item>
        <el-form-item label="restaurant name" prop="restaurantName">
          <el-input v-model="form.restaurantName" placeholder="请输入restaurant name" />
        </el-form-item>
        <el-form-item label="order number" prop="orderNum">
          <el-input v-model="form.orderNum" placeholder="请输入order number" />
        </el-form-item>
        <el-form-item label="contact" prop="contact">
          <el-input v-model="form.contact" placeholder="请输入contact" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listRestaurant, getRestaurant, delRestaurant, addRestaurant, updateRestaurant } from "@/api/restaurant/restaurant";

export default {
  name: "Restaurant",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // restaurant表格数据
      restaurantList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        foodType: null,
        restaurantName: null,
        status: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询restaurant列表 */
    getList() {
      this.loading = true;
      listRestaurant(this.queryParams).then(response => {
        this.restaurantList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        restaurantId: null,
        foodType: null,
        restaurantPic: null,
        restaurantName: null,
        orderNum: null,
        contact: null,
        status: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.restaurantId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加restaurant";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const restaurantId = row.restaurantId || this.ids
      getRestaurant(restaurantId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改restaurant";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.restaurantId != null) {
            updateRestaurant(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRestaurant(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const restaurantIds = row.restaurantId || this.ids;
      this.$modal.confirm('是否确认删除restaurant编号为"' + restaurantIds + '"的数据项？').then(function() {
        return delRestaurant(restaurantIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('restaurant/restaurant/export', {
        ...this.queryParams
      }, `restaurant_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
