package com.bdqn.controller;

import com.bdqn.bean.EdocCategory;
import com.bdqn.bean.EdocEntry;
import com.bdqn.bean.Msg;
import com.bdqn.service.EdocCategoryService;
import com.bdqn.service.EdocEntryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class EdocEntryController {
@Autowired
private EdocEntryService edocEntryService;
@Autowired
private EdocCategoryService edocCategoryService;
    @RequestMapping("/EdocEntry")
    @ResponseBody
    public Msg EdocEntry(Integer pn,Integer EdocCategoryId){
        PageHelper.startPage(pn,5);
        List<EdocEntry> EyList= edocEntryService.getAll(EdocCategoryId);
        PageInfo page=new PageInfo(EyList,5);
        return Msg.success().add("pageInfo",page);
    }

    @RequestMapping("/selEdocCategory")
    @ResponseBody
    public List<EdocCategory> selEdocCategory(){
        List<EdocCategory> eyList=edocCategoryService.getAll();
        return eyList;
    }

}
