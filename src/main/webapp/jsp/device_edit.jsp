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
<!--[if lt IE 9]><![endif]-->
<%@include file="static.jsp" %>
<script src="${pageContext.request.contextPath}/lib/zTree/v3/js/jquery.ztree.core-3.5.js"></script>  
<script src="${pageContext.request.contextPath}/lib/zTree/v3/js/jquery.ztree.excheck-3.5.js"></script>  
<script src="${pageContext.request.contextPath}/lib/zTree/v3/js/jquery.ztree.exedit-3.5.js"></script> 
<link href="${pageContext.request.contextPath}/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" />
<title>编辑船厂</title>
</head>
<body>
<div class="pd-20">
  <div class="Huiform">
    <form action="${pageContext.request.contextPath}/device/editDevice.do" method="post" class="form form-horizontal" id="form-device-edit">
		<input type="hidden" name="deviceNo" value="${device.deviceNo}" />
		<input type="hidden" name="companyId" value="${device.companyId}" />
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">设备组选择：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
				<select class="select" id="groupId" name="groupId">
					<option value="0">顶级分类</option>
					<option value="10">分类一级</option>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;修改&nbsp;&nbsp;">
			</div>
		</div>
	</form>
  </div>
</div>
</body>
<script type="text/javascript">
$(function() {
	var companyId = "${device.companyId}";
	$.ajax({
		url:"${pageContext.request.contextPath}/deviceGroup/getDeviceGroupList.do?companyId=" + companyId,
		async:false,
		method:"GET",
		success:function(result) {
			var data = result.data;
			$("#groupId").empty();
			var str ="<option value='0'>未分组</option>";
			for (var i = 0;i<data.length;i++) {
				str+=("<option value='"+data[i].id+"'>"+data[i].groupName+"</option>");
			}
			$("#groupId").append(str);
		},
	});
	$("#groupId").val("${device.groupId}");
});

$("#form-device-edit").validate({
	onkeyup:false,
	focusCleanup:false,
	success:"valid",
	submitHandler:function(form){
		$(form).ajaxSubmit({
			success:function(data){
				if (data.success){
					alert("修改成功");
					parent.location.reload();
					var index = parent.layer.getFrameIndex(window.name);
	        		parent.layer.close(index);
				} else {
					layer.msg(data.message,{icon:5,time:2000});
				}
			}
		});
	}
});
</script>
</html>