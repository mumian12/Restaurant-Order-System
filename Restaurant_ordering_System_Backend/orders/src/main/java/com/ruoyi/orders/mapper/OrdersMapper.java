package com.ruoyi.orders.mapper;

import java.util.List;
import com.ruoyi.orders.domain.Orders;

/**
 * ordersMapper接口
 * 
 * @author group14
 * @date 2023-10-24
 */
public interface OrdersMapper 
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
     * 删除orders
     * 
     * @param orderId orders主键
     * @return 结果
     */
    public int deleteOrdersByOrderId(Long orderId);

    /**
     * 批量删除orders
     * 
     * @param orderIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOrdersByOrderIds(Long[] orderIds);
}
