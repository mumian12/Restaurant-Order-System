import com.ruoyi.item.ItemApplication;
import com.ruoyi.item.domain.Item;
import com.ruoyi.item.mapper.ItemMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = ItemApplication.class)
@MapperScan(basePackages = "com.ruoyi.item.mapper")
public class MapperTests {

    @Autowired
    private ItemMapper itemMapper;

    @Test
    public void testSelectItemById() {
        Item item = itemMapper.selectItemByItemId(1L);
        System.out.println(item);
    }

    @Test
    public void testSelectItemList() {
        List<Item> itemList = itemMapper.selectItemList(new Item());
        System.out.println(itemList);
    }

}

