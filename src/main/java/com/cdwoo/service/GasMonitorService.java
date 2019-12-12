package com.cdwoo.service;

public interface GasMonitorService {
	public Object getGasInfo(int userId);
	public Object getGasInfo4App(int no, int companyId);
	public Object getGasInfo4Appv2(int no, int companyId, int groupId, String userName);
	public Object getGasWarn4App(String start, String end, String deviceId, String companyId);
	public void setPosition(String deviceNo, String position, int companyId);
}
