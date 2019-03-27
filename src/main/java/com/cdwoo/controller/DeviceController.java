package com.cdwoo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cdwoo.common.CDPage;
import com.cdwoo.common.CDParam;
import com.cdwoo.common.CDResult;
import com.cdwoo.common.Constants;
import com.cdwoo.entity.User;
import com.cdwoo.service.DeviceGroupService;
import com.cdwoo.service.DeviceService;

@Controller
@RequestMapping("device")
public class DeviceController {
	@Autowired
	private DeviceService deviceService;
	@Autowired
	private DeviceGroupService deviceGroupService;
	
	@ResponseBody
	@RequestMapping("queryDeviceByPage")
	public CDResult queryDeviceByPage (CDParam param, HttpServletRequest req) {
		param.setCompanyId(((User)req.getSession().getAttribute(Constants.USER_CONTEXT)).getCompanyId());
		return CDResult.success(this.deviceService.queryDeviceByPage(param));
	}
	
	@ResponseBody
	@RequestMapping("getDeviceList")
	public CDResult getDeviceList(HttpServletRequest req) {
		int companyId = ((User)req.getSession().getAttribute(Constants.USER_CONTEXT)).getCompanyId();
		if (companyId == 1) {
			companyId = Integer.parseInt(req.getParameter("companyId"));
		}
		List<Map<String, Object>> deviceList = this.deviceService.getDeviceList(companyId);
		return CDResult.success(deviceList);
	}
	
	@RequestMapping("getEditPage")
	public String getEditPage(@RequestParam("id") String id, @RequestParam("companyId") String companyId, HttpServletRequest req) {
		int currentCompanyId = ((User)req.getSession().getAttribute(Constants.USER_CONTEXT)).getCompanyId();
		if (currentCompanyId == 1) {
			currentCompanyId = Integer.parseInt(companyId);
		}
		Map<String, Object> device = this.deviceService.getDeviceById(id, currentCompanyId);
		req.setAttribute("device", device);
		return "jsp/device_edit";
	}
	
	@ResponseBody
	@RequestMapping("editDevice")
	public CDResult editDevice (HttpServletRequest req) {
		String deviceNo = req.getParameter("deviceNo");
		int groupId = Integer.parseInt(req.getParameter("groupId"));
		int companyId = ((User)req.getSession().getAttribute(Constants.USER_CONTEXT)).getCompanyId();
		if (companyId == 1) {
			companyId = Integer.parseInt(req.getParameter("companyId"));
		}
		this.deviceService.editDevice(deviceNo, companyId, groupId);
		return CDResult.success();
	}
	
}
