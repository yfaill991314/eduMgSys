package com.sanxia.dao;

import com.sanxia.po.Sysadmin;

import java.util.List;
import java.util.Map;

public interface SysadminMapper {
    int deleteByPrimaryKey(Integer adNum);

    int insert(Sysadmin record);

    int insertSelective(Sysadmin record);

    Sysadmin selectByPrimaryKey(Integer adNum);

    int updateByPrimaryKeySelective(Sysadmin record);

    int updateByPrimaryKey(Sysadmin record);

    List<Sysadmin> queryAdminList(Map<String, Object> queryParams);
}