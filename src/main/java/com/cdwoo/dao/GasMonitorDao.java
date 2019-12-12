package com.cdwoo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface GasMonitorDao {
	List<Map<String, Object>> getGasInfo(@Param("userId") int userId);
	Long getDeviceCount();
	List<Map<String, Object>> getGasInfo4App(@Param("companyId")int companyId);
	List<Map<String, Object>> getGasInfo4Appv2(@Param("no")int no, @Param("companyId")int companyId, @Param("groupId")int groupId);
	List<Map<String, Object>> getGasWarn4App(@Param("start") String start,@Param("end") String end,@Param("deviceNo") String deviceId,@Param("companyId") String companyId);
	void setPosition(@Param("deviceNo")String deviceNo, @Param("position")String position, @Param("companyId")int companyId);
	List<Map<String, Integer>> getWarnNumGroupByGroupId(@Param("userName")String userName);
}
