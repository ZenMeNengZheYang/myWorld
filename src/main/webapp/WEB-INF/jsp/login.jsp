<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="tool/ui.jsp"%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>登录</title>
	    <style type="text/css">
	        body {
	            padding-top: 50px;
	        }
	        .starter-template {
	            padding: 40px 15px;
	            text-align: center;
	        }
	    </style>
	</head>
<body>
	<div class="container">
	    <div class="starter-template">
	        <h2>使用账号密码登录</h2>
	        <form class="form-signin" role="form" name="form" action="login" method="post">
	            <div class="form-group">
	                <label for="username">账号</label>
	                <input type="text" class="form-control" name="username" value="" placeholder="账号"/>
	            </div>
	            <div class="form-group">
	                <label for="password">密码</label>
	                <input type="password" class="form-control" name="password" placeholder="密码"/>
	            </div>
	            <input type="submit" id="login" value="Login" class="btn btn-primary"/>
	        </form>
	    </div>
	</div>
</body>
</html>