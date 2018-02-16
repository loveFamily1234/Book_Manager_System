<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="style/css/bootstrap.min.css" />
<link href="style/css/bootstrap-table.min.css" rel="stylesheet" />

<link href="style/css/bootstrap-editable.css" rel="stylesheet" />

<link href="style/css/animate.min.css" rel="stylesheet" />
<link href="style/css/style.min.css" rel="stylesheet" />
<script src="style/js/bootstrap-table.min.js"></script>

<script src="style/js/bootstrap-editable.js"></script>
<script src="style/js/bootstrap-table-editable.js"></script>
<script src="style/js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript"></script>
<script type="text/javascript">
	window.onload=function(){
/* 		var list=document.getElementById('list');
		var li=list.getElementsByTagName('li');
		for(var i=0;i<li.length;i++){
			li[i].index=i;
			li[i].onclick=function(){
				for(var i=0;i<li.length;i++){
					li[i].className='';
				};
				this.className='active';
			};
		}; */
		var list_home=document.getElementById('list_home');
		var list_search=document.getElementById('list_search');
		var list_info=document.getElementById('list_info');
		var div_search=document.getElementById('div_search');
		var div_info=document.getElementById("div_info");
		var div_simple_search=document.getElementById('div_simple_search');
		var div_high_level_search=document.getElementById('div_high_level_search');
		var radio_simple_search=document.getElementById('radio_simple_search');
		var radio_high_level_search=document.getElementById('radio_high_level_search');
		var div_table = document.getElementById('div_table');
		var div_table2 = document.getElementById('div_table2');
		list_home.onclick=function(){
			list_home.className='active';
			list_search.className='';
			list_info.className='';
			div_search.style.display='none';
		};
		list_search.onclick=function(){
			list_home.className='';
			list_search.className='active';
			list_info.className='';
			div_search.style.display='block';
			div_info.style.display="none";
		};
		list_info.onclick=function(){
			list_home.className='';
			list_search.className='';
			list_info.className='active';
			div_search.style.display='none';
			div_info.style.display="block";
		};
		radio_simple_search.onclick=function(){
			div_simple_search.style.display='block';
			div_high_level_search.style.display='none';
			//div_table.style.display = 'block';
			div_table2.style.display = 'none';
		};
		radio_high_level_search.onclick=function(){
			div_simple_search.style.display='none';
			div_high_level_search.style.display='block';
			div_table.style.display = 'none';
			//div_table2.style.display = 'block';
		};
	};
