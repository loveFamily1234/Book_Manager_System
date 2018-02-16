<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="style/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript">
	function check1(otl) {
		if (otl == '') {
			$('#kong').modal('show');
			setTimeout(function() {
				$('#kong').modal('hide')
			}, 2000);
			$('#kong')
					.on(
							'hidden.bs.modal',
							function() {
								document.getElementsByTagName('body')[0].className = 'modal-open';
							});
			document.getElementById("id").focus();
		} else {
			var fdStart = otl.indexOf("314");
			var fdstart = otl.indexOf("214");
			if (fdStart == -1 && fdstart == -1) {
				$('#geshi').modal('show');
				setTimeout(function() {
					$('#geshi').modal('hide')
				}, 2000);
				$('#geshi')
						.on(
								'hidden.bs.modal',
								function() {
									document.getElementsByTagName('body')[0].className = 'modal-open';
								});
				document.getElementById("id").focus();
			}
		}
	}

	function check2(otl) {
		if (otl == '') {
			$('#kong').modal('show');
			setTimeout(function() {
				$('#kong').modal('hide')
			}, 2000);
			$('#kong')
					.on(
							'hidden.bs.modal',
							function() {
								document.getElementsByTagName('body')[0].className = 'modal-open';
							});
			document.getElementById("name").focus();
		}
	}
	function check3(otl) {
		if (otl == '') {
			$('#kong').modal('show');
			setTimeout(function() {
				$('#kong').modal('hide')
			}, 2000);
			$('#kong')
					.on(
							'hidden.bs.modal',
							function() {
								document.getElementsByTagName('body')[0].className = 'modal-open';
							});
			document.getElementById("classmate").focus();
		}
	}
	/*function check4(otl){
	 if(otl==''){
	 $('#kong').modal('show');
	 setTimeout(function(){
	 $('#kong').modal('hide')
	 },2000);
	 $('#kong').on('hidden.bs.modal', function () {  
	 document.getElementsByTagName('body')[0].className = 'modal-open';  
	 });  
	 document.getElementById("address").focus();
	 }
	 }*/
	function check5(otl) {
		if (otl == '') {
			$('#kong').modal('show');
			setTimeout(function() {
				$('#kong').modal('hide')
			}, 2000);
			$('#kong')
					.on(
							'hidden.bs.modal',
							function() {
								document.getElementsByTagName('body')[0].className = 'modal-open';
							});
			document.getElementById("phone").focus();
		}
	}
	function check6(otl) {
		if (otl == '') {
			$('#kong').modal('show');
			setTimeout(function() {
				$('#kong').modal('hide')
			}, 2000);
			$('#kong')
					.on(
							'hidden.bs.modal',
							function() {
								document.getElementsByTagName('body')[0].className = 'modal-open';
							});
			document.getElementById("password1").focus();
		}
	}
	function check7(otl) {
		if (otl != document.getElementById("password1").value) {
			$('#yanzheng').modal('show');
			setTimeout(function() {
				$('#yanzheng').modal('hide')
			}, 2000);
			$('#yanzheng')
					.on(
							'hidden.bs.modal',
							function() {
								document.getElementsByTagName('body')[0].className = 'modal-open';
							});
		}
	}
	$(function() {
		/*$('#register').on('show.bs.modal', function () {
		    var remo1 = document.getElementById('id');
		    var remo2 = document.getElementById('name');
		    var remo3 = document.getElementById('classmate');
		    var remo4 = document.getElementById('address');
		    var remo5 = document.getElementById('phone');
		    var remo6= document.getElementById('password1');
		    var remo7 = document.getElementById('password2');
		    remo1.removeAttribute('onblur');
		    remo2.removeAttribute('onblur');
		    remo3.removeAttribute('onblur');
		    remo4.removeAttribute('onblur');
		    remo5.removeAttribute('onblur');
		    remo6.removeAttribute('onblur');
		    remo7.removeAttribute('onblur');
			})*/

		$('#register').on('show.bs.modal', function() {
			 ProviceBind();
			    //绑定事件
			    $("#Province").change( function () {
			        CityBind();
			    })
			    
			    $("#City").change(function () {
			    	VillageBind();
			    })
		})

	});


	function Bind(str) {
	    alert($("#Province").html());
	    $("#Province").val(str);


	}
	function ProviceBind() {
	    //清空下拉数据
	    $("#Province").html("");
	    var str = "<option>==请选择===</option>";
	    $.ajax({
	        type: "POST",
	        url: "${pageContext.request.contextPath}/queryprovince",
	        data: { 
	            "parentiD": "", 
	            "MyColums": "Province" 
	             },
	        dataType: "JSON",
	        async: false,
	        success: function (data) {
	            //从服务器获取数据进行绑定
	 //           alert(JSON.stringify(data));
	             for( var depart_index = 0 ; depart_index < data.length; depart_index++ )
	                    {  
	                	var depart = data[depart_index]; 
	              //  	alert(JSON.stringify(depart)); 
	                    var obj = JSON.parse(JSON
								.stringify(depart)); 
			//			alert(JSON.stringify(obj));   
	                    str += "<option value=" + obj.province_id + ">" + obj.province_name+ "</option>";
	                  }
	            //将数据添加到省份这个下拉框里面
	            $("#Province").append(str);
	        },
	        error: function () { alert("Error"); }
	    });


	   
	        
	}
	function CityBind() {

		
	    var provice = $("#Province option:selected").text();
	    //判断省份这个下拉框选中的值是否为空
	    if (provice == "") {
	        return;
	    }
	    $("#City").html("");
	    var str = "<option>==请选择===</option>";


	    $.ajax({
	        type: "POST",
	        url: "${pageContext.request.contextPath}/querycity",
	        data: { 
	            "parentiD": provice, 

	                },
	        dataType: "JSON",
	        async: false,
	        success: function (data) {
	            //从服务器获取数据进行绑定
	     //       alert(JSON.stringify(data));
	            for( var depart_index = 0 ; depart_index < data.length; depart_index++ )
	            {  
	        	var depart = data[depart_index]; 
	      //  	alert(JSON.stringify(depart)); 
	            var obj = JSON.parse(JSON
						.stringify(depart)); 
//				alert(JSON.stringify(obj));   
	            str += "<option value=" + obj.city_id + ">" + obj.city_name+ "</option>";
	          }
	            //将数据添加到省份这个下拉框里面
	            $("#City").append(str);
	        },
	        error: function () { alert("Error"); }
	    });


	}
	function VillageBind() {
	    var city = $("#City option:selected").text();
	    //判断市这个下拉框选中的值是否为空
	    if (city == "") {
	        return;
	    }

	    $("#Village").html("");
	    var str = "<option>==请选择===</option>";
	    //将市的ID拿到数据库进行查询，查询出他的下级进行绑定
	    $.ajax({
	        type: "POST",
	        url: "${pageContext.request.contextPath}/queryvillage",
	        data: { 
	            "parentiD": city,
	            },
	        dataType: "JSON",
	        async: false,
	        success: function (data) {
	            //从服务器获取数据进行绑定
	     //       alert(JSON.stringify(data));
	             for( var depart_index = 0 ; depart_index < data.length; depart_index++ )
	            {  
	        	var depart = data[depart_index]; 
	      //  	alert(JSON.stringify(depart)); 
	            var obj = JSON.parse(JSON
						.stringify(depart)); 
//				alert(JSON.stringify(obj));   
	            str += "<option value=" + obj.village_id + ">" + obj.villag_name+ "</option>";
	          }
	            //将数据添加到省份这个下拉框里面
	            $("#Village").append(str);
	        },
	        error: function () { alert("Error"); }
	    });
	    //$.post("/Home/GetAddress", { parentiD: provice, MyColums: "Village" }, function (data) {  
	    //    $.each(data.Data, function (i, item) {
	    //        str += "<option value=" + item.Id + ">" + item.MyTexts + "</option>";
	    //    })
	    //    $("#Village").append(str);
	    //})
	}
