import com.ruoyi.orders.OrdersApplication;
import com.ruoyi.orders.domain.Orders;
import com.ruoyi.orders.mapper.OrdersMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = OrdersApplication.class)
@MapperScan(basePackages = "com.ruoyi.orders.mapper")
public class MapperTests {

    @Autowired
    private OrdersMapper ordersMapper;

    @Test
    public void testSelectOrdersById() {
        Orders orders = ordersMapper.selectOrdersByOrderId(1L);
        System.out.println(orders);
    }

    @Test
    public void testSelectOrdersList() {
        List<Orders> ordersList = ordersMapper.selectOrdersList(new Orders());
        System.out.println(ordersList);
    }

}

