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
<script src="style/js/bootstrap-table-export.js"></script>
<script src="style/js/tableExport.js"></script>
<script type="text/javascript">

	$(function() {

		  

		
		$('#search_btn').click(function() {
			$('#mytab').bootstrapTable('refresh', {
				url : '../index.php/admin/index/userManagement'
			});
		});

		

	//	btn_delete
        $('#btn_delete').click(function(){
            var row=$('#cargosTable').bootstrapTable('getSelections');
            if(row.length==0){
            	$('#w').modal('show');
                }
            else{
                $('#c').modal('show');
            }
		});

        //sendmail
          $('#sendmail').click(function(){
          //  var row=$('#cargosTable').bootstrapTable('getSelections');
            alert("sdfd");
		});
		

        $('#btn_add').click(function(){
            	$('#register').modal('show');
		});

      //  commentSubmit
      
       $('#commentSubmit').click(function(){
            var row=$('#cargosTable').bootstrapTable('getSelections');
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/deletepublic",
                data: { 
                    row:   JSON.stringify(row)
                    },
                success: function (data, status) {
                    if (status == "success") {
                    	 $('#c').modal('hide');
                     	$('#cargosTable').bootstrapTable('refresh', {url: '${pageContext.request.contextPath}/querypublic'});
                   	 
                    }
                },
                error: function () {
                    alert("Error");
                },
                complete: function () {

                }

            });
		});
		
		function queryParams(params) {
	//		alert(JSON.stringify(params));
			return {
				pageSize : params.limit,
				pageNumber : params.pageNumber,

			};

		}

		window.operateEvents={
				"click #sendmail":function(e,vlaue,row,index){
			//		alert(JSON.stringify(row));
					$('#send').modal('show');
					document.getElementById('receive_people').value=row.public_email;
					}
				}

		
		$('#cargosTable')
				.bootstrapTable(
						{
							//method: "post ",
							url : "${pageContext.request.contextPath}/querypublic",
							striped : true, //是否显示行间隔色
							cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
							pagination : true, //是否显示分页（*）
							sortable : true, //是否启用排序
							sortOrder : "asc", //排序方式
							pageNumber : 1, //初始化加载第一页，默认第一页
							pageSize : 10, //每页的记录行数（*）
							cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
							search : true, //是否显示表格搜索
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
							showExport: true,                     //是否显示导出
							exportDataType: "selected",              //basic', 'all', 'selected'.
					//		exportTypes:['excel'],
							pagination : true, //分页
						
					//		sidePagination : "server", //服务端处理分页
							formatLoadingMessage : function() {
								return "请稍等，正在加载中...";
							},
							formatNoMatches : function() { //没有匹配的结果
								return '无符合条件的记录';
							},
				            onEditableSave: function (field, row, oldValue, $el) {
					      //      alert(JSON.stringify(oldValue));
				                $.ajax({
				                    type: "post",
				                    url: "${pageContext.request.contextPath}/modifypublic",
				                    data: { 
					                    field: JSON.stringify(field),
					                    row:   JSON.stringify(row)
					                    },
				                    success: function (data, status) {
				                        if (status == "success") {
				                            
				                        }
				                    },
				                    error: function () {
				                        alert("Error");
				                    },
				                    complete: function () {

				                    }

				                });
				            },
							columns : [
									{
										 checkbox: true,
										 
										},
									
									{
										
										title : '出版社名称',
										field : 'public_name',
										align : 'center',
										valign : 'middle'
								
									},
									{
										title : '出版社电话',
										field : 'public_phone',
										align : 'center',
										editable:{
								            type: "text",                //编辑框的类型。支持text|textarea|select|date|checklist等
								            title: "电话",              //编辑框的标题
								            disabled: false,             //是否禁用编辑
								            emptytext: "空文本",          //空值的默认文本
								            mode: "inline",              //编辑框的模式：支持popup和inline两种模式，默认是popup

								        }
										
									},
									{
										title : '出版社Email',
										field : 'public_email',
										align : 'center',
										editable:{
								            type: "text",                //编辑框的类型。支持text|textarea|select|date|checklist等
								            title: "Email",              //编辑框的标题
								            disabled: false,             //是否禁用编辑
								            emptytext: "空文本",          //空值的默认文本
								            mode: "inline",              //编辑框的模式：支持popup和inline两种模式，默认是popup
								        }
									
									},
									{
										title:'发送邮件',
										align : 'center',
										events: operateEvents,
										formatter: function (value, row, index) {  
							              return '<button id="sendmail" type="button" class="btn btn-default"><span class="glyphicon glyphicon-envelope" style="cursor:hand" ></span></button>' ;
										}
									},
					 ]

						});




	//	 $('#add_saveBtn').click(function() {}
		
		

	});
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
<body style="position:absolute; left:0px; top:0px; width:100%; height:100%;padding: 10px;" >
<div class="tableBody">
	<div class="panel panel-default" style="background: #3399CC;height: 50px">
	
	<!--  	<div class="btn-group pull-right " style="margin-right: 10px;">
			<button type="button" class="btn btn-block dropdown-toggle"
				data-toggle="dropdown" style="border-color:#3399CC; ">
				<span class="glyphicon glyphicon-user"></span>欢迎！<%=session.getAttribute("username")%>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">浏览记录</a></li>
				<li><a href="#">个人中心</a></li>
			</ul>
		</div>-->
		<a href="login.jsp" class="pull-right text-center " style="font-size: 20px;color: black;"><span class="glyphicon glyphicon-home"></span>&nbsp;<%=session.getAttribute("username") %>&nbsp;退出登录</a>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<ul class="nav nav-pills nav-stacked" data-spy="affix"
					data-offset-top="125">
					<li   style="font-size: 15px"><a href="Manager_first.jsp"> <i
							class="glyphicon glyphicon-th-large"></i> 首页
					</a>
					</li>
					<li  style="font-size: 15px"><a href="Manager_second.jsp"><span class="glyphicon glyphicon-qrcode"></span> 图书管理</a></li>
	<!-- 			<li style="font-size: 15px"><a href="#dede"><span class="glyphicon glyphicon-file"></span> 图书状态登记</a></li> -->	
					<li style="font-size: 15px"><a href="Manager_third.jsp"><span class="glyphicon glyphicon-plus-sign"></span> 借阅登记</a></li>
					<li class="active" style="font-size: 15px"><a href="Manager_four.jsp"><span class="glyphicon glyphicon-edit"></span>出版社信息查询</a></li>
					
				</ul>
			</div >
			<div class="col-md-10">
			<div style="background: rgba(255, 255, 255, 0.7);height: 400px;width: 100%;" >
				<div id="toolbar" class="btn-group">
					<button id="btn_add" type="button" class="btn btn-default" style="font-size:15px">
						<span class="glyphicon glyphicon-plus"  aria-hidden="true"></span>新增
					</button>
					<button id="btn_delete" type="button" class="btn btn-default" style="font-size: 15px">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
					</button>
				</div>


				<table id="cargosTable" class="table table-hover"
					style="padding: 5%"></table>


