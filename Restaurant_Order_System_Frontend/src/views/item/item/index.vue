<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch">
      <el-form-item label="item name" prop="itemName">
        <el-input
          v-model="queryParams.itemName"
          placeholder="Please input item name"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="item price(S$)" prop="itemPrice">
        <el-input
          v-model="queryParams.itemPrice"
          placeholder="Please input item price"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="item description" prop="itemDescription">
        <el-input
          v-model="queryParams.itemDescription"
          placeholder="Please input item description"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">search</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">reset</el-button>
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
          v-hasPermi="['item:item:add']"
        >new</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['item:item:edit']"
        >modify</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['item:item:remove']"
        >delete</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="itemList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="item picture" align="center" prop="itemPic" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.itemPic" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="item name" align="center" prop="itemName" />
      <el-table-column label="item price(S$)" align="center" prop="itemPrice" />
      <el-table-column label="item description" align="center" prop="itemDescription" />
      <el-table-column label="counter" align="center">
        <template slot-scope="scope">
          <el-input
            v-model="scope.row.counter"
            size="mini"
            type="number"
            :min="0"
            @change="handleCounterChange(scope.row)"
          ></el-input>
        </template>
      </el-table-column>
      <el-table-column label="operation" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['item:item:edit']"
          >modify</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['item:item:remove']"
          >delete</el-button>
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

    <el-row style="text-align: right; margin-top: 50px;">
      <el-button type="primary" @click="submitCounters">Submit Order</el-button>
    </el-row>

    <!-- 添加或修改item对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules">
        <el-form-item label="item picture" prop="itemPic">
          <image-upload v-model="form.itemPic"/>
        </el-form-item>
        <el-form-item label="item name" prop="itemName">
          <el-input v-model="form.itemName" placeholder="Please input item name" />
        </el-form-item>
        <el-form-item label="item price" prop="itemPrice">
          <el-input v-model="form.itemPrice" placeholder="Please input item price" />
        </el-form-item>
        <el-form-item label="item description" prop="itemDescription">
          <el-input v-model="form.itemDescription" placeholder="Please input item description" />
        </el-form-item>
        <el-form-item label="order number" prop="orderNum">
          <el-input v-model="form.orderNum" placeholder="Please input order number" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">yes</el-button>
        <el-button @click="cancel">cancel</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listItem, getItem, delItem, addItem, updateItem } from "@/api/item/item";

export default {
  name: "Item",
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
      // item表格数据
      itemList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        itemName: null,
        itemPrice: null,
        itemDescription: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      counters: {}, // 用于存储计数器值的对象
      submissionData: [] // 用于存储提交内容的数组
    };
  },
  created() {
    this.getList();
  },
  computed: {
    computedItemList() {
      return this.itemList.map(item => {
        return {
          ...item,
          counter: this.counters[item.itemId] || 0 // 使用 counters 对象中的值，如果不存在则默认为0
        };
      });
    }
  },
  methods: {
    /** 查询item列表 */
    getList() {
      this.loading = true;
      listItem(this.queryParams).then(response => {
        this.itemList = response.rows;
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
        itemId: null,
        itemPic: null,
        itemName: null,
        itemPrice: null,
        itemDescription: null,
        orderNum: null
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
      this.ids = selection.map(item => item.itemId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "add item";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const itemId = row.itemId || this.ids
      getItem(itemId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "modify item";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.itemId != null) {
            updateItem(this.form).then(response => {
              this.$modal.msgSuccess("successful modify");
              this.open = false;
              this.getList();
            });
          } else {
            addItem(this.form).then(response => {
              this.$modal.msgSuccess("successful new");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const itemIds = row.itemId || this.ids;
      this.$modal.confirm('是否确认删除item编号为"' + itemIds + '"的数据项？').then(function() {
        return delItem(itemIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("successful delete");
      }).catch(() => {});
    },
    handleCounterChange(item) {
    // 更新计数器的值到 counters 对象中
    this.$set(this.counters, item.itemId, item.counter);
    },
    // 提交计数器值不为0的数据(待改)
    submitCounters() {
      this.submissionData = this.computedItemList
        .filter(item => item.counter > 0)
        .map(item => ({
          itemName: item.itemName,
          counter: item.counter
        }));
    }
  }
};
</script>