</script>
<script type="text/javascript">
$(function() {
	function queryParams(params) {
		//alert(JSON.stringify(params));
		var data=document.getElementById('input_simple_search').value;
		return {
		pageSize : params.limit,
		pageNumber : params.pageNumber,
		bookName : $('#input_simple_search').val(),
		book_name : $('#book_name').val(),
		book_author : $('#book_author').val(),
		book_publish : $('#book_publish').val(),
		book_time_start : $('#book_time_start').val(),
		book_time_end : $('#book_time_end').val(),
		};
	}
	$('#cargosTable').bootstrapTable({
		//      method: "post ",
		url : "${pageContext.request.contextPath}/query_null",
		striped : true, //是否显示行间隔色
		cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		pagination : true, //是否显示分页（*）
		sortable : true, //是否启用排序
		sortOrder : "asc", //排序方式
		pageNumber : 1, //初始化加载第一页，默认第一页
		pageSize : 10, //每页的记录行数（*）
		cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		search : false, //是否显示表格搜索
		strictSearch : true,
		showColumns : true, //是否显示所有的列（选择显示的列）
		showRefresh : false, //是否显示刷新按钮
		clickToSelect : true,
		toolbar : '#toolbar',//指定工作栏
		pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*）
		queryParams : queryParams, //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
		// 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
		detailView : false,  //父子表
		dataType : "json",
		pagination : true, //分页
		sidePagination : "server", //服务端处理分页
		formatLoadingMessage : function() {
			return "请稍等，正在加载中...";
		},
		formatNoMatches : function() { //没有匹配的结果
			return '无符合条件的记录';
		},
		columns : [
			{
				title : '编码',
				field : 'book.book_id',
				align : 'center',
				valign : 'middle'
			},
			{
				title : '书名',
				field : 'book.book_name',
				align : 'center',
				valign : 'middle',
			},
			{
				title : '作者',
				field : 'book.author',
				align : 'center',
			},
			{
				title : '价格',
				field : 'book.price',
				align : 'center',
			},
			{
				title : '出版日期',
				field : 'book.book_public',
				align : 'center',
			},
			{
				title : '出版社',
				field : 'book.book_publicment',
				align : 'center',
			},
			{
				title : '库存量',
				field : 'size',
				align : 'center',
			},]
	});
	
	$('#cargosTable2').bootstrapTable({
		//      method: "post ",
		url : "${pageContext.request.contextPath}/query_null",
		striped : true, //是否显示行间隔色
		cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		pagination : true, //是否显示分页（*）
		sortable : true, //是否启用排序
		sortOrder : "asc", //排序方式
		pageNumber : 1, //初始化加载第一页，默认第一页
		pageSize : 10, //每页的记录行数（*）
		cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		search : false, //是否显示表格搜索
		strictSearch : true,
		showColumns : true, //是否显示所有的列（选择显示的列）
		showRefresh : false, //是否显示刷新按钮
		clickToSelect : true,
		toolbar : '#toolbar',//指定工作栏
		pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*）
		queryParams : queryParams, //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
		// 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
		detailView : false,  //父子表
		dataType : "json",
		pagination : true, //分页
		sidePagination : "server", //服务端处理分页
		formatLoadingMessage : function() {
			return "请稍等，正在加载中...";
		},
		formatNoMatches : function() { //没有匹配的结果
			return '无符合条件的记录';
		},
		columns : [
			{
				title : '编码',
				field : 'book.book_id',
				align : 'center',
				valign : 'middle'
			},
			{
				title : '书名',
				field : 'book.book_name',
				align : 'center',
				valign : 'middle',
			},
			{
				title : '作者',
				field : 'book.author',
				align : 'center',
			},
			{
				title : '价格',
				field : 'book.price',
				align : 'center',
			},
			{
				title : '出版日期',
				field : 'book.book_public',
				align : 'center',
			},
			{
				title : '出版社',
				field : 'book.book_publicment',
				align : 'center',
			},
			{
				title : '库存量',
				field : 'size',
				align : 'center',
			},]
	});
	$('#div_info').onclick=function(){
		$.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/queryInfo",
            data: { 
                  info_id : $('info_id').val()
                },
            success: function (data, status) {
                var obj=JSON.parse(JSON.stringify(data));
                
            },
            error: function () {
                alert("Error");
            },
            complete: function () {
                
            }

        });
	};
});
</script>
<script>
function EnterPress(e){ //传入 event 
	var e = e || window.event;
	var div_table = document.getElementById('div_table');
	var input_simple_search = document.getElementById('input_simple_search');
    if(e.keyCode == 13){ 
    	//alert(JSON.stringify(document.getElementById('input_simple_search').value));
    	if($('#input_simple_search').val().length == 0){
    		//alert(JSON.stringify(document.getElementById('input_simple_search').value));
    		$('#cargosTable').bootstrapTable('refresh', {url: '${pageContext.request.contextPath}/query_null'});
    	}else{
    		//alert(JSON.stringify(document.getElementById('input_simple_search').value));
    		$('#cargosTable').bootstrapTable('refresh', {url: '${pageContext.request.contextPath}/query_simple'});
        	div_table.style.display = 'block';
    	}  	
    } 
}
function EnterPress2(e){ //传入 event 
	var e = e || window.event;
	var div_table2 = document.getElementById('div_table2');
    if(e.keyCode == 13){ 
    	//alert(JSON.stringify(document.getElementById('book_name').value));
    	if($('#book_name').val().length == 0 && $('#book_author').val().length == 0 && $('#book_publish').val().length == 0
    			&& $('#book_time_start').val().length == 0 && $('#book_time_end').val().length == 0){
    		$('#cargosTable2').bootstrapTable('refresh', {url: '${pageContext.request.contextPath}/query_null'});
    	}else{
    		$('#cargosTable2').bootstrapTable('refresh', {url: '${pageContext.request.contextPath}/query_high_level'});
        	div_table2.style.display = 'block';
    	}
    } 
}
</script>
<title>图书管理系统</title>
<style type="text/css">
ul.nav-pills {
	width: 200px;
}

ul.nav-pills.affix {
	top: 30px; /* Set the top position of pinned element */
}

