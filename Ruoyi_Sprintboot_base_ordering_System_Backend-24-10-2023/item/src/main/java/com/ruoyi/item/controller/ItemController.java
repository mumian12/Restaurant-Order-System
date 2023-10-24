package com.ruoyi.item.controller;

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
import com.ruoyi.item.domain.Item;
import com.ruoyi.item.service.IItemService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * itemController
 * 
 * @author group14
 * @date 2023-10-24
 */
@RestController
@RequestMapping("/item/item")
public class ItemController extends BaseController
{
    @Autowired
    private IItemService itemService;

    /**
     * 查询item列表
     */
    @PreAuthorize("@ss.hasPermi('item:item:list')")
    @GetMapping("/list")
    public TableDataInfo list(Item item)
    {
        startPage();
        List<Item> list = itemService.selectItemList(item);
        return getDataTable(list);
    }

    /**
     * 导出item列表
     */
    @PreAuthorize("@ss.hasPermi('item:item:export')")
    @Log(title = "item", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Item item)
    {
        List<Item> list = itemService.selectItemList(item);
        ExcelUtil<Item> util = new ExcelUtil<Item>(Item.class);
        util.exportExcel(response, list, "item数据");
    }

    /**
     * 获取item详细信息
     */
    @PreAuthorize("@ss.hasPermi('item:item:query')")
    @GetMapping(value = "/{itemId}")
    public AjaxResult getInfo(@PathVariable("itemId") Long itemId)
    {
        return success(itemService.selectItemByItemId(itemId));
    }

    /**
     * 新增item
     */
    @PreAuthorize("@ss.hasPermi('item:item:add')")
    @Log(title = "item", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Item item)
    {
        return toAjax(itemService.insertItem(item));
    }

    /**
     * 修改item
     */
    @PreAuthorize("@ss.hasPermi('item:item:edit')")
    @Log(title = "item", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Item item)
    {
        return toAjax(itemService.updateItem(item));
    }

    /**
     * 删除item
     */
    @PreAuthorize("@ss.hasPermi('item:item:remove')")
    @Log(title = "item", businessType = BusinessType.DELETE)
	@DeleteMapping("/{itemIds}")
    public AjaxResult remove(@PathVariable Long[] itemIds)
    {
        return toAjax(itemService.deleteItemByItemIds(itemIds));
    }
}
