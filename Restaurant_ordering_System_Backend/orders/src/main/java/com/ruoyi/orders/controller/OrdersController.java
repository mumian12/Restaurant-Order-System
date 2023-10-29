package com.ruoyi.orders.controller;

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
import com.ruoyi.orders.domain.Orders;
import com.ruoyi.orders.service.IOrdersService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * ordersController
 * 
 * @author group14
 * @date 2023-10-24
 */
@RestController
@RequestMapping("/orders/orders")
public class OrdersController extends BaseController
{
    @Autowired
    private IOrdersService ordersService;

    /**
     * 查询orders列表
     */
    @PreAuthorize("@ss.hasPermi('orders:orders:list')")
    @GetMapping("/list")
    public TableDataInfo list(Orders orders)
    {
        startPage();
        List<Orders> list = ordersService.selectOrdersList(orders);
        return getDataTable(list);
    }

    /**
     * 导出orders列表
     */
    @PreAuthorize("@ss.hasPermi('orders:orders:export')")
    @Log(title = "orders", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Orders orders)
    {
        List<Orders> list = ordersService.selectOrdersList(orders);
        ExcelUtil<Orders> util = new ExcelUtil<Orders>(Orders.class);
        util.exportExcel(response, list, "orders数据");
    }

    /**
     * 获取orders详细信息
     */
    @PreAuthorize("@ss.hasPermi('orders:orders:query')")
    @GetMapping(value = "/{orderId}")
    public AjaxResult getInfo(@PathVariable("orderId") Long orderId)
    {
        return success(ordersService.selectOrdersByOrderId(orderId));
    }

    /**
     * 新增orders
     */
    @PreAuthorize("@ss.hasPermi('orders:orders:add')")
    @Log(title = "orders", businessType = BusinessType.INSERT)
    @PostMapping
    // public AjaxResult add(@RequestBody Orders orders)
    // {
    //     return toAjax(ordersService.insertOrders(orders));
    // }
    public Orders add(@RequestBody Orders orders) {
        return ordersService.insertOrders(orders);
    }

    /**
     * 修改orders
     */
    @PreAuthorize("@ss.hasPermi('orders:orders:edit')")
    @Log(title = "orders", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Orders orders)
    {
        return toAjax(ordersService.updateOrders(orders));
    }

    /**
     * 删除orders
     */
    @PreAuthorize("@ss.hasPermi('orders:orders:remove')")
    @Log(title = "orders", businessType = BusinessType.DELETE)
	@DeleteMapping("/{orderIds}")
    public AjaxResult remove(@PathVariable Long[] orderIds)
    {
        return toAjax(ordersService.deleteOrdersByOrderIds(orderIds));
    }
}
