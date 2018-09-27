<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../tool/ui.jsp"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>这是你的江湖</title>
   	<style>
   		body{
   			padding: 0;
    		margin: 0;
    		overflow: hidden;
    		background: url(images/bg.jpg) center top repeat;
   		}
   	</style>
  </head>
  <body>
    <div class="layui-tab">
  		<ul class="layui-tab-title">
    		<li class="layui-this">网站设置</li>
		    <li>用户管理</li>
		    <li>权限分配</li>
		    <li>商品管理</li>
		    <li>订单管理</li>
  		</ul>
	  	<div class="layui-tab-content">
	    	<div class="layui-tab-item layui-show">内容1</div>
		    <div class="layui-tab-item">内容2</div>
		    <div class="layui-tab-item">内容3</div>
		    <div class="layui-tab-item">内容4</div>
		    <div class="layui-tab-item">内容5</div>
	  	</div>
	</div>
  </body>
  <script>
	layui.use('element', function(){
	  	var element = layui.element;
	});
</script>
</html>
