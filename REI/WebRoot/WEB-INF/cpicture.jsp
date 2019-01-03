<%@ page language="java" import="java.util.*" contentType="text/html;charaset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>证件照片</title> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
	<meta http-equiv="pragma" content="no-cache">                         <!--这几句meta作用是清除浏览器中的缓存,再次进入曾经访问过的页面时，浏览器必须从服务端下载最新的内容，达到刷新的效果。 -->
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">     <!--最后两句meta,做seo用 -->
	<meta http-equiv="description" content="This is my page">
	
	<!--<link rel="stylesheet" type="text/css" href="styles.css">-->
    <link rel="stylesheet" href="./css/cpicture.css" >
    <link href="./custom/uimaker/easyui.css" rel="stylesheet" >
  </head>
  
  <body>
       <form action="upload!uploadpicture.action?type=cp" method="post" enctype="multipart/form-data" >   
           <div class="upload">   
               <center><h1 style="font-size: x-large!important;">上传证件照片</h1></center>                              
               <center>选择照片：<input type="file" id="photo" name="file" onchange="checkImg()"/></center> 
               <br/>  
               <center><input type="submit" class="submit" id="btnupload" name="btnupload" value="开始上传" onclick="return check()" /> </center>
           </div>
       </form>
       <script type="text/javascript" src="./custom/jquery.min.js" charset="utf-8"></script>
	   <script type="text/javascript" src="./custom/jquery.cookie.js" charset="utf-8"></script>
	   <script type="text/javascript" src="./custom/jquery.easyui.min.js" charset="utf-8"></script>
	   <script type="text/javascript" src="./custom/easyui-lang-zh_CN.js" charset="utf-8"></script>
       <script type="text/javascript">
       		//操作结果！
      		var msg = "${uploadpstatus}";
      		if(msg!=null&&msg!=""){
      			$(function(){
      				$.messager.show({
      					title:"操作结果!",
      					msg:msg,
      					showType:'fade',
      					timeout:1500,
      					//中间
      					style:{ 
      						right:'',
      						bottom:''
      					}
      				});
      			});   	
      		}
       
            //检查有没有选择照片
            function check(){
               var img=$("#photo").val();
               if(img.length==0){  
                 alert("请先选择上传文件");  
                 return false;  
               }  
            }
            
            //检查文件是不是照片类型和大小限制
            function checkImg(){    
                  var errMsg = "上传的附件文件不能超过2M！！！";  
                  var tipMsg="您的浏览器暂不支持计算上传文件的大小，确保上传文件不要超过2M，建议使用IE、FireFox、Chrome浏览器";
                  var maxsize = 2*1024*1024;    //不能超过2M
                  var filesize=0;               //w文件大小
                  var img=$("#photo").val();    //根据id得到值
                  var index= img.indexOf(".");  //得到"."在第几位
                  img=img.substring(index);     //截断"."之前的，得到后缀
                  if(img!=".bmp" && img!=".png" && img!=".gif" && img!=".jpg" && img!=".jpeg"){  //根据后缀，判断是否符合图片格式
                     alert("不是指定图片格式,重新选择"); 
                     $("#photo").val("");       // 不符合，就清除，重新选择
                  }else{
                       filesize = document.getElementById("photo").files[0].size;  //获取照片的大小  
                       if(filesize==-1){  
                          alert(tipMsg);  
                          return false;  
                       }else if(filesize>maxsize){  
                          alert(errMsg);  
                          $("#photo").val("");       // 不符合，就清除，重新选择
                          return false;
                       }  
                  }  
            }
       </script>
  </body>
</html>
