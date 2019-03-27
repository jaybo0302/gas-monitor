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
<title>编辑用户</title>
</head>
<body>
<div class="pd-20">
  <div class="Huiform">
    <form action="${pageContext.request.contextPath}/user/editUser.do" method="post" class="form form-horizontal" id="form-user-edit">
		<input type="hidden" name="id" value="${u.id}"/>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>船厂：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
				<select class="select" id="company" name="companyId" disabled="disabled" >
					<option value="0">顶级分类</option>
					<option value="10">分类一级</option>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="userName" name="userName" value="${u.userName}">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="realName" name="realName" value="${u.realName}">
			</div>
		</div>
<!-- 		<div class="row cl"> -->
<!-- 			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>email：</label> -->
<!-- 			<div class="formControls col-xs-8 col-sm-9"> -->
<%-- 				<input type="text" class="input-text" name="email" id="email" value="${u.email}"> --%>
<!-- 			</div> -->
<!-- 		</div> -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="password" id="password" value="">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>角色：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
				<select class="select" id="role" name="roleId">
					<option value="0">顶级分类</option>
					<option value="10">分类一级</option>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">设备组选择：</label>
			<div class="formControls skin-minimal col-xs-5">
				<div class="check-box">
					<input type="checkbox" id="group_check_all" name="group_check_all">
					<label for="checkbox-all">全选</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"></label>
			<div class="formControls skin-minimal col-xs-9" id="deviceGroupCheckbox">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;确定&nbsp;&nbsp;">
			</div>
		</div>
	</form>
  </div>
</div>
<script type="text/javascript">

$(function(){
	$.ajax({
		url:"${pageContext.request.contextPath}/role/getRole.do",
		async:false,
		method:"GET",
		success:function(result) {
			var data = result.data;
			$("#role").empty();
			var str ="";
			for (var i = 0;i<data.length;i++) {
				str+=("<option value='"+data[i].id+"'>"+data[i].roleName+"</option>");
			}
			$("#role").append(str);
		},
	});
	$("#role").val("${u.roleId}");
});
$(function(){
	$.ajaxSettings.async = false;
	$.get("${pageContext.request.contextPath}/company/getCompanyList.do",function(result) {
		var data = result.data;
		$("#company").empty();
		var str ="";
		for (var i = 0;i<data.length;i++) {
			str+=("<option value='"+data[i].id+"'>"+data[i].companyName+"</option>");
		}
		$("#company").append(str);
	});
	$("#company").val("${u.companyId}");
	$.ajaxSettings.async = true;
});

$(function(){
	var companyId = "${u.companyId}";
	$.get("${pageContext.request.contextPath}/deviceGroup/getDeviceGroupList.do?companyId="+companyId,function(result) {
		var data = result.data;
		var groups ="${u.groups}";
		groups = "," + groups;
		$("#deviceGroupCheckbox").empty();
		var str ="";
		for (var i = 0;i<data.length;i++) {
			str += ("<div class='check-box'>");
			str += ("<input type='checkbox' value='"+data[i].id+"'name='group_check'");
			if (groups.indexOf("," + data[i].id + ",") > -1) {
				str += ("checked = 'checked'");
			}
			str + ">";
			str += ("<label for='group_check'>"+data[i].groupName+"</label>");
			str += ("</div>");
		}
		$("#deviceGroupCheckbox").append(str);
		$('.skin-minimal input').iCheck({
			checkboxClass: 'icheckbox-blue',
			radioClass: 'iradio-blue',
			increaseArea: '20%'
		});
		$("input").on("ifChecked", function(){
			if(this.id == "group_check_all"){
				$("input[name='group_check']").each(function(){
					$(this).iCheck('check');
				});
			}
		});
		$("input").on("ifUnchecked", function(){
			if(this.id == "group_check_all"){
				$("input[name='group_check']").each(function(){
					$(this).iCheck('uncheck');
				});
			}
		});
	});
});

$("#form-user-edit").validate({
	rules:{
		userName:{
			required:true,
			minlength:2,
			maxlength:16
		},
		realName:{
			required:true,
		}
	},
	onkeyup:false,
	focusCleanup:false,
	success:"valid",
	submitHandler:function(form){
		var groups="";
		$("input[name='group_check']").each(function(){
			if ($(this).is(":checked")) {
				groups+=$(this).val()+",";
			}
		});
		$(form).ajaxSubmit({
			data:{groups:groups},
			success:function(data){
	            if(data.success){
	            	alert("用户编辑成功");
	            	parent.location.reload();
	            	var index = parent.layer.getFrameIndex(window.name);
	        		parent.layer.close(index);
	            }else{
	                layer.msg(data.message,{icon: 5,time:2000});
	            }
			}}
		);
	}
});

</script>
</body>
</html>