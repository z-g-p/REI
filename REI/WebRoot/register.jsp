<%@ page language="java" import="java.util.*" contentType="text/html;charaset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    
    <title>高校医疗报销系统</title> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
	<meta http-equiv="pragma" content="no-cache">                          <!--这几句meta作用是清除浏览器中的缓存,再次进入曾经访问过的页面时，浏览器必须从服务端下载最新的内容，达到刷新的效果。 -->
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">      <!--最后两句meta,做seo用 -->
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link href="css/base.css" rel="stylesheet">
    <link href="css/register.css" rel="stylesheet">
    <link href="./custom/uimaker/easyui.css" rel="stylesheet" >
 </head>
<body>
	<div class="register-hd">
		<div class="left-bg"></div>
		<div class="right-bg"></div>
		<div class="hd-inner">
			<span class="logo"></span>
			<span class="split"></span>
			<span class="sys-name">报销平台</span>
		</div>
	</div>
	<div class="register-bd">
		<div class="bd-inner">
			<div class="inner-wrap">
				<div class="lg-zone">
					<div class="lg-box">
						<div class="lg-label"><h4>用户注册</h4></div>
						<form action="user!register.action" method="post">
							<div class="lg-username input-item clearfix">
								<i class="iconfont">&#xe60d;</i>
								<input type="text" placeholder="账号/邮箱" name="entity.account">
							</div>
							<div class="lg-password input-item clearfix">
								<i class="iconfont">&#xe634;</i>
								<input type="password" placeholder="请输入密码" name="entity.password">
							</div>
							<div class="lg-password input-item clearfix">
								<i class="iconfont">&#xe6bd;</i>
								<input type="text" placeholder="请输入邮箱" name="entity.email">
							</div>
							<div class="lg-password input-item clearfix">
								<i class="iconfont">&#xe671;</i>
								<input type="text" placeholder="请输入姓名" name="entity.name">
							</div>	
							<div align="center">
								<select name="entity.sex" style="height:30px;width:300px">
								     <option value="没选" selected="selected">请选择你的性别</option>
								     <option value="男">男</option>
								     <option value="女">女</option>
								</select>
							</div>
							<br/>
							<br/>
							<div align="center">
								<select name="entity.identitys" style="height:30px;width:300px">
								     <option value="没选" selected="selected">请选择你的身份</option>
								     <option value="学生">学生</option>
								     <option value="老师">老师</option>
								     <option value="在职">在职</option>
								     <option value="合同工">合同工</option>
								     <option value="退休人士">退休</option>
								     <option value="审批人">审批人</option>
								     <option value="财务部">财务部</option>
								</select>
							</div>
							<br/>
							<br/>
							<div class="lg-credential_number input-item clearfix">
								<i class="iconfont">&#xe6d7;</i>
								<input type="text" placeholder="请输入证件号" name="entity.credential_number">
							</div>
							<div class="lg-credential_number input-item clearfix">
								<i class="iconfont">&#xe6d7;</i>
								<input type="text" placeholder="请输入身份证" name="entity.idcard_number">
							</div>
							<div class="lg-credential_number input-item clearfix">
								<i class="iconfont">&#xe648;</i>
								<input type="text" placeholder="请输入部门" name="entity.department">
							</div>
							<div align="center">
								<a href="./login.jsp" >登录</a>
							</div>
							<div align="center">
								<input type="submit" class="register" value="注册"/>
							</div>
						</form>
					</div>
				</div>
				<div class="lg-poster"></div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<div align="center">

			<div class="address">地址：暨南大学建阳院14栋225室&nbsp;邮编：5106329&nbsp;&nbsp;Copyright&nbsp;©&nbsp;2015&nbsp;-&nbsp;2017&nbsp;关步青&nbsp;版权所有</div>
			<div class="other-info">E-mail：673840304@qq.com</div>
	</div>
	<input type="hidden" id="msg" value="${msg}"/>
	
    <script type="text/javascript">
       var msg = "${msg}";
          if(msg!=null&&msg!="")
          {
          	$(function(){
      			$.messager.show({
      				title:"注册信息!",
      				msg:msg,
      				showType:'fade',
      				timeout:1500,
      				style:{
      					right:'',
      					bottom:''
      				}
      			});
      		}); 
          }
    </script>
</body> 
</html>