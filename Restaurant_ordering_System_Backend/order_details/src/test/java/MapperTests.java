import com.ruoyi.details.OrderDetailsApplication;
import com.ruoyi.details.domain.OrderDetails;
import com.ruoyi.details.mapper.OrderDetailsMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import static junit.framework.TestCase.assertNotNull;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = OrderDetailsApplication.class)
@MapperScan(basePackages = "com.ruoyi.order_details.mapper")
public class MapperTests {

    @Autowired
    private OrderDetailsMapper order_detailsMapper;

    @Test
    public void testSelectOrderDetailsById() {
        OrderDetails order_details = order_detailsMapper.selectOrderDetailsByDetailId(1L);
        assertNotNull(order_details);

        System.out.println(order_details);
    }

    @Test
    public void testSelectOrderDetailsList() {
        List<OrderDetails> order_detailsList = order_detailsMapper.selectOrderDetailsList(new OrderDetails());
        assertNotNull(order_detailsList);

        System.out.println(order_detailsList);
    }
    @Test
    public void testInsertOrderDetail(){
        OrderDetails newOrderDetail = new OrderDetails();
        newOrderDetail.setOrderId(2L); //
        newOrderDetail.setItemId(2L); // 设置order_details name的值
        newOrderDetail.setQuantity(6L);

        int insert = order_detailsMapper.insertOrderDetails(newOrderDetail);
        System.out.println(insert);
    }

    @Test
    public void testUpdateOrderDetail(){
        OrderDetails updateOrderDetail = new OrderDetails();
        updateOrderDetail.setOrderId(2L); //
        updateOrderDetail.setItemId(2L); // 设置order_details name的值
        updateOrderDetail.setQuantity(6L);
        int update = order_detailsMapper.updateOrderDetails(updateOrderDetail);
        System.out.println(update);
    }

}

