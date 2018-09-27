<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../tool/ui.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <style type="text/css">
    	.left_div{
    		float:left;
    		width:50%;
    	}
    	.right_div{
    		float:left;
    		width:50%;
    	}
    </style>
  </head>
  
  <body>
  	<div class="left_div">
  		<div class="layui-card">
	  		<div class="layui-card-header">查看</div>
		  	<div class="layui-card-body">
		  		<ul id="regionZTree" class="ztree"></ul>
		  	</div>
		</div>
  	</div>
  	<div class="right_div">
  		<div class="layui-card">
	  		<div class="layui-card-header">新增</div>
		  	<div class="layui-card-body">
		  		<form id="addModule" class="layui-form">
		  			<div class="layui-form-item">
				    	<label class="layui-form-label">层级</label>
			    		<div class="layui-input-block">
			      			<select name="moduleClass" lay-filter="moduleClassChange">
						        <option value="1">一级</option>
						        <option value="2">二级</option>
						        <option value="3">三级</option>
			      			</select>
			    		</div>
				  	</div>
				  	<div class="layui-form-item">
				    	<label class="layui-form-label">名称</label>
				    	<div class="layui-input-block">
				      		<input type="text" name="name" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
				    	</div>
				  	</div>
				  	<div class="layui-form-item" style="display:none;" id="higherUp_div">
				    	<label class="layui-form-label">上层</label>
			    		<div class="layui-input-block">
			      			<select id="higherUp" name="higherUp"></select>
			    		</div>
				  	</div>
				  	<div class="layui-form-item">
				    	<label class="layui-form-label">排序</label>
				    	<div class="layui-input-block">
				      		<input type="text" name="rank" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
				    	</div>
				  	</div>
				  	<div class="layui-form-item" style="display:none;" id="moduleUrl_div">
				    	<label class="layui-form-label">url</label>
				    	<div class="layui-input-block">
				      		<input type="text" name="moduleUrl" placeholder="请输入标题" autocomplete="off" class="layui-input">
				    	</div>
				  	</div>
				  	<div class="layui-input-block">
				      	<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				      	<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				    </div>
				</form>
		  	</div>
		</div>
  	</div>
  </body>
  <script>
  	var zNodes = ${module};
  	var moduleClass = ${moduleClass};
  	layui.use('form', function(){
	  	var form = layui.form;
	  	form.on('submit(formDemo)', function(data){
	  		$.ajax({
	  			type:"post",
	  			dataType:"json",
	  			url:"addModule",
	  			data:$('#addModule').serialize(),
	  			success:function(data){
	  				layer.msg(data.msg);
	  			}
	  		})
	  		window.setTimeout("window.location.reload(true)", 2000);
	  		return false;
	  	});
	  	form.on('select(moduleClassChange)', function(data){
		  	if(data.value != 1){
		  		$("#higherUp_div").show();
		  		$("#moduleUrl_div").show();
		  		addHigherUp();
		  		form.render('select');
		  	}else{
		  		$("#higherUp_div").hide();
		  		$("#moduleUrl_div").hide();
		  		$("#higherUp").empty();
		  		form.render('select');
		  	}
		});
	  	form.render();
	});
	
	function addHigherUp(){
		$.each(moduleClass,function(i){
			$("#higherUp").append("<option value='"+moduleClass[i].id+"'>"+moduleClass[i].name+"</option>");
		})
	}
	
  	var setting = {
  		view: {
	        dblClickExpand: false,
	        showLine: true,
	        selectedMulti: false
      	},edit: {
			enable: true,
			showRenameBtn: true
		},data: {
        	simpleData: {
	          	enable: true,
	          	idKey: "id",
	          	pIdKey: "higherUp",
	          	rootPId: ""
        	}
      	},callback: {
      		onRemove: onRemove,
      		onRename: onRename
      	}
  	};
	zTreeObj = $.fn.zTree.init($("#regionZTree"), setting, zNodes);
	
	function onRemove(e, treeId, treeNode) {
		$.ajax({
  			type:"post",
  			dataType:"json",
  			url:"delModule",
  			data:{
  				id: treeNode.id
  			},
  			success:function(data){
  				layer.msg(data.msg);
  			}
  		})
	}
	
	function onRename(e, treeId, treeNode) {
		$.ajax({
  			type:"post",
  			dataType:"json",
  			url:"updateModule",
  			data:{
  				id: treeNode.id,
  				name: treeNode.name
  			},
  			success:function(data){
  				layer.msg(data.msg);
  			}
  		})
	}
	
  </script>
</html>
