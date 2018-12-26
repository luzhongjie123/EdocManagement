package com.bdqn.dao;

import com.bdqn.bean.EdocEntry;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EdocEntryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EdocEntry record);

    List<EdocEntry> selectByPrimaryKey(@Param("EdocCategoryId") Integer EdocCategoryId);

    List<EdocEntry> selectAll();

    int updateByPrimaryKey(EdocEntry record);
}