</script>
<title>图书管理系统</title>
<style type="text/css">
.form {
	background: rgba(255, 255, 255, 0.7);
	height: 400px;
	width: 400px;
	margin: 100px auto;
	border-radius: 10px;
	position: relative;
	left: 400px;
	top: 50px;
}
</style>

</head>
<body>



	<div class="container">
		<div class="form ">
			<form action="login" method="post">
				<div class="mycenter ">
					<div class="mysign">
						<div class="col-lg-11 text-center text-info">
							<h2>请登录</h2>
						</div>
						<div class="col-lg-10" style="padding: 10px"></div>
						<div class="col-lg-10">
							<input type="text" class="form-control input-lg" name="username"
								placeholder="请输入学号" required autofocus />
						</div>
						<div class="col-lg-10" style="padding: 10px"></div>
						<div class="col-lg-10">
							<input type="password" class="form-control input-lg"
								name="password" placeholder="请输入密码" required autofocus />
						</div>
						<div class="col-lg-10" style="padding: 5px"></div>
						<div class="col-lg-10 mycheckbox checkbox">
							<input type="checkbox" class="col-lg-1">记住密码</input>
						</div>
						<div class="col-lg-10" style="padding: 5px"></div>
						<div class="col-lg-10">
							<button type="submit" class="btn btn-success col-lg-12 btn-lg">登录</button>
						</div>
						<div class="col-lg-10" style="padding: 10px"></div>
						<div class="col-lg-5 pull-right">
							<a data-toggle="modal" data-target="#register"
								style="cursor: hand"><span class="glyphicon glyphicon-user"></span>
								注册 </a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div id="register" class="modal fade" tabindex="-1"
		style="height: 100%" onmousedown="close()">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h1 class="text-center">注册</h1>
				</div>
				<div class="modal-body">
					<form class="form-group" action="">
						<div class="form-group">
							<label for="">编号</label> <input class="form-control" type="text"
								placeholder="本科生编号开头：314；研究生为214" name="id" id="id"
								onBlur="check1(this.value)">
						</div>
						<div class="form-group">
							<label for="">用户名</label> <input class="form-control" type="text"
								placeholder="" name="name" id="name" onBlur="check2(this.value)">
						</div>
						<div class="form-group">
							<label for="">班级</label> <input class="form-control" type="text"
								name="classmate" id="classmate" onBlur="check3(this.value)">
						</div>
						<div class="form-group">
							<!--  	<label for="">地址</label> <input class="form-control" type="text"
								name="address" id="address" onBlur="check4(this.value)">-->
						
						
					<label for="">省</label><select class="form-control" name="Province" id="Province">
									<option>==请选择===</option>
								</select>
							</div>
			
							
					<div class="form-group">
					<label for="">市</label>	<select class="form-control" name="City" id="City">
									<option>==请选择===</option>
								</select>
							
						</div>	
						<div class="form-group">
					
					<label for="">县</label><select class="form-control" name="Village" id="Village">
									<option>==请选择===</option>
								</select>
						</div>
			

						<div class="form-group">
					<label for="">电话号码</label>	<input class="form-control" type="text"
								placeholder="电话号码" name="phone" id="phone" onBlur="check5(this.value)">
						</div>
						<div class="form-group ">
							年龄:<select class="form-control col-lg-3 col-md-6 col-sm-12"
								id="age">
								<option>18</option>
								<option>19</option>
								<option>20</option>
								<option>21</option>
								<option>22</option>
							</select>
						</div>
						<div class="radio">
							<label> <input type="radio" name="sex" id="sex" value="男"
								checked> 男
							</label> <label> <input type="radio" name="sex" id="sex"
								value="女" style="margin-left: 20px"> 女
							</label>
						</div>
						<div class="form-group ">
							权限:<select class="form-control col-lg-3 col-md-6 col-sm-12"
								id="position">
								<option>本科生</option>
								<option>研究生</option>
							</select>
						</div>
						<div class="form-group">
							<label for="">密码</label> <input class="form-control"
								type="password" placeholder="" name="password1" id="password1"
								onBlur="check6(this.value)">
						</div>
						<div class="form-group">
							<label for="">再次输入密码</label> <input class="form-control"
								type="password" placeholder="" name="password2" id="password2"
								onBlur="check7(this.value)">
						</div>

						<div class="text-right">
							<button class="btn btn-primary" id="commentSubmit">提交</button>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
						<a href="" data-toggle="modal" data-dismiss="modal"
							data-target="#login">已有账号？点我登录</a>

					</form>


					<script type="text/javascript">
						$('#commentSubmit')
								.click(
										function() {
											var age = $('#age option:selected')
													.text();//选中的文本
											var id = $('#id').val();
											var userName = $('#name').val();
											var password = $('#password1')
													.val();
											var password1 = $('#password2')
													.val();
											var address = $("#Province option:selected").text()+$("#City option:selected").text()+$("#Village option:selected").text();
											var classmate = $('#classmate')
													.val();
											var phone = $('#phone').val();
											var sex = $('input:radio:checked')
													.val();
											var position = $(
													'#position option:selected')
													.text();

											$
													.ajax({
														type : "post",
														url : "${pageContext.request.contextPath}/hello",
														data : {
															userName : userName,
															password : password,
															address : address,
															age : age,
															id : id,
															classmate : classmate,
															phone : phone,
															sex : sex,
															position : position
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


	<div id="kong" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="alert alert-warning" role="alert">内容不全，请填好之后提交！</div>
			</div>
		</div>
	</div>

	<div id="geshi" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="alert alert-warning" role="alert">编号格式有误；请重新输入！</div>
			</div>
		</div>
	</div>

	<div id="dianhua" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="alert alert-warning" role="alert">电话号码不正确，请重新输入！</div>
			</div>
		</div>
	</div>
	<div id="yanzheng" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="alert alert-warning" role="alert">两次密码不一致，请重新输入！</div>
			</div>
		</div>
	</div>


</body>
</html>
