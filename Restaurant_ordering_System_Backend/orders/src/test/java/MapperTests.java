import com.ruoyi.orders.OrdersApplication;
import com.ruoyi.orders.domain.Orders;
import com.ruoyi.orders.mapper.OrdersMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static junit.framework.TestCase.assertNotNull;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = OrdersApplication.class)
@MapperScan(basePackages = "com.ruoyi.orders.mapper")
public class MapperTests {

    @Autowired
    private OrdersMapper ordersMapper;

    @Test
    public void testSelectOrdersById() {
        Orders orders = ordersMapper.selectOrdersByOrderId(1L);
        assertNotNull(orders); // 验证 orders 对象不为空
        System.out.println(orders);
    }

    @Test
    public void testSelectOrdersList() {
        List<Orders> ordersList = ordersMapper.selectOrdersList(new Orders());
        assertNotNull(ordersList);
        System.out.println(ordersList);
    }

    @Test
    public void testInsertOrder() throws ParseException {
        Orders newOrders = new Orders();
        newOrders.setOrderState("complete");
        String dateString = "03/11/2023";
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        Date date = dateFormat.parse(dateString);
        newOrders.setOrderTime(date);


        int insert = ordersMapper.insertOrders(newOrders);
        System.out.println(insert);
    }

    @Test
    public void testUpdateOrderDetail() throws ParseException {
        Orders updateOrders = new Orders();
        updateOrders.setOrderState("complete");
        String dateString = "03/11/2023";
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        Date date = dateFormat.parse(dateString);
        updateOrders.setOrderTime(date);
        int update = ordersMapper.updateOrders(updateOrders);
        System.out.println(update);
    }
}

