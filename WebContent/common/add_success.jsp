<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title></title>
</head>
<body>
<center>
	操作成功！<p>
	<div id="info">本窗口将在3秒后自动关闭</div>
	<input type="button" value="关闭窗口" onclick="closewindow()">
</center>
  <script type='text/javascript' src='http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js'></script>
<script type='text/javascript' src='<%=path %>/layer/layer.js'></script>
<script type="text/javascript">
function closewindow()
{
	
	var index = parent.layer.getFrameIndex(window.name);  
	parent.layer.close(index); 
}
function clock()
{
	i = i -1;
	
	if(i > 0)
	{
	    document.getElementById("info").innerHTML = "本窗口将在"+i+"秒后自动关闭";
		setTimeout("clock();",1000);
	}
	else
	{
		closewindow();
	}
}

var i = 4;
clock();
</script>
</body>
</html>