#lists ul li {
	padding: 15px;
}
</style>
</head>
<body style="position:absolute; left:0px; top:0px; width:100%; height:100%;padding: 10px;">
<div id="box" class="tableBody" style="height:100%;overflow:hidden">
	<div class="panel panel-default" style="position: absolute; top: 10px; left: 10px; right: 10px;
	 	background: #3399CC;height: 50px">
	 	<a href="login.jsp" class="pull-right text-center " style="font-size: 20px;color: black;">
	 	<span class="glyphicon glyphicon-home"></span>&nbsp;<%=session.getAttribute("username") %>&nbsp;退出登录</a>
	 	</div>
	<div id="guide" class="col-md-2" style="position: absolute; top: 100px; left: 0;bottom:20px; width: 200px">
		<ul id="list" class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="125">
			<li id="list_home" style="font-size: 15px"><a href="#"> <i class="glyphicon glyphicon-th-large"></i> 首页</a></li>
			<li id="list_search" style="font-size: 15px" class="active"><a href="#"><span class="glyphicon glyphicon-qrcode"></span> 图书检索</a></li>
			<li id="list_info" style="font-size: 15px"><a href="#"><span class="glyphicon glyphicon-file"></span> 个人信息</a></li>
		</ul>
	</div >
	<div style="position: absolute; top: 60px; left: 230px; right: 0; bottom:0;width:50px">
		<table style="height:100%;width:50px;border-color:#3399CC;border-left-style:solid"><tr><td valign="top"></td></tr></table>
	</div>
	<div id="div_search" style="position:absolute;top:60px;left:220px;right:0;bottom:20px">
		<label style="font-size:15px;position:absolute;top:20px;left:300px;right:0;bottom:20px">
			<input id="radio_simple_search" name="radio_search" type="radio" value="1" checked="checked"/>&nbsp;检索
		</label>
		<label style="font-size:15px;position:absolute;top:20px;left:380px;right:0;bottom:20px">
			<input id="radio_high_level_search" name="radio_search" type="radio" value="2"/>&nbsp;高级检索
		</label>
		<div id="div_simple_search" style="position:absolute;top:50px;left:20px;right:10px;bottom:20px">
			<input id="input_simple_search" type="text" style="width:540px;position:absolute;left:200px"
				onkeypress="EnterPress(event)" onkeydown="EnterPress()"/>
		</div>
		<div id="div_table" style="position:absolute;top:70px;left:20px;right:10px;bottom:165px;display:none">
			<table id="cargosTable" class="table table-hover" style="font-size:15px"></table>
		</div>
		<div id="div_high_level_search" style="position:absolute;top:50px;left:220px;right:0;bottom:20px;display:none">
			<label>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;书名：<input id="book_name" name="book_name" type="text" style="width:500px"
					onkeypress="EnterPress2(event)" onkeydown="EnterPress2()"/>
			</label>
			<label>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作者：<input id="book_author" name="book_author" type="text" style="width:500px"
					onkeypress="EnterPress2(event)" onkeydown="EnterPress2()"/>
			</label>
			<label style="width:100%">
				&nbsp;&nbsp;&nbsp;出版社：<input id="book_publish" name="book_publish" type="text" style="width:500px"
					onkeypress="EnterPress2(event)" onkeydown="EnterPress2()"/>
			</label>
			<label>
				出版时间：从&nbsp;<input id="book_time_start" name="book_time_start" type="text" style="width:100px;text-align:center" 
					value="1900" maxlength=4
					onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
					onkeypress="EnterPress2(event)" onkeydown="EnterPress2()"/>
			</label>
			<label>
				到&nbsp;<input id="book_time_end" name="book_time_end" type="text" style="width:100px;text-align:center" 
					value="2017" maxlength=4
					onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
					onkeypress="EnterPress2(event)" onkeydown="EnterPress2()"/>
			</label>
		</div>
		<div id="div_table2" style="position:absolute;top:150px;left:20px;right:10px;bottom:65px;display:none">
			<table id="cargosTable2" class="table table-hover" style="font-size:15px"></table>
		</div>
	</div>
	<div id="div_info" style="position:absolute;top:100px;left:300px;right:0;bottom:20px;display:none">
		<label style="width:100%;height:50px;font-size:15px">
			学号：<input id="info_id" type="text" style="width:200px;border:none" value=<%=session.getAttribute("id") %> readonly="readonly"/>
		</label>
		<label style="width:100%;height:50px;font-size:15px">
			姓名：<input id="info_name" type="text" style="width:200px;border:none" value=<%=session.getAttribute("username") %> readonly="readonly"/>	
		</label>
		<label style="width:100%;height:50px;font-size:15px">
			班级：<input id="info_class" type="text" style="width:200px;border:none" value=<%=session.getAttribute("classmate") %> readonly="readonly"/>
		</label>
		<label style="width:100%;height:50px;font-size:15px">
			性别：<input id="info_sex" type="text" style="width:200px;border:none" value=<%=session.getAttribute("sex") %> readonly="readonly"/>
		</label>
		<label style="width:100%;height:50px;font-size:15px">
			年龄：<input id="info_age" type="text" style="width:200px;border:none" value=<%=session.getAttribute("age") %> readonly="readonly"/>
		</label>
		<label style="width:100%;height:50px;font-size:15px">
			住址：<input id="info_address" type="text" style="width:400px;border:none" value=<%=session.getAttribute("address") %> readonly="readonly"/>
		</label>
		<label style="width:100%;height:50px;font-size:15px">
			电话：<input id="info_phone" type="text" style="width:200px;border:none" value=<%=session.getAttribute("phone") %> readonly="readonly"/>
		</label>
		<label style="width:100%;height:50px;font-size:15px">
			身份：<input id="info_position" type="text" style="width:200px;border:none" value=<%=session.getAttribute("position") %> readonly="readonly"/>
		</label>
		<label style="width:100%;height:50px;font-size:15px">
			状态：<input id="info_state" type="text" style="width:200px;border:none" value="---" readonly="readonly"/>
		</label>
	</div>
</div>
</body>
</html>