package com.bdqn.service;

import com.bdqn.bean.EdocEntry;

import java.util.List;

public interface EdocEntryService {

    List<EdocEntry> getAll(Integer EdocCategoryId);
}
