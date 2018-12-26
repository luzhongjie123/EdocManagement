package com.bdqn.dao;

import com.bdqn.bean.EdocCategory;
import java.util.List;

public interface EdocCategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EdocCategory record);

    EdocCategory selectByPrimaryKey(Integer id);

    List<EdocCategory> selectAll();

    int updateByPrimaryKey(EdocCategory record);
}