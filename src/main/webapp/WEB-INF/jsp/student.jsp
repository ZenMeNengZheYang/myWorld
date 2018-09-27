<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="tool/ui.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>同学好</title>
  </head>
  
  <body>
  	<table class="table table-bordered">
  		<thead>
  			<tr>
  				<td>1</td>
  			</tr>
  		</thead>
  		<tbody>
  			<c:forEach items="${list }" var="list">
  				<tr>
	  				<td>${list.id }</td>
	  				<td>${list.name }</td>
	  				<td>${list.sex }</td>
	  				<td>${list.age }</td>
	  			</tr>
  			</c:forEach>
  		</tbody>
  	</table>
  </body>
</html>
