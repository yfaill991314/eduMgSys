package com.sanxia.dao;

import com.sanxia.po.SysAdmin;

import java.util.List;

public interface SysAdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysAdmin record);

    int insertSelective(SysAdmin record);

    SysAdmin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysAdmin record);

    int updateByPrimaryKey(SysAdmin record);

    List<SysAdmin> queryAdminList();
}