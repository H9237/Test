<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  	<table>
  		<tr>
  			<form action="javascript:;">
  			<td>资讯编号：<input type="text" name="id"></td>
  			<td>资讯标题：<input type="text" name="title"></td>
  			<td align="right">创建时间：</td>
  			<td align="left"><input type="text" name="create" data-beatpicker="true"></td>
  			<td><input type="submit" value="搜索" id="submit"></td>
  			</form>
  		</tr>
  	</table>
  	<div>资讯信息列表</div>
  	<table>
	  <tr>
	 	<th><input type="checkbox"></th>
	    <th width="10%">资讯编号</th>
	    <th width="10%">资讯类别</th>
	    <th width="10%">标题</th>
	    <th width="10%">来源</th>
	    <th width="20%">创建时间</th>
	    <th width="10%">创建人</th>
	    <th>管理</th>	    
	  </tr>
<%-- 	  <c:forEach items="${pageBean.list }" var="n">
	  <tr>
	    <td><input type="checkbox"></td>
	    <td>${n.id }</td>
	    <td>${n.sort }</td>
	    <td>${n.title }</td>
	    <td>${n.origin }</td>
	    <td>${n.create }</td>
	    <td>${n.host }</td>
	    <td><a href="javascript:;">编辑</a> <a href="javascript:;">修改</a> <a href="javascript:;">删除</a></td>
	  </tr>
	  </c:forEach> --%>
	  <tr id=t1>
	  	<td><input type="button" value="删除"></td>
	  	<td align="right" colspan="5" id=page></td>
	  	<td align="right" colspan="1" id=page2></td>
	  	<td align="right" colspan="1" id=page1></td>
	  </tr>
	</table>
	</center>
  </body>
</html>


<script type="text/javascript">
$(function(){
	
	list(1);
});
var page=function(num){
	$(".data").remove();
	var pageNum=num.innerText;
	list(pageNum);
	$(this).removeAttr("onclick");
};
var list=function(pageNum){
	var t1=$("#t1");
	var p=$("#page");
	var p2=$("#page2");
	var p1=$("#page1");
	$.get("getNews/"+pageNum,function(obj){
		 $.each(obj.list,function(index,n){
		 	//var time=jsonDateFormat(n.create);
		 	var tr=$("<tr class='data'><td><input type='checkbox'></td><td>"+n.id+"</td><td>"+n.sort+"</td><td>"+n.title+"</td><td>"+n.origin+"</td><td>"+n.create+"</td><td>"+n.host+"</td><td><a href='${pageContext.request.contextPath }/getNewById/"+n.id+"' style='text-decoration: none;'>编辑</a> <a href='' style='text-decoration: none;'>修改</a> <a href='delNewById/"+n.id+"' style='text-decoration: none;'>删除</a></td></tr>")
			t1.before(tr);
		}); 
		p.html("当前第"+obj.pageNum+"页");
		p1.html("共"+obj.pageSum+"页");
		p2.html("");
		for(var i = 1; i <= obj.pageSum; i++){
			p2.append("<a href='javascript:;' onclick=page(this) style='text-decoration: none;'>"+i+"</a> ");
		}
	},"JSON");
};
$("#submit").click(function(){
	$(".data").remove();
	var t1=$("#t1");
	var p=$("#page");
	var p2=$("#page2");
	var p1=$("#page1");
	var data=$("input").serialize();
	$.get("getNewsById/1",data,function(obj){
		 $.each(obj.list,function(index,n){
		 	var time=jsonDateFormat(n.create);
		 	var tr=$("<tr class='data'><td><input type='checkbox'></td><td>"+n.id+"</td><td>"+n.sort+"</td><td>"+n.title+"</td><td>"+n.origin+"</td><td>"+time+"</td><td>"+n.host+"</td><td><a href='javascript:;' style='text-decoration: none;'>编辑</a> <a href='javascript:;' style='text-decoration: none;'>修改</a> <a href='javascript:;' style='text-decoration: none;'>删除</a></td></tr>")
			t1.before(tr);
		}); 
		p.html("当前第"+obj.pageNum+"页");
		p1.html("共"+obj.pageSum+"页");
		p2.html("");
		for(var i = 1; i <= obj.pageSum; i++){
			p2.append("<a href='javascript:;' onclick=page(this) style='text-decoration: none;'>"+i+"</a> ");
		}
	},"JSON");
});
function jsonDateFormat(jsonDate) {
//json日期格式转换为正常格式
	var jsonDateStr = jsonDate.toString();//此处用到toString（）是为了让传入的值为字符串类型，目的是为了避免传入的数据类型不支持.replace（）方法
	try {
		var date = new Date(parseInt(jsonDateStr.replace("/Date(", "").replace(")/", ""), 10));
		var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
		var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
		var hours = date.getHours();
		var minutes = date.getMinutes();
		var seconds = date.getSeconds();
		var milliseconds = date.getMilliseconds();
		return date.getFullYear() + "-" + month + "-" + day;
	} catch (ex) {
		return "时间格式转换错误";
	}
}
</script>