<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap/bootstrap.min.css" />
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
  <script src="<%=basePath%>js/jquery.js"></script>
  <script src="<%=basePath%>js/bootstrap/bootstrap.min.js"></script>
</html>
