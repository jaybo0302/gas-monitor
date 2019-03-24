package com.cdwoo.service;

import java.util.List;
import java.util.Map;

import com.cdwoo.common.CDPage;
import com.cdwoo.common.CDParam;

public interface DeviceService {
	CDPage queryDeviceByPage(CDParam param);
	List<Map<String, Object>> getDeviceList(int companyId);
	void updateDeviceGroupId2N(int companyId,String groupId);
	void updateDeviceGroupId(int companyId, String deviceIds, String groupId);
	Map<String, Object> getDeviceById(String id, int companyId);
	void editDevice(String deviceNo, int companyId, int groupId);
}
