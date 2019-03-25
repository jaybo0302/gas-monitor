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
		List<Map<String, Object>> deviceList = this.deviceService.getDeviceList(((User)req.getSession().getAttribute(Constants.USER_CONTEXT)).getCompanyId());
		return CDResult.success(deviceList);
	}
	
	@RequestMapping("getEditPage")
	public String getEditPage(@RequestParam("id") String id, HttpServletRequest req) {
		Map<String, Object> device = this.deviceService.getDeviceById(id,((User)req.getSession().getAttribute(Constants.USER_CONTEXT)).getCompanyId());
		req.setAttribute("device", device);
		return "jsp/device_edit";
	}
	
	@ResponseBody
	@RequestMapping("editDevice")
	public CDResult editDevice (HttpServletRequest req) {
		String deviceNo = req.getParameter("deviceNo");
		int groupId = Integer.parseInt(req.getParameter("groupId"));
		int companyId = ((User)req.getSession().getAttribute(Constants.USER_CONTEXT)).getCompanyId();
		this.deviceService.editDevice(deviceNo, companyId, groupId);
		return CDResult.success();
	}
	
}
