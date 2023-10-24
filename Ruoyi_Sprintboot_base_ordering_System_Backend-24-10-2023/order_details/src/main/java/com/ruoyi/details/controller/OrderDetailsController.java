package com.ruoyi.details.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.details.domain.OrderDetails;
import com.ruoyi.details.service.IOrderDetailsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * detailsController
 * 
 * @author group14
 * @date 2023-10-24
 */
@RestController
@RequestMapping("/details/details")
public class OrderDetailsController extends BaseController
{
    @Autowired
    private IOrderDetailsService orderDetailsService;

    /**
     * 查询details列表
     */
    @PreAuthorize("@ss.hasPermi('details:details:list')")
    @GetMapping("/list")
    public TableDataInfo list(OrderDetails orderDetails)
    {
        startPage();
        List<OrderDetails> list = orderDetailsService.selectOrderDetailsList(orderDetails);
        return getDataTable(list);
    }

    /**
     * 导出details列表
     */
    @PreAuthorize("@ss.hasPermi('details:details:export')")
    @Log(title = "details", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, OrderDetails orderDetails)
    {
        List<OrderDetails> list = orderDetailsService.selectOrderDetailsList(orderDetails);
        ExcelUtil<OrderDetails> util = new ExcelUtil<OrderDetails>(OrderDetails.class);
        util.exportExcel(response, list, "details数据");
    }

    /**
     * 获取details详细信息
     */
    @PreAuthorize("@ss.hasPermi('details:details:query')")
    @GetMapping(value = "/{detailId}")
    public AjaxResult getInfo(@PathVariable("detailId") Long detailId)
    {
        return success(orderDetailsService.selectOrderDetailsByDetailId(detailId));
    }

    /**
     * 新增details
     */
    @PreAuthorize("@ss.hasPermi('details:details:add')")
    @Log(title = "details", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody OrderDetails orderDetails)
    {
        return toAjax(orderDetailsService.insertOrderDetails(orderDetails));
    }

    /**
     * 修改details
     */
    @PreAuthorize("@ss.hasPermi('details:details:edit')")
    @Log(title = "details", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody OrderDetails orderDetails)
    {
        return toAjax(orderDetailsService.updateOrderDetails(orderDetails));
    }

    /**
     * 删除details
     */
    @PreAuthorize("@ss.hasPermi('details:details:remove')")
    @Log(title = "details", businessType = BusinessType.DELETE)
	@DeleteMapping("/{detailIds}")
    public AjaxResult remove(@PathVariable Long[] detailIds)
    {
        return toAjax(orderDetailsService.deleteOrderDetailsByDetailIds(detailIds));
    }
}
