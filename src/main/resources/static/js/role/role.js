$(function () {
    var oTable = new TableInit();
    oTable.Init();
    
	$('body').on('hidden.bs.modal', '.modal', function () {
		document.getElementById("form_data").reset();
		$(document.getElementById("form_data")).find('input[readonly]').each(function(){
			$(this).attr("readonly", false)
		})
	})
});


var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#roleData').bootstrapTable({
            url: '/getAllRole',         //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns: [{
                checkbox: true
            }, {
                field: 'username',
                title: '名称'
            }, {
            	field: 'price',
				title: '操作',
				width: 120,
				align: 'center',
				valign: 'middle',
				formatter: actionFormatter,
            }, ]
        });
    };

    //得到查询的参数
    oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            departmentname: $("#txt_search_departmentname").val(),
            statu: $("#txt_search_statu").val()
        };
        return temp;
    };
    return oTableInit;
};

function actionFormatter(value, row, index) {
	var data = JSON.stringify(row);
	var result = "";
	result += "<a href='javascript:;' class='btn btn-xs green' onclick='editData(" + data + "," + true + ")' title='查看'><span class='glyphicon glyphicon-search'></span></a>";
	result += "<a href='javascript:;' class='btn btn-xs blue' onclick='editData(" + data + "," + false + ")' title='编辑'><span class='glyphicon glyphicon-pencil'></span></a>";
	result += "<a href='javascript:;' class='btn btn-xs red' onclick='delData(" + data + ")' title='删除'><span class='glyphicon glyphicon-remove'></span></a>";
	return result;
}

function editData(data,view){
	$('#myModal').modal('show') 
	for(var key in data){
		if($("input[name='"+key+"']").length > 0){
			$("input[name='"+key+"']").val(data[key]);
			if(view){
				$("input[name='"+key+"']").attr("readonly", true)
			}
		}
	}
}

function delData(data){
	console.log(data)
}

function check_form(){
    $.ajax({
	    url: "/saveOrUpdate",
	    data:$('#form_data').serialize(),
	    type: "post",
	    beforeSend:function(){
	        $("#tip").html("<span style='color:blue'>正在处理...</span>");
	        return true;
	    },
	    success:function(data){
	        if(data.code == 0){
	            var msg = "添加";
	            //if(act == "edit") msg = "编辑";
	            $("#tip").html("<span style='color:blueviolet'>恭喜，" +msg+ "成功！</span>");
	            alert(msg + "OK！");
	            location.reload();
	        }else{
	            $("#tip").html("<span style='color:red'>失败，请重试</span>");
	            alert('操作失败');
	        }
	    }
	});
    return false;
}
