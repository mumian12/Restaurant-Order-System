import com.ruoyi.item.ItemApplication;
import com.ruoyi.item.domain.Item;
import com.ruoyi.item.mapper.ItemMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import com.ruoyi.details.mapper.OrderDetailsMapper;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import static junit.framework.TestCase.assertNotNull;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = ItemApplication.class)
@MapperScan(basePackages = "com.ruoyi.item.mapper")
public class MapperTests {

    @Autowired
    private ItemMapper itemMapper;
    @Autowired
    private OrderDetailsMapper orderDetailsMapper;

    @Test
    public void testSelectItemById() {
        Item item = itemMapper.selectItemByItemId(1L);
        assertNotNull(item);
        System.out.println(item);
    }

    @Test
    public void testSelectItemList() {
        List<Item> itemList = itemMapper.selectItemList(new Item());
        assertNotNull(itemList);
        System.out.println(itemList);
    }

    @Test
    public void testInsertItem(){
        Item newItem = new Item();
        newItem.setItemPic("path_to_image"); // 设置item picture的值，可以是图片路径
        newItem.setItemName("Item Name"); // 设置item name的值
        newItem.setItemPrice(BigDecimal.valueOf(10.99)); // 设置item price的值
        newItem.setItemDescription("Item Description"); // 设置item description的值
        newItem.setOrderNum(1); // 设置order number的值

        int insert = itemMapper.insertItem(newItem);
        System.out.println(insert);
    }

//    @Test
//    public void testDeleteItem(){
//        int delete = itemMapper.deleteItemByItemId(1L);
//        System.out.println(delete);
//    }

    @Test
    public void testUpdateItem(){
        Item updateItem = new Item();
        updateItem.setItemPic("path_to_image"); // 设置item picture的值，可以是图片路径
        updateItem.setItemName("Item Name"); // 设置item name的值
        updateItem.setItemPrice(BigDecimal.valueOf(10.99)); // 设置item price的值
        updateItem.setItemDescription("Item Description"); // 设置item description的值
        updateItem.setOrderNum(1); // 设置order number的值
        int update = itemMapper.updateItem(updateItem);
        System.out.println(update);
    }
//
//    @Test
//    public void testDeleteItems(){
//        Long[] d = {1L,2L};
//        // 先删除与item_id相关联的order_details记录
//        int deletesFromOrderDetails = orderDetailsMapper.deleteOrderDetailsByDetailIds(d);
//        // 删除Item
//        int deletesFromItem = itemMapper.deleteItemByItemIds(d);
//        System.out.println("Deleted from order_details: " + deletesFromOrderDetails);
//        System.out.println("Deleted from item: " + deletesFromItem);
//    }

}

