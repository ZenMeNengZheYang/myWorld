<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="tool/ui.jsp"%>

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
   		iframe{
   			width:100%;
   			height:66%;
		    border: 0;
		    border-radius: 5px;
		    margin-top: 2px;
   		}
   	</style>
  </head>
  <body>
    <div class="container">
    	<img src="images/timg.png">
    	<h1></h1>
    	<!-- 导航区 -->
		<ul class="nav nav-tabs" role="tablist">
		  <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab">Home</a></li>
		  <li role="presentation"><a href="#profile" role="tab" data-toggle="tab">Profile</a></li>
		  <li role="presentation"><a href="#messages" role="tab" data-toggle="tab">Messages</a></li>
		  <li role="presentation"><a href="#settings" role="tab" data-toggle="tab">Settings</a></li>
		</ul>
		 
		<!-- 面板区 -->
		<div class="tab-content">
		  <div role="tabpanel" class="tab-pane active" id="home">
		  	<iframe src="getModule"></iframe>
		  </div>
		  <div role="tabpanel" class="tab-pane" id="profile">
		  	<iframe src="getModule2"></iframe>
		  </div>
		  <div role="tabpanel" class="tab-pane" id="messages">33</div>
		  <div role="tabpanel" class="tab-pane" id="settings">44</div>
		</div>
    </div>
  </body>
</html>
