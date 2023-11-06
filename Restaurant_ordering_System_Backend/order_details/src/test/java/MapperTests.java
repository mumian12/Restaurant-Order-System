import com.ruoyi.details.OrderDetailsApplication;
import com.ruoyi.details.domain.OrderDetails;
import com.ruoyi.details.mapper.OrderDetailsMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = OrderDetailsApplication.class)
@MapperScan(basePackages = "com.ruoyi.order_details.mapper")
public class MapperTests {

    @Autowired
    private OrderDetailsMapper order_detailsMapper;

    @Test
    public void testSelectOrderDetailsById() {
        OrderDetails order_details = order_detailsMapper.selectOrderDetailsByDetailId(1L);
        System.out.println(order_details);
    }

    @Test
    public void testSelectOrderDetailsList() {
        List<OrderDetails> order_detailsList = order_detailsMapper.selectOrderDetailsList(new OrderDetails());
        System.out.println(order_detailsList);
    }

}

