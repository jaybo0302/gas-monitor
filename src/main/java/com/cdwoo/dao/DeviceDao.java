package com.cdwoo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cdwoo.common.CDParam;

public interface DeviceDao {
	long queryDeviceCount(CDParam param);
	List<Object> queryDeviceByPage(CDParam param);
	List<Map<String, Object>> getDeviceList(@Param("companyId")int companyId);
	void updateDeviceGroupId2N(@Param("groupId")String groupId, @Param("companyId")int companyId);
	void updateDeviceGroupId(@Param("companyId")int companyId,@Param("deviceIds")String deviceIds, @Param("groupId")String groupId);
	Map<String, Object> getDeviceById(@Param("deviceNo")String id, @Param("companyId")int companyId);
	void editDevcie(@Param("deviceNo")String deviceNo, @Param("companyId")int companyId, @Param("groupId")int groupId);
}
