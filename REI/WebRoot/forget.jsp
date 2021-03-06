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
    <link href="css/forget.css" rel="stylesheet">
    <link href="./custom/uimaker/easyui.css" rel="stylesheet" >
 </head>
<body>
	<div class="forget-hd">
		<div class="left-bg"></div>
		<div class="right-bg"></div>
		<div class="hd-inner">
			<span class="logo"></span>
			<span class="split"></span>
			<span class="sys-name">报销平台</span>
		</div>
	</div>
	<div class="forget-fm">
			<form action="user!forget.action" method="post">
			    <div class="email">
			        <center><h1 style="font-size: x-large!important;">忘记密码?</h1></center>
			        <br/>
			        <center>
			                <div>
					             <input type="text" placeholder="请输入邮箱" name="email" style="width:250px;height:35px;vertical-align:middle;">
					        </div>
					</center>
					<br/>
					<br/>
					<center>
			                <div>					         
								 <input type="text" placeholder="验证码" name ="checkcode" style="width:150px;height:35px;vertical-align:middle;" />
								 <span ><img src="PictureCheckCode.Servlet" id="ckcode" style="width:100px;height:36px;vertical-align:middle;" onclick="refresh()"></img></span>
					        </div>
					</center>
					<br/>
					<center>
					       <div align="center">
								<a href="./login.jsp" >登录</a>
					       </div>
					</center>
					<br/>
				    <center><input type="submit" class="submit" value="提交"/></center>
				    <br/>
                    <br/>
                    <%-- <center><b style="color: rgba(0, 0, 255, 0.94);">${emailinfo}</b></center> --%>
				</div>
			</form>
	</div>
	<br>
	<br>
	<br>
	<br>
	<div class="forget-ft">
		<div class="ft-inner">
			<div class="about-us">
				<a href="javascript:;">关于我们</a>
				<a href="javascript:;">法律声明</a>
				<a href="javascript:;">服务条款</a>
				<a href="javascript:;">联系方式</a>
			</div>
			<div class="address">地址：暨南大学建阳院14栋225室&nbsp;邮编：5106329&nbsp;&nbsp;Copyright&nbsp;©&nbsp;2015&nbsp;-&nbsp;2017&nbsp;关步青&nbsp;版权所有</div>
			<div class="other-info">E-mail：673840304@qq.com</div>
		</div>
	</div>
	<input type="hidden" id="msg"  value="${msg}"/>     <!-- 显示错误 -->
	<input type="hidden" id="emailinfo"  value="${emailinfo}"/>     <!-- 显示错误 -->
	
	<script type="text/javascript" src="./custom/jquery.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="./custom/jquery.cookie.js" charset="utf-8"></script>
	<script type="text/javascript" src="./custom/jquery.easyui.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="./custom/easyui-lang-zh_CN.js" charset="utf-8"></script>
	<script type="text/javascript">
        //操作错误提示
       var msg = "${msg}";
       if(msg!=null&&msg!=""){
      		$(function(){
      			$.messager.show({
      				title:"错误信息!",
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
      
      //显示结果
      var emailinfo="${emailinfo}";
      if(emailinfo!=null&&emailinfo!=""){
      		$(function(){
      			$.messager.show({
      				title:"错误信息!",
      				msg:emailinfo,
      				showType:'fade',
      				timeout:1500,
      				style:{
      					right:'',
      					bottom:''
      				}
      			});
      		});   	
      }
        
       //刷新验证码
       function refresh()
       {
          var code=document.getElementById("ckcode");
          code.src='PictureCheckCode.Servlet?now='+Math.random();
       }
    </script>
</body> 
</html>