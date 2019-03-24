package com.cdwoo.service;

import java.util.List;
import java.util.Map;

import com.cdwoo.common.CDPage;
import com.cdwoo.common.CDParam;

public interface DeviceGroupService {

	CDPage queryDeviceGroupByPage(CDParam param);

	long checkUserWithGroup(String id);

	void deleteGroup(String id);

	List<Map<String, Object>> getDeviceGroupList(int companyId);

	void addDeviceGroup(String groupName, int companyId);

	Map<String, Object> getDeviceGroup(int id);

	void updateDeviceGroup(String groupName, String groupId);

}
