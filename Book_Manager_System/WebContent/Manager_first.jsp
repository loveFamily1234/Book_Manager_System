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
<script type="text/javascript">
	
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
<body
	style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; padding: 10px;">
	<div class="tableBody">
		<div class="panel panel-default"
			style="background: #3399CC; height: 50px">

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
						<li class="active" style="font-size: 15px"><a
							href="Manager_first.jsp"> <i
								class="glyphicon glyphicon-th-large"></i> 首页
						</a></li>
						<li style="font-size: 15px"><a href="Manager_second.jsp"><span
								class="glyphicon glyphicon-qrcode"></span> 图书管理</a></li>
						<!-- 			<li style="font-size: 15px"><a href="#dede"><span class="glyphicon glyphicon-file"></span> 图书状态登记</a></li> -->
						<li style="font-size: 15px"><a href="Manager_third.jsp"><span
								class="glyphicon glyphicon-plus-sign"></span> 借阅登记</a></li>
						<li style="font-size: 15px"><a href="Manager_four.jsp"><span
								class="glyphicon glyphicon-edit"></span>出版社信息查询</a></li>

					</ul>
				</div>

				<div class="col-md-10">
				
				     <div class="panel panel-success">
                            <div class="panel-body">
                               <img alt="" src="img/tishi.png"/><span style="color:red;">&nbsp;&nbsp;&nbsp;欢迎进入图书管理系统!</span>
                              
                             </div>
                     </div>
				
						<div class="panel panel-default">
							<!-- Default panel contents -->
							<div class="panel-heading"><h3>图书管理系统</h3></div>
							<div class="panel-body">
								<div style="font-size: 20px;">版权信息</div>
							</div>

							<!-- List group -->
							<ul class="list-group">
								<li class="list-group-item" style="font-size: 15px;"><strong>当前版本：1.0</strong></li>
								<li class="list-group-item" style="font-size: 15px;"><strong>作者：    孙伟峰; 赵玲玲; 葛康; 刘耀东</strong></li>
								<li class="list-group-item" style="font-size: 15px;"><strong>电子邮件：1247155045@qq.com</strong></li>
							</ul>
				        </div>

			</div>
		</div>
</body>
</html>