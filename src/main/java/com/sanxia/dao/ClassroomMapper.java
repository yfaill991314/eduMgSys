package com.sanxia.dao;

import com.sanxia.po.Classroom;

import java.util.List;
import java.util.Map;

public interface ClassroomMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Classroom record);

    int insertSelective(Classroom record);

    Classroom selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Classroom record);

    int updateByPrimaryKey(Classroom record);

    List<Classroom> queryClaRoomList(Map<String, Object> queryParams);
}