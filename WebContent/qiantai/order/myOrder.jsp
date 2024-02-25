<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<link href="css/Common.css" rel="stylesheet" type="text/css" />
    <link href="css/sitegeneric08.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
      <script type='text/javascript' src='<%=path %>/js/jquery.min.js'></script>
<script type='text/javascript' src='<%=path %>/layer/layer.js'></script>
	<script type="text/javascript">
        function orderDel(orderId)
        {
            var url="<%=path %>/orderDel.action?orderId="+orderId;
            window.location.href=url;
        }
        
        function orderDetail(orderId)
        {
                 var url="<%=path %>/orderDetail.action?orderId="+orderId;
                 var n="";
                 var w="700px";
                 var h="700px";
                index= layer.open({
					  type: 2,
					  skin: 'layui-layer-rim', //加上边框
					  area: ['700px', '700px'], //宽高
					  content: [url]
					});
                return false;
        }
    </script>
  </head>
  
  <body>
<!-- head如果图片高度不合适。请修改Common.ces里面的".Header .HeaderTop"的高度。和".Header"的高度-->
<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>    
<!-- head-->
	
	
	
	
<!--body-->
<div align="center" class="Wrapper">
<div id="MainCenter" align="center" class="MainCenter">
	     <div id="navigation" class="naivgation">
				<div class="SquarelyGreenContainer">
					<div class="top">
						<div class="bgbtop-center">
							<span><a href="">用户登陆</a></span>
							<div class="WinRight"></div>
						</div>
					</div>
					<div class="Slot">
					    <jsp:include flush="true" page="/qiantai/userlogin/userlogin.jsp"></jsp:include>
					</div>
				 </div>
				 <div class="SquarelyGreenContainer">
					<div class="top">
						<div class="bgbtop-center">
							<span><a href="">电影查询</a></span>
							<div class="WinRight"></div>
						</div>
					</div>
					<div class="Slot">
					    <form action="<%=path %>/goodsSearch.action" name="from1" method="post">
					        <input type="text" name="goodsName"/>
					        <input type="submit" value="查询"/>
					    </form>
					</div>
				 </div>
				 <div class="SquarelyGreenContainer">
					<div class="top">
						<div class="bgbtop-center">
							<span><a href="">电影类别</a></span>
							<div class="WinRight"></div>
						</div>
					</div>
					<div class="Slot">
					    <s:action name="catelogAll" executeResult="true" flush="true"></s:action>
					</div>
				 </div>
				 <div class="SquarelyGreenContainer">
					<div class="top">
						<div class="bgbtop-center">
							<span><a href="">日历表</a></span>
							<div class="WinRight"></div>
						</div>
					</div>
					<div class="Slot">
					    <jsp:include flush="true" page="/qiantai/rili/rili.jsp"></jsp:include>
					</div>
				 </div>
		 </div>
		 <div id="content" class="Sub">
				<div class="NewContainer771">
					<div class="BoxHeader">
						<div class="BoxHeader-center MarginTop10">我的订单</div>
					</div>
					<div class="Slot">
						<table width="99%" border="0" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" align="center" style="margin-top:8px">
				              <tr align="center" bgcolor="#FAFAF1" height="22">
				                  <td>订单编号</td>
				                  <td>金额</td>
				                  <td>下单日期</td>
				                  <td>订单状态</td>
				                  <td>编辑</td>
				              </tr>
							  <s:iterator value="#request.orderList" id="order">
							  <tr align='center' bgcolor="#FFFFFF" height="22">
								  <td>
									<s:property value="#order.orderBianhao"/>
								  </td>
								  <td>￥<s:property value="#order.orderJine"/><br/></td>
								  <td><s:property value="#order.orderDate"/></td>
								  <td>
								      <s:if test="#order.orderZhuangtai=='no'">
								            已下单，未受理
								      </s:if>
								      <s:if test="#order.orderZhuangtai=='yes'">
								            已下单，已受理
								      </s:if>
	                              </td>
								  <td>
								      <a href="#" onclick="return orderDetail(<s:property value="#order.orderId"/>)">订单明细</a>
								      &nbsp;&nbsp;
								      <a href="#" onclick="orderDel(<s:property value="#order.orderId"/>)">删除</a>
								  </td>
							  </tr>
							  </s:iterator>
	        			</table>
                    </div>
				</div>
		 </div>
</div>
</div>
<!--body-->
	
	
	
<!--foot -->	
<div align="center" class="Wrapper">
	<div id="footer" align="center" class="Footer">
		 <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	</div>
</div>
<!--foot -->	
</body>
</html>
