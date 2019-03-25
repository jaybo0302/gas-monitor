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

import com.cdwoo.common.CDLogger;
import com.cdwoo.common.CDParam;
import com.cdwoo.common.CDResult;
import com.cdwoo.common.Constants;
import com.cdwoo.entity.User;
import com.cdwoo.service.DeviceGroupService;
import com.cdwoo.service.DeviceService;

@Controller
@RequestMapping("deviceGroup")
public class DeviceGroupController {
	
	@Autowired
	private DeviceGroupService deviceGroupService;
	@Autowired
	private DeviceService deviceService;
	
	@ResponseBody
	@RequestMapping("queryDevicegroupByPage")
	public CDResult queryDeviceGroupByPage (CDParam param, HttpServletRequest req) {
		param.setCompanyId(((User)req.getSession().getAttribute(Constants.USER_CONTEXT)).getCompanyId());
		return CDResult.success(this.deviceGroupService.queryDeviceGroupByPage(param));
	}
	
	@ResponseBody
	@RequestMapping("deleteDeviceGroup")
	public CDResult deleteDeviceGroup(HttpServletRequest req) {
		//首先校验是否有用户已经拥有该分组，如存在，返回失败警告；不存在，直接删除
		try {
			String id = req.getParameter("id");
			if (this.deviceGroupService.checkUserWithGroup(id) == 0) {
				this.deviceGroupService.deleteGroup(id);
				return CDResult.success();
			} else {
				return CDResult.fail("存在用户拥有该分组，请操作后再删除");
			}
		} catch (Exception e) {
			CDLogger.error(e.toString());
			return CDResult.fail("删除分组出现错误");
		}
		
 	}
	
	@ResponseBody
	@RequestMapping("getDeviceGroupList")
	public CDResult getDeviceGroupList(HttpServletRequest req) {
		try {
			return CDResult.success(this.deviceGroupService.getDeviceGroupList(((User)req.getSession().getAttribute(Constants.USER_CONTEXT)).getCompanyId()));
		} catch (Exception e) {
			CDLogger.error(e.toString());
			return CDResult.fail("获取设备分组错误");
		}
	}
	
	@ResponseBody
	@RequestMapping("addDeviceGroup")
	public CDResult addDeviceGroup (HttpServletRequest req) {
		String groupName = req.getParameter("groupName");
		try {
			this.deviceGroupService.addDeviceGroup(groupName, ((User)req.getSession().getAttribute(Constants.USER_CONTEXT)).getCompanyId());
			return CDResult.success();
		} catch (Exception e) {
			CDLogger.error(e.toString());
			return CDResult.fail("添加分组失败");
		}
	}
	
	@RequestMapping("getEditPage")
	public String getEditPage(@RequestParam("id")int id, HttpServletRequest req) {
		Map<String, Object> deviceGroup = this.deviceGroupService.getDeviceGroup(id);
		req.setAttribute("dg", deviceGroup);
		return "jsp/device_group_edit";
	}
	
	@ResponseBody
	@RequestMapping("editDeviceGroup")
	public CDResult editDevicerGroup(HttpServletRequest req) {
		try {
			int companyId = ((User)req.getSession().getAttribute(Constants.USER_CONTEXT)).getCompanyId();
			String groupId = req.getParameter("id");
			String deviceIds = req.getParameter("deviceIds")+"0";
			String groupName = req.getParameter("groupName");
			//首先将当前分组的设备分组号全部置空
			this.deviceService.updateDeviceGroupId2N(companyId, groupId);
			this.deviceService.updateDeviceGroupId(companyId, deviceIds, groupId);
			this.deviceGroupService.updateDeviceGroup(groupName, groupId);
			return CDResult.success();
		} catch (Exception e) {
			return CDResult.fail("修改分组失败");
		}
	}
	
	@RequestMapping("index")
	public String index() {
		return "jsp/device_group_list";
	}
}
