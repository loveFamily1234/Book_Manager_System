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
<script src="style/js/select2.js"></script>
<script src="style/js/bootstrap-editable.js"></script>
<script src="style/js/bootstrap-table-editable.js"></script>
<script src="style/js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script src="style/js/bootstrap-table-export.js"></script>
<script src="style/js/tableExport.js"></script>

<script type="text/javascript">


function t(){
    $.ajax({
        type: "post",
        url: "${pageContext.request.contextPath}/querytotal",
        data: { 
        	   user_id:user_id
            },
        success: function (data, status) {
            var obj=JSON.parse(JSON.stringify(data));
           
            if(obj[0].total=='false'){
            	 $('#t').modal('show');
              	 setTimeout(function(){
            		 $('#t').modal('hide')
                },2000);
              	setTimeout(function(){
           		 $('#register').modal('hide')
               },3000);
                
                }
        },
        error: function () {
            alert("Error");
        },
        complete: function () {
            
        }

    }); 
}

$(document).ready(function () { 
	 $(document).on('show.bs.modal', '.modal', function (event) {
         var zIndex = 1040 + (10 * $('.modal:visible').length);
         $(this).css('z-index', zIndex);
         // setTimeout(function() {
         //     $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
         // }, 0);
     });

    $.ajax({  
        url : "${pageContext.request.contextPath}/queryallbook", //所需要的列表接口地址  
        type : "post",  
        dataType : "json",  
        success : function(data) { 
     //       alert(JSON.stringify(data.length)); 
     //       if (data.msg == "获取列表成功！") {  
                var h = "<option>==请选择===</option>";  
    //            $.each(data.book, function(key, value) {//拼接option 
     //               alert(JSON.stringify(value)); 
     //               h += "<option value='" + value.id + "'>" + value.context  
     ////                       + "</option>";  
      //          }); 
      
                for( var depart_index = 0 ; depart_index < data.length; depart_index++ )
                    {  
                	var depart = data[depart_index]; 
              //  	alert(JSON.stringify(depart)); 
                    var obj = JSON.parse(JSON
							.stringify(depart)).book; 
		//			alert(JSON.stringify(obj));   
                	h += "<option >"+obj.book_id+"</option>";  
                	}
                $("#book_id").append(h);//append 添加进去并展示  
                $("#book_id")//当点击后，将选中的text传到id为content的文本框中。  
                        .on(  
                                "change",  
                                function(a, b, c) {  
                                     var book_id=$("#book_id option:selected").text();
                                 //    alert(JSON.stringify(book_id));
    				                $.ajax({
    				                    type: "post",
    				                    url: "${pageContext.request.contextPath}/querystock",
    				                    data: { 
        				                      book_id:book_id
    					                    },
    				                    success: function (data, status) {
        				                    var obj=JSON.parse(JSON.stringify(data));
        				                   
        				                    if(obj[0].size=='0'){
        				                    	 $('#b').modal('show');
        				                      	 setTimeout(function(){
        				                    		 $('#b').modal('hide')
            				                    },2000);
            				                    }
    				                    },
    				                    error: function () {
    				                        alert("Error");
    				                    },
    				                    complete: function () {
        				                    
    				                    }

    				                });
                                	
                               });  
    //        }  
        }  
    }); 
    $.ajax({  
        url : "${pageContext.request.contextPath}/queryuser", //所需要的列表接口地址  
        type : "post",  
        dataType : "json",  
        success : function(data) { 
     //       alert(JSON.stringify(data.length)); 
     //       if (data.msg == "获取列表成功！") {  
                var h = "<option>==请选择===</option>";  
    //            $.each(data.book, function(key, value) {//拼接option 
     //               alert(JSON.stringify(value)); 
     //               h += "<option value='" + value.id + "'>" + value.context  
     ////                       + "</option>";  
      //          }); 
      
                for( var depart_index = 0 ; depart_index < data.length; depart_index++ )
                    {  
                	var depart = data[depart_index]; 
              //  	alert(JSON.stringify(depart)); 
                    var obj = JSON.parse(JSON
							.stringify(depart)); 
		//			alert(JSON.stringify(obj));   
                	h += "<option >"+obj.id+"</option>";  
                	}
                $("#user_id").append(h);//append 添加进去并展示  
                 $("#user_id")//当点击后，将选中的text传到id为content的文本框中。  
                        .on(  
                                "change",  
                                function(a, b, c) { 
                                	 var user_id=$("#user_id option:selected").text(); 
    				                $.ajax({
    				                    type: "post",
    				                    url: "${pageContext.request.contextPath}/querystate",
    				                    data: { 
    				                    	   user_id:user_id
    					                    },
    				                    success: function (data, status) {
        				                    var obj=JSON.parse(JSON.stringify(data));
        				         //           alert(JSON.stringify(data));
        				                    if(obj[0].state=='false'){
        				                    	 $('#u').modal('show');
        				                      	 setTimeout(function(){
        				                    		 $('#u').modal('hide')
            				                    },2000);
        				                      	setTimeout(function(){
       				                    		 $('#register').modal('hide')
           				                    },3000);
             				                   
            				                    }else if(obj[0].total=='false'){
            				                     	 $('#t').modal('show');
            				                      	 setTimeout(function(){
            				                    		 $('#t').modal('hide')
            				                        },2000);
            				                      	setTimeout(function(){
            				                   		 $('#register').modal('hide')
            				                       },3000);
                				                    }else{
                				                    	 $('#m').modal('show');
                				                      	 setTimeout(function(){
                				                    		 $('#m').modal('hide')
                				                        },2000);
                				                    	document.getElementById('sure').disabled="";
                    				                    }
    				                    },
    				                    error: function () {
    				                        alert("Error");
    				                    },
    				                    complete: function () {
        				                    
    				                    }

    				                });
    				           
                               }); 
    //        }  
        }  
    }); 
 
 
});

	$(function() {

		$('#register').on('show.bs.modal', function() {
			$("#book_id option:first").prop("selected", 'selected'); 
			$("#user_id option:first").prop("selected", 'selected');
			document.getElementById('sure').disabled="false";
		})
		
		
		    //增加页面返回按钮事件
	//	    $('#add_backBtn').click(function() {
	//	    	$('.addBody').addClass('animated slideOutLeft');
	//	    	setTimeout(function(){
	//				$('.addBody').removeClass('animated slideOutLeft').css('display','none');
	//			},500)
	//	    	$('.tableBody').css('display','block').addClass('animated slideInRight');  
		    	
	//	    });

		


	//	$('#btn_add').click(function(){
	//		$('.tableBody').addClass('animated slideOutLeft');
	//		setTimeout(function(){
	//			$('.tableBody').removeClass('animated slideOutLeft').css('display','none');
	//		},500)
	//		$('.addBody').css('display','block');
	//		$('.addBody').addClass('animated slideInRight');
//		});

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


        $('#btn_add').click(function(){
        	$('#register').modal('show');
	});

      //  commentSubmit
      
       $('#commentSubmit').click(function(){
            var row=$('#cargosTable').bootstrapTable('getSelections');
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/deleteloan",
                data: { 
                    row:   JSON.stringify(row)
                    },
                success: function (data, status) {
                    if (status == "success") {
                    	 $('#c').modal('hide');
                     	$('#cargosTable').bootstrapTable('refresh', {url: '${pageContext.request.contextPath}/queryloan'});
                   	 
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
					//		method: "post ",
							url : "${pageContext.request.contextPath}/queryloan",
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
							exportDataType: "selected",  
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
				            rowStyle: function (row, index) {
				                //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
				                var strclass = "";
				                if (row.state == "欠款") {
				                    strclass = 'danger';//还有一个active
				                }
				                else if (row.state == "正常") {
				                    strclass = 'success';
				                }
				                else {
				                    return {};
				                }
				                return { classes: strclass }
				            },
							columns : [
									{
										 checkbox: true,
										 
										},
									{
										title : '借阅记录号',
										field : 'id',
										align : 'center',
										valign : 'middle'
									},
									{
										
										title : '用户名',
										field : 'username',
										align : 'center',
										valign : 'middle',
										
								
									},
									{
										title : '书名',
										field : 'bookname',
										align : 'center',
										
										
									},
									{
										title : '归还日期',
										field : 'return_date',
										align : 'center',
										
									
									},
									{
										title : '状态',
										field : 'state',
										align : 'center',
	
									},									
									{
										title : '欠款数',
										field : 'money',
										align : 'center',
	
									}
					 ]

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
<!--<select class="selectpicker" id="datatable_ajax_model"></select>-->
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
					<li  style="font-size: 15px"><a href="Manager_first.jsp"> <i
							class="glyphicon glyphicon-th-large"></i> 首页
					</a>
					</li>
					<li  style="font-size: 15px"><a href="Manager_second.jsp"><span class="glyphicon glyphicon-qrcode"></span> 图书管理</a></li>
	<!-- 			<li style="font-size: 15px"><a href="#dede"><span class="glyphicon glyphicon-file"></span> 图书状态登记</a></li> -->	
					<li class="active" style="font-size: 15px"><a href="Manager_third.jsp"><span class="glyphicon glyphicon-plus-sign"></span> 借阅登记</a></li>
					<li style="font-size: 15px"><a href="Manager_four.jsp"><span class="glyphicon glyphicon-edit"></span>出版社信息查询</a></li>
					
				</ul>
			</div >
			<div class="col-md-10">
			<div style="background: rgba(255, 255, 255, 0.7);height: 400px;width: 100%;" >
				<div id="toolbar" class="btn-group">
					<button id="btn_add" type="button" class="btn btn-default" style="font-size:15px">
						<span class="glyphicon glyphicon-plus"  aria-hidden="true"></span>新增
					</button>
					<button id="btn_delete" type="button" class="btn btn-default" style="font-size: 15px">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span><a data-toggle="modal">删除</a>
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
	   
	   
		<div id="register" class="modal fade" tabindex="-1">
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
							<label for="">编号</label> 
							<select class="selectpicker form-control" data-live-search="true" id="book_id" name="book_id" >
				            </select>
						</div>
						<div class="form-group">
							<label for="">用户编号</label> 
							<select class="selectpicker form-control" data-live-search="true" id="user_id" name="user_id">
				            </select>
						</div>
						<div class="text-right">
							<button class="btn btn-primary" id="sure" >提交</button>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
						<a href="" data-toggle="modal" data-dismiss="modal"
							data-target="#login"></a>

					</form>
					

					<script type="text/javascript">
		
						$('#sure')
								.click(
										function() {
										
											var book_id = $("#book_id option:selected").text();
											var user_id = $("#user_id option:selected").text();

											$
													.ajax({
														type : "post",
														url : "${pageContext.request.contextPath}/addloan",
														data : {
															book_id : book_id,
															user_id : user_id,
				
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
	   
	<div id="b" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="alert alert-danger" role="alert">
			该书籍库存量不足
			</div>
		</div>
	</div>
	
	<div id="u" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="alert alert-danger" role="alert">
			该用户还处于欠款状态，不能借书
			</div>
	</div>
	</div>
	
	<div id="t" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="alert alert-danger" role="alert">
			您已经借了两本书，不能继续借书！
			</div>
	</div>
	</div>
	
		<div id="m" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="alert alert-success" role="alert">
			状态正确，可以借阅！
			</div>
	</div>
	</div>
	
	
<!--  	   <div class="addBody" style="width:100%; display: none;position: absolute;top:10px">
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
		                        <label class="col-sm-2 control-label">用户编号</label>
		                        <div class="col-sm-10">
		                            <input type="text" class="form-control" name="add_book_name" id="add_book_name"/>
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
	
	
	
	-->
	
	
	
	
	
	
	
	
</body>
</html>
