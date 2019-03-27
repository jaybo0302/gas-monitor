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
    <form action="${pageContext.request.contextPath}/deviceGroup/editDeviceGroup.do" method="post" class="form form-horizontal" id="form-DeviceGroup-edit">
		<input type="hidden" name="id" value="${dg.id}" />
		<input type="hidden" name="companyId" value="${dg.companyId}" />
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>分组名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"   id="groupName" name="groupName" value = "${dg.groupName}">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">设备选择：</label>
			<div class="formControls skin-minimal col-xs-5">
				<div class="check-box">
					<input type="checkbox" id="device_check_all"/>
					<label for="checkbox-all">全选</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"></label>
			<div class="formControls skin-minimal col-xs-9" id="deviceCheckbox">
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
	var groupId = "${dg.id}";
	var companyId = "${dg.companyId}";
	$.get("${pageContext.request.contextPath}/device/getDeviceList.do?companyId="+companyId,function(result) {
		var data = result.data;
		$("#deviceCheckbox").empty();
		
		var str ="";
		for (var i = 0;i<data.length;i++) {
			str += ("<div class='check-box'>");
			str += ("<input type='checkbox' value='"+data[i].deviceNo+"'");
			if (data[i].groupId == groupId) {
				str += (" checked name='device_check'");
			} else if (data[i].groupId != null){
				str += (" disabled name='unable_check'");
			} else {
				str += (" name='device_check'");
			}
			str + ">";
			str += ("<label for='device_check'>设备"+data[i].deviceNo+"</label>");
			str += ("</div>");
		}
		$("#deviceCheckbox").append(str);
		$('.skin-minimal input').iCheck({
			checkboxClass: 'icheckbox-blue',
			radioClass: 'iradio-blue',
			increaseArea: '20%',
		});
		$("input").on("ifChecked", function(){
			if(this.id == "device_check_all"){
				$("input[name='device_check']").each(function(){
					$(this).iCheck('check');
				});
			}
		});
		$("input").on("ifUnchecked", function(){
			if(this.id == "device_check_all"){
				$("input[name='device_check']").each(function(){
					$(this).iCheck('uncheck');
				});
			}
		});
	});
	
});

$("#form-DeviceGroup-edit").validate({
	rules:{
		groupName:{
			required:true,
			minlength:2,
			maxlength:16
		}
	},
	onkeyup:false,
	focusCleanup:false,
	success:"valid",
	submitHandler:function(form){
		var deviceIds="";
		$("input[name='device_check']").each(function(){
			if ($(this).is(":checked")) {
				deviceIds+=$(this).val()+",";
			}
		});
		$(form).ajaxSubmit({
			data:{id:$("#id").val(),deviceIds:deviceIds,groupName:$("#groupName").val()},
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