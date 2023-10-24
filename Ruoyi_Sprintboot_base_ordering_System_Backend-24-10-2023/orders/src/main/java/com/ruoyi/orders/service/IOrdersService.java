package com.ruoyi.orders.service;

import java.util.List;
import com.ruoyi.orders.domain.Orders;

/**
 * ordersService接口
 * 
 * @author group14
 * @date 2023-10-24
 */
public interface IOrdersService 
{
    /**
     * 查询orders
     * 
     * @param orderId orders主键
     * @return orders
     */
    public Orders selectOrdersByOrderId(Long orderId);

    /**
     * 查询orders列表
     * 
     * @param orders orders
     * @return orders集合
     */
    public List<Orders> selectOrdersList(Orders orders);

    /**
     * 新增orders
     * 
     * @param orders orders
     * @return 结果
     */
    public int insertOrders(Orders orders);

    /**
     * 修改orders
     * 
     * @param orders orders
     * @return 结果
     */
    public int updateOrders(Orders orders);

    /**
     * 批量删除orders
     * 
     * @param orderIds 需要删除的orders主键集合
     * @return 结果
     */
    public int deleteOrdersByOrderIds(Long[] orderIds);

    /**
     * 删除orders信息
     * 
     * @param orderId orders主键
     * @return 结果
     */
    public int deleteOrdersByOrderId(Long orderId);
}
