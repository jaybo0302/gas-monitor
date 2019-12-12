<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<%@include file="static.jsp" %>
<link href="${pageContext.request.contextPath}/css/pagination.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/highlight.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css" />
<title>用户管理</title>
<%
	String contextPath = request.getContextPath();
%>
</head>

<body>
	<br/>
	<div>
		<span>&nbsp;共&nbsp;</span><i id="totalCount">0</i><span>&nbsp;条数据</span>
	</div>
	<table class="table table-border table-bordered table-hover table-bg table-sort" id ="deviceTable">
	</table>
	<br/>
	
	<div class="m-style M-box1" style="float:right;"></div>
	<input type="hidden" id = "pageNo"/> 
</div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cd-table.js"></script>
<script type="text/javascript">
	var pageSize = 10;
	var contextPath = "<%=contextPath%>";
    var tableParam = [{"field":"设备号",
		   		       "name":"deviceNo"}
    				 ,{"field":"船厂名称",
    				   "name":"companyName"}
    				 ,{"field":"分组名称",
      				   "name":"groupName"}
    				 ,{"field":"最近使用时间",
    				   "name":"createTimeStr"}
    				 ,{"field":"位置",
    				   "name":"position",
    				   formatter:function(position){
    					   if (position == null ) {
    						   return "未设置位置";
    					   } else {
    						   return position;
    					   }
    				   }}
    				 ,{"field":"操作",
    				   "name":"operate",
    				   "operates":[
    					   {"title":"分组",
    						"icon":"&#xe6df;",
    						"function":"editDevice",
    						"param":"deviceNo,companyId"}
    				   ]}];
	var moduleName = "device";
	
	function editDevice(id,deviceNo,companyId) {
		layer_show("编辑设备","${pageContext.request.contextPath}/device/getEditPage.do?id="+deviceNo+"&companyId="+companyId,800,500);
	}
</script>
</html>