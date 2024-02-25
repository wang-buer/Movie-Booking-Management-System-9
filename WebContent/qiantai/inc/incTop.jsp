<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <style type="text/css">
        .Header {CLEAR: both; DISPLAY: block; FLOAT: left; BACKGROUND-IMAGE: url(<%=path %>/img/reservation01.jpg); WIDTH: 972px; POSITION: relative; HEIGHT: 110px}
        .Header .HeaderTop {HEIGHT: 70px}
    </style>
    
  </head>
  
  <body>
	 <div align="center" class="Wrapper">
		 <div class="Header">
			 <div class="HeaderTop">
				    <br/>
				    <font size="22px;">欢迎光临电影预订网</font>
				</div>
				<div id="Menu" class="Menu">
					<div id="fstMenu" class="fstMenu"></div>
					<div class="secMenu">
						<span id="secMenu0" class="secMenu-center">
						     <a href="<%=path %>/qiantai/default.jsp">系统首页</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						     <A href="#" onclick="myCart()">我的订票车</A>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp
						     <A href="#" onclick="myOrder()">我的订单</A>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp
							 <a href="#" onclick="return myXinxi()">我的信息</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							 <a href="#" onclick="liuyanAll()">留言板</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							 <a target="_blank" href="<%=path %>/login.jsp">进入后台</a>
						</span>
					</div>
				</div>	
		 </div>
     </div>	
  </body>
  <script type='text/javascript' src='<%=path %>/js/jquery.min.js'></script>
<script type='text/javascript' src='<%=path %>/layer/layer.js'></script>
  <script type="text/javascript">
        function myXinxi()
	        {
	            <s:if test="#session.user==null">
	                  alert("请先登录");
	            </s:if>
	            
	            <s:else>
	                var url="<%=path %>/qiantai/userinfo/userXinxi.jsp";
	              var index= layer.open({
					  type: 2,
					  skin: 'layui-layer-rim', //加上边框
					  area: ['480px', '500px'], //宽高
					  content: [url]
					});
	                	return false;
	            </s:else>
	        }
	        function myCart()
	        {
	            <s:if test="#session.user==null">
	                  alert("请先登录");
	            </s:if>
	            
	            <s:else>
	                 var s="<%=path %>/myCart.action";
	                 window.location.href=s;
	                 window.event.returnValue=false;
	            </s:else>
	        }
	        
	        function myOrder()
	        {
	            <s:if test="#session.user==null">
	                  alert("请先登录");
	            </s:if>
	            
	            <s:else>
	                 var s="<%=path %>/myOrder.action";
	                 window.location.href=s;
	                 window.event.returnValue=false;
	            </s:else>
	        }
	        
	        function liuyanAll()
	        {
	            <s:if test="#session.user==null">
	                  alert("请先登录");
	            </s:if>
	            
	            <s:else>
	                 var url="<%=path %>/liuyanAll.action";
				     window.open(url,"_blank");
	            </s:else>
	        }
        
    </script>
</html>