</div>
</div>
			</div>
		</div>
	</div>

  	<div id="w" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="alert alert-danger" role="alert">
			没有选定删除的元素
			</div>
		</div>
	</div>
		<div id="c" class="modal fade" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="alert alert-warning" role="alert">
                确认删除？
                </div>
                <div class="text-right">
							<button class="btn btn-danger" id="commentSubmit">确认</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	   
		<div id="register" class="modal fade" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h1 class="text-center">添加借阅记录</h1>
				</div>
				<div class="modal-body">
					<form class="form-group" action="">
					    <div class="form-group">
							<label for="">出版社名称</label> <input class="form-control" type="text"
								placeholder="" name="public_name" id="public_name">
						</div>
						<div class="form-group">
							<label for="">出版社电话</label> <input class="form-control" type="text"
								placeholder="" name="public_phone" id="public_phone">
						</div>
						<div class="form-group">
							<label for="">出版社Email</label> <input class="form-control" type="text" placeholder="" name="public_email" id="public_email">
						</div>
						
						<div class="text-right">
							<button class="btn btn-primary" id="sure">提交</button>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
						<a href="" data-toggle="modal" data-dismiss="modal"
							data-target="#login"></a>

					</form>
					

					<script type="text/javascript">
		
						$('#sure')
								.click(
										function() {
										
											var public_name = $('#public_name').val();
											var public_phone = $('#public_phone').val();
											var public_email = $('#public_email').val();

											$
													.ajax({
														type : "post",
														url : "${pageContext.request.contextPath}/addpublic",
														data : {
															public_name : public_name,
															public_phone : public_phone,
															public_email:public_email
														},
														dataType : "json",
														async : false,
														success : function(data) {
															//	var obj = eval('(' + data + ')');
															var obj = JSON
																	.parse(JSON
																			.stringify(data)).result;
															var c = 'success'
															if (obj == 'success') {
																alert("创建成功");
															}
														},

														error : function() {
															alert("错误");
														}
													});
										});
					</script>

				</div>
			</div>
		</div>
	</div>
	   

	  
	  <div id="send" class="modal fade" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h1 class="text-center">发送邮件</h1>
				</div>
				<div class="modal-body">
					<form class="form-group" action="">
					    <div class="form-group">
							<label for="">收件人</label> <input class="form-control" type="text"
								placeholder="" name="receive_people" id="receive_people">
						</div>
						<div class="form-group">
							<label for="">主题</label> <input class="form-control" type="text"
								placeholder="" name="subject" id="subject">
						</div>
						<div class="form-group">
                         
                         <textarea class="form-control" rows="3" id="area" name="area"></textarea>
                         </div>
                         <div class="text-right">
							<button class="btn btn-primary" id="suresend">发送</button>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						 </div>
					</form>
					<script type="text/javascript">
		
						$('#suresend')
								.click(
										function() {
										
											var receive_people = $('#receive_people').val();
											var subject = $('#subject').val();
											var area = $('#area').val();

											$
													.ajax({
														type : "post",
														url : "${pageContext.request.contextPath}/sendtest",
														data : {
															receive_people : receive_people,
															subject : subject,
															area:area
														},
														dataType : "json",
														async : false,
														success : function(data) {
														//		var obj = eval('(' + data + ')');
															var obj = JSON
																	.parse(JSON
																			.stringify(data)).result;
															var c = 'success'
															if (obj == 'success') {
																alert("发送成功");
															}
														},

														error : function() {
															alert("发送失败");
														}
													});
										});
					</script>

				</div>
			</div>
		</div>
	</div>
	  
	  
	
	  
</body>
</html>