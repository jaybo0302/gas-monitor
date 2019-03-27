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
<title>添加设备分组</title>
</head>
<body>
<div class="pd-20">
  <div class="Huiform">
    <form action="${pageContext.request.contextPath}/deviceGroup/addDeviceGroup.do" method="post" class="form form-horizontal" id="form-deviceGroup-edit">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>船厂：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
				<select class="select" id="companyId" name="companyId">
					<option value="0">顶级分类</option>
					<option value="10">分类一级</option>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>分组名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"   id="groupName" name="groupName">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;添加&nbsp;&nbsp;">
			</div>
		</div>
	</form>
  </div>
</div>
</body>
<script type="text/javascript">
$(function(){
	if (${USER_CONTEXT.roleId} > 1) {
		$("#companyId").empty();
		var str = "<option value='${USER_CONTEXT.companyId}'>${USER_CONTEXT.companyName}</option>";
		$("#companyId").append(str);
	} else {
		$.get("${pageContext.request.contextPath}/company/getCompanyList.do",function(result) {
			var data = result.data;
			$("#companyId").empty();
			var str ="";
			for (var i = 0;i<data.length;i++) {
				str+=("<option value='"+data[i].id+"'>"+data[i].companyName+"</option>");
			}
			$("#companyId").append(str);
		});
	}
});
$("#form-deviceGroup-edit").validate({
	rules:{
		groupName:{
			required:true,
			minlength:2,
			maxlength:16
		},
	},
	onkeyup:false,
	focusCleanup:false,
	success:"valid",
	submitHandler:function(form){
		$(form).ajaxSubmit({
			success:function(data){
				if (data.success){
					alert("添加成功");
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