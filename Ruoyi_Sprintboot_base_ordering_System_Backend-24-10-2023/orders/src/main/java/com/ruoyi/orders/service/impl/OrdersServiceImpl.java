package com.ruoyi.orders.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.orders.mapper.OrdersMapper;
import com.ruoyi.orders.domain.Orders;
import com.ruoyi.orders.service.IOrdersService;

/**
 * ordersService业务层处理
 * 
 * @author group14
 * @date 2023-10-24
 */
@Service
public class OrdersServiceImpl implements IOrdersService 
{
    @Autowired
    private OrdersMapper ordersMapper;

    /**
     * 查询orders
     * 
     * @param orderId orders主键
     * @return orders
     */
    @Override
    public Orders selectOrdersByOrderId(Long orderId)
    {
        return ordersMapper.selectOrdersByOrderId(orderId);
    }

    /**
     * 查询orders列表
     * 
     * @param orders orders
     * @return orders
     */
    @Override
    public List<Orders> selectOrdersList(Orders orders)
    {
        return ordersMapper.selectOrdersList(orders);
    }

    /**
     * 新增orders
     * 
     * @param orders orders
     * @return 结果
     */
    @Override
    public int insertOrders(Orders orders)
    {
        return ordersMapper.insertOrders(orders);
    }

    /**
     * 修改orders
     * 
     * @param orders orders
     * @return 结果
     */
    @Override
    public int updateOrders(Orders orders)
    {
        return ordersMapper.updateOrders(orders);
    }

    /**
     * 批量删除orders
     * 
     * @param orderIds 需要删除的orders主键
     * @return 结果
     */
    @Override
    public int deleteOrdersByOrderIds(Long[] orderIds)
    {
        return ordersMapper.deleteOrdersByOrderIds(orderIds);
    }

    /**
     * 删除orders信息
     * 
     * @param orderId orders主键
     * @return 结果
     */
    @Override
    public int deleteOrdersByOrderId(Long orderId)
    {
        return ordersMapper.deleteOrdersByOrderId(orderId);
    }
}
