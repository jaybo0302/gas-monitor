package com.cdwoo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdwoo.common.CDPage;
import com.cdwoo.common.CDParam;
import com.cdwoo.dao.DeviceGroupDao;

@Service
public class DeviceGroupServiceImpl implements DeviceGroupService {
	@Autowired
	private DeviceGroupDao deviceGroupDao;

	@Override
	public CDPage queryDeviceGroupByPage(CDParam param) {
		CDPage page = new CDPage();
		page.setCount(param.getPageSize());
		page.setCurrentPage(param.getPageNo());
		page.setTotalCount(deviceGroupDao.queryDeviceGroupCount(param));
		List<Object> result= deviceGroupDao.queryDeviceGroupByPage(param);
		page.setData(result);
		return page;
	}

	@Override
	public long checkUserWithGroup(String id) {
		return deviceGroupDao.checkUserWithGroup(id);
	}

	@Override
	public void deleteGroup(String id) {
		
	}

	@Override
	public List<Map<String, Object>> getDeviceGroupList(int companyId) {
		return this.deviceGroupDao.getDeviceGroupList(companyId);
	}

	@Override
	public void addDeviceGroup(String groupName, int companyId) {
		this.deviceGroupDao.addDeviceGroup(groupName, companyId);
	}

	@Override
	public Map<String, Object> getDeviceGroup(int id) {
		return this.deviceGroupDao.getDeviceGroup(id).get(0);
	}

	@Override
	public void updateDeviceGroup(String groupName, String groupId) {
		this.deviceGroupDao.updateDeviceGroup(groupName, groupId);
	}
	
}
