package com.bdqn.service.impl;

import com.bdqn.bean.EdocCategory;
import com.bdqn.dao.EdocCategoryMapper;
import com.bdqn.service.EdocCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EdocCategoryServiceimpl implements EdocCategoryService {
    @Autowired
    private EdocCategoryMapper edocCategoryMapper;
    @Override
    public List<EdocCategory> getAll() {
        return edocCategoryMapper.selectAll();
    }
}
