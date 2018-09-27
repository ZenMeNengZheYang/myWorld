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
    </style>
  </head>
  
  <body>
  	<div>
  		<div class="layui-card">
	  		<div class="layui-card-header">查看</div>
		  	<div class="layui-card-body">
		  		<ul id="regionZTree" class="ztree"></ul>
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
			enable: false,
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
