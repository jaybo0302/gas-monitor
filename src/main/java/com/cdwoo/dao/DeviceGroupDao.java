package com.cdwoo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cdwoo.common.CDParam;

public interface DeviceGroupDao {
	long queryDeviceGroupCount(CDParam param);
	List<Object> queryDeviceGroupByPage(CDParam param);
	long checkUserWithGroup(@Param("id")String id);
	List<Map<String, Object>> getDeviceGroupList(@Param("companyId")int companyId);
	void addDeviceGroup(@Param("groupName")String groupName,@Param("companyId")int companyId);
	List<Map<String, Object>> getDeviceGroup(@Param("id")int id);
	void updateDeviceGroup(@Param("groupName")String groupName, @Param("groupId")String groupId);
	void deleteGroup(@Param("id")String id);
	List<Map<String, Object>> getDeviceGroupByUserName(@Param("userName")String userName);
}
