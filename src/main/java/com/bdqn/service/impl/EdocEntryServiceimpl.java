package com.bdqn.service.impl;

import com.bdqn.bean.EdocEntry;
import com.bdqn.dao.EdocCategoryMapper;
import com.bdqn.dao.EdocEntryMapper;
import com.bdqn.service.EdocEntryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EdocEntryServiceimpl implements EdocEntryService {
    @Autowired
    private EdocEntryMapper edocEntryMapper;
    @Override
    public List<EdocEntry> getAll(Integer EdocCategoryId) {
        return edocEntryMapper.selectByPrimaryKey(EdocCategoryId);
    }
}
