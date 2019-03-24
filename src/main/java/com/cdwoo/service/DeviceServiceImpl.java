package com.cdwoo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdwoo.common.CDPage;
import com.cdwoo.common.CDParam;
import com.cdwoo.dao.DeviceDao;

@Service
public class DeviceServiceImpl implements DeviceService {
	@Autowired
	private DeviceDao deviceDao;

	@Override
	public CDPage queryDeviceByPage(CDParam param) {
		CDPage page = new CDPage();
		page.setCount(param.getPageSize());
		page.setCurrentPage(param.getPageNo());
		page.setTotalCount(deviceDao.queryDeviceCount(param));
		List<Object> result= deviceDao.queryDeviceByPage(param);
		page.setData(result);
		return page;
	}

	@Override
	public List<Map<String, Object>> getDeviceList(int companyId) {
		return deviceDao.getDeviceList(companyId);
	}

	@Override
	public void updateDeviceGroupId2N(int companyId,String groupId) {
		this.deviceDao.updateDeviceGroupId2N(groupId,companyId);
	}

	@Override
	public void updateDeviceGroupId(int companyId, String deviceIds, String groupId) {
		this.deviceDao.updateDeviceGroupId(companyId, deviceIds, groupId);
	}

	@Override
	public Map<String, Object> getDeviceById(String id, int companyId) {
		return this.deviceDao.getDeviceById(id, companyId);
	}

	@Override
	public void editDevice(String deviceNo, int companyId, int groupId) {
		this.deviceDao.editDevcie(deviceNo,companyId,groupId);
	}
}
