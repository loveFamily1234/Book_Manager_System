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

<link href="style/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/> 
<script src="style/js/bootstrap-table.min.js"></script>

<script src="style/js/bootstrap-editable.js"></script>
<script src="style/js/bootstrap-table-editable.js"></script>
<script src="style/js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script src="style/js/bootstrap-table-export.js"></script>
<script src="style/js/tableExport.js"></script>
<script src="style/js/bootstrap-datetimepicker.min.js"></script>
<script src="style/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="style/js/moment-with-locales.js"></script>
<script type="text/javascript">
function Datetime() {
    $('#datetimepicker1').datetimepicker({
        language: 'zh-CN',//显示中文
        format: 'yyyy-mm-dd',//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),
        autoclose: true,//选中自动关闭
        todayBtn: true,//显示今日按钮
        locale: moment.locale('zh-cn')
    });
    //默认获取当前日期
    var today = new Date();
    var nowdate = (today.getFullYear()) + "-" + (today.getMonth() + 1) + "-" + today.getDate();
    //对日期格式进行处理
    var date = new Date(nowdate);
    var mon = date.getMonth() + 1;
    var day = date.getDate();
    var mydate = date.getFullYear() + "-" + (mon < 10 ? "0" + mon : mon) + "-" + (day < 10 ? "0" + day : day);
    document.getElementById("add_book_public").value = mydate;
}
$(document).ready(function () { 
	Datetime();
//	alert("dsf");
});

	$(function() {

		    //增加页面返回按钮事件
		    $('#add_backBtn').click(function() {
		    	$('.addBody').addClass('animated slideOutLeft');
		    	setTimeout(function(){
					$('.addBody').removeClass('animated slideOutLeft').css('display','none');
				},500)
		    	$('.tableBody').css('display','block').addClass('animated slideInRight');  
		    	
		    });

		
		$('#search_btn').click(function() {
			$('#mytab').bootstrapTable('refresh', {
				url : '../index.php/admin/index/userManagement'
			});
		});

		$('#btn_add').click(function(){
			$('.tableBody').addClass('animated slideOutLeft');
			setTimeout(function(){
				$('.tableBody').removeClass('animated slideOutLeft').css('display','none');
			},500)
			$('.addBody').css('display','block');
			$('.addBody').addClass('animated slideInRight');
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

      //  commentSubmit
      
       $('#commentSubmit').click(function(){
            var row=$('#cargosTable').bootstrapTable('getSelections');
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/deletebook",
                data: { 
                    row:   JSON.stringify(row)
                    },
                success: function (data, status) {
                    if (status == "success") {
                    	 $('#c').modal('hide');
                     	$('#cargosTable').bootstrapTable('refresh', {url: '${pageContext.request.contextPath}/querybook'});
                   	 
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

		
		$('#cargosTable')
				.bootstrapTable(
						{
							//      method: "post ",
							url : "${pageContext.request.contextPath}/querybook",
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
							showExport: true,                     //是否显示导出
							exportDataType: "selected",  
							pagination : true, //分页
							sidePagination : "server", //服务端处理分页
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
				                    url: "${pageContext.request.contextPath}/modifybook",
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
										editable:{
								            type: "text",                //编辑框的类型。支持text|textarea|select|date|checklist等
								            title: "书名",              //编辑框的标题
								            disabled: false,             //是否禁用编辑
								            emptytext: "空文本",          //空值的默认文本
								            mode: "inline",              //编辑框的模式：支持popup和inline两种模式，默认是popup

								        }
								
									},
									{
										title : '作者',
										field : 'book.author',
										align : 'center',
										editable:{
								            type: "text",                //编辑框的类型。支持text|textarea|select|date|checklist等
								            title: "作者",              //编辑框的标题
								            disabled: false,             //是否禁用编辑
								            emptytext: "空文本",          //空值的默认文本
								            mode: "inline",              //编辑框的模式：支持popup和inline两种模式，默认是popup

								        }
										
									},
									{
										title : '价格',
										field : 'book.price',
										align : 'center',
										editable:{
								            type: "text",                //编辑框的类型。支持text|textarea|select|date|checklist等
								            title: "价格",              //编辑框的标题
								            disabled: false,             //是否禁用编辑
								            emptytext: "空文本",          //空值的默认文本
								            mode: "inline",              //编辑框的模式：支持popup和inline两种模式，默认是popup

								        }
									
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
										editable:{
								            type: "text",                //编辑框的类型。支持text|textarea|select|date|checklist等
								            title: "库存量",              //编辑框的标题
								            disabled: false,             //是否禁用编辑
								            emptytext: "空文本",          //空值的默认文本
								            mode: "inline",              //编辑框的模式：支持popup和inline两种模式，默认是popup

								        }
									},
					 ]

						});




	//	 $('#add_saveBtn').click(function() {}
		$('#add_saveBtn')
		.click(
				function() {
			//		alert("sdf");
				
					var book_id = $('#add_book_id').val();
					var book_name = $('#add_book_name').val();
					var author = $('#add_book_author')
							.val();
					var price =$('#add_book_price')
					.val();
					var book_public=$('#add_book_public').val();
					//add_number
					var number=$('#add_number').val();
					var book_publicment=$('#add_book_publicment').val();
         //          alert(book_id+" "+book_name+" "+author+" "+price);
					$
							.ajax({
								type : "post",
								url : "${pageContext.request.contextPath}/addBook",
								data : {
									book_id : book_id,
									book_name : book_name,
									author : author,
									price:price,
									book_public:book_public,
									number:number,
									book_publicment:book_publicment
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
									//	$('#add_book_id').value='';
									    document.getElementById('add_book_id').value=""; 
									    document.getElementById('add_book_name').value="";
									    document.getElementById('add_book_author').value="";
									    document.getElementById('add_book_price').value="";
									    document.getElementById('add_book_public').value="";
									    document.getElementById('add_book_publicment').value="";
										$('.addBody').addClass('animated slideOutLeft');
								    	setTimeout(function(){
											$('.addBody').removeClass('animated slideOutLeft').css('display','none');
										},500);
								    	$('.tableBody').css('display','block').addClass('animated slideInRight');
								    	$('#cargosTable').bootstrapTable('refresh', {url: '${pageContext.request.contextPath}/querybook'});
								    	
								    //	$('#addForm').data('bootstrapValidator').resetForm(true);
								    	//隐藏修改与删除按钮
									}
								},

								error : function() {
									alert("错误");
								}
							});
				});
		

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
					<li class="active" style="font-size: 15px"><a href="Manager_second.jsp"><span class="glyphicon glyphicon-qrcode"></span> 图书管理</a></li>
	<!-- 			<li style="font-size: 15px"><a href="#dede"><span class="glyphicon glyphicon-file"></span> 图书状态登记</a></li> -->	
					<li style="font-size: 15px"><a href="Manager_third.jsp"><span class="glyphicon glyphicon-plus-sign"></span> 借阅登记</a></li>
					<li style="font-size: 15px"><a href="Manager_four.jsp"><span class="glyphicon glyphicon-edit"></span>出版社信息查询</a></li>
					
				</ul>
			</div >
			<div class="col-md-10">
			<div style="background: rgba(255, 255, 255, 0.7);height: 400px;width: 100%;" >
				<div id="toolbar" class="btn-group">
					<button id="btn_add" type="button" class="btn btn-default" style="font-size:15px">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
					</button>
					<button id="btn_delete" type="button" class="btn btn-default" style="font-size: 15px">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span><a data-toggle="modal" data-target="#register" style="cursor:hand">删除</a>
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
	   
	
	
	   <div class="addBody" style="width:100%; display: none;position: absolute;top:10px">
        	<div class="col-sm-12">
        		<div class="ibox float-e-margins">
        			<div class="ibox-title">
	                    <h5>新增图书</h5>
	                </div>
	                <div class="ibox-content">
		                <form id="addForm" class="form-horizontal">
		                    <div class="form-group">
		                        <label class="col-sm-2 control-label">图书编号</label>
		                        <div class="col-sm-10">
		                            <input type="text" class="form-control" name="add_book_id" id="add_book_id"/>
		                        </div>
		                    </div>
		                    <div class="hr-line-dashed"></div>
		                    <div class="form-group">
		                        <label class="col-sm-2 control-label">图书名称</label>
		                        <div class="col-sm-10">
		                            <input type="text" class="form-control" name="add_book_name" id="add_book_name"/>
		                        </div>
		                    </div>
		                    <div class="hr-line-dashed" ></div>
		                   <div class="form-group">
		                        <label class="col-sm-2 control-label">图书作者</label>
		                        <div class="col-sm-10">
		                            <input type="text" class="form-control" name="add_book_author" id="add_book_author"/>
		                        </div>
		                    </div>
		          
		                    <div class="hr-line-dashed"></div>
		                    <div class="form-group">
		                        <label class="col-sm-2 control-label">图书价钱</label>
		                        <div class="col-sm-10">
		                            <input type="text" class="form-control" name="add_book_price" id="add_book_price"/>
		                        </div>
		                    </div>
		                    <div class="hr-line-dashed"></div>
		                    
		                     <div class="hr-line-dashed"></div>
		                    <div class="form-group">
		                        <label class="col-sm-2 control-label">图书出版日期</label>
		                        <div class="col-sm-10">
		                        <a class='input-group date' id='datetimepicker1' >
		                            <input type="text" class="form-control" name="add_book_public" id="add_book_public"/>
		                             <span class="input-group-addon">
                                      <span class="glyphicon glyphicon-calendar"></span>
                                         </span>
                                           </a>
		                        </div>
		                      
		                    </div>
		                    <div class="hr-line-dashed"></div>
		                    
		                      <div class="hr-line-dashed"></div>
		                    <div class="form-group">
		                        <label class="col-sm-2 control-label">图书数量</label>
		                        <div class="col-sm-10">
		                            <input type="text" class="form-control" name="add_number" id="add_number"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-sm-2 control-label">出版社</label>
		                        <div class="col-sm-10">
		                            <input type="text" class="form-control" name="add_book_publicment" id="add_book_publicment"/>
		                        </div>
		                    </div>
		                    
		                    <div class="hr-line-dashed"></div>
		                    <div class="form-group">
		                        <div class="col-sm-2 col-sm-offset-2">
		                            <button type="button" class="btn btn-primary btn-block"  id="add_saveBtn">保存</button>
		                        </div>
		                        <div class="col-sm-2 col-sm-offset-1">
		                            <button type="button" class="btn btn-default btn-block"  id="add_backBtn">返回</button>
		                        </div>
		                    </div>
		                </form>
		             </div>
		          </div>
		       </div>
		    </div>
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>
