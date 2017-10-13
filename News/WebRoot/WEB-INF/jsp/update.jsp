<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/BeatPicker.min.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/BeatPicker.min.js"></script>
	<style type="text/css">
		tr{
		 text-align: center;
		}
	</style>
  </head>
  <body>
	<center>
  	<div>资讯信息列表</div>
	 <form action="${pageContext.request.contextPath }/updateNew">
  	<table>
	  <tr>
	 	<td><input type="checkbox"></td>
	    <td width="10%">资讯编号</td>
	    <td width="10%">资讯类别</td>
	    <td width="10%">标题</td>
	    <td width="10%">来源</td>
	    <td width="20%">创建时间</td>
	    <td width="10%">创建人</td> 
	  </tr>
	  <tr>
	    <td><input type="checkbox"></td>
	    <td><input type="hidden" value="${n.id }" name="id"/>${n.id }</td>
	    <td><input type="text" value="${n.sort }" name="sort"/></td>
	    <td><input type="text" value="${n.title }" name="title"/></td>
	    <td><input type="text" value="${n.origin }" name="origin"/></td>
	    <td><input type="text" value="<fmt:formatDate value="${n.create }" pattern="yyyy-MM-dd"/>" name="create" data-beatpicker="true"/></td>
	    <td><input type="text" value="${n.host }" name="host"/></td>
	  	
	  </tr>
	  <tr>
	  	<td colspan="6">
	  		<input type="submit" value="修改" style="font-size: 500px"/>
	  	</td>
	  </tr>  
	</table>	
	  </form>
	</center>
  </body>
</html>