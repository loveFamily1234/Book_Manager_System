<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="style/css/bootstrap.min.css" />
<script type="text/javascript" src="js/bootstrap.js"></script>
<title>在此处插入标题</title>
<style type="text/css">
.test {
	width: 300px;
	height: 200px;
	background: red;


}

/*
 采用的是CSS3的样式布局

 @MEDIA screen and (max-width:900px) and (min-width:300px) {
	.test {
		width: 100px;
		height: 100px;
		background: yellow;
	}
} */
</style>
<script>
$(document).ready(function(){
	$("#first").mouseover(function(){
		$("#id").hide("slow");
		});
});

$(function () {
	  $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
	  $('.tree li.parent_li > span').on('click', function (e) {
	    var children = $(this).parent('li.parent_li').find(' > ul > li');
	    if (children.is(":visible")) {
	      children.hide('fast');
	      $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
	    } else {
	      children.show('fast');
	      $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
	    }
	    e.stopPropagation();
	  });
	});
</script>
</head>
<body>
<h1 id="id">safdasfds</h1>
</br>
<form action="">
<div class="form-group has-error col-sm-5">
<select class="form-control col-lg-3 col-md-6 col-sm-12" >
<option>1</option>
<option>2</option>
<option>3</option>
</select>
</div>
</form>
</br>

<button type="button" class="btn btn-default btn-lg">
  <span class="glyphicon glyphicon-star" aria-hidden="true"></span> Star
</button>
</br>
<div class="dropdown">
<button class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
下拉列表
<span class="caret"></span>
</button>
<ul class="dropdown-menu aria-labelledby="dropdownMenu1"">
<li ><a href="#">1</a></li>
<li ><a href="#">2</a></li>
<li class="divider"></li>
<li><a href="#">3</a></li>
</ul>
</div>

</br>

<div class="input-group">
<div class="input-group-btn">
  <span class="input-group-addon glyphicon glyphicon-star" id="basic-addon1"></span>
</div>
  <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
</div>

</br>

<ul class="nav nav-tabs navbar-inverse">
  <li  class="active"><a href="#">Home</a></li>
  <li ><a href="#">Profile</a></li>
  <li ><a href="#">Messages</a></li>
</ul>
</br>

<nav aria-label="Page navigation">
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li onclick="stay()" id="first"><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

</br>

<div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-striped active" style="width: 100%;">
    100%
  </div>
</div>
</br>

<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">Panel heading</div>
  <div class="panel-body">
    <p>asfasdfdasfasdfasfasfasf</p>
  </div>

  <!-- Table -->
  <table class="table">
    ...
  </table>
</div>
</br>

<div class="tree well ">
		<ul>
			<li><span><i class="glyphicon glyphicon-folder-open"></i>
					Parent</span> <a href="">Goes somewhere</a>
				<ul>
					<li><span><i class="glyphicon glyphicon-minus-sign"></i>
							Child</span> <a href="">Goes somewhere</a>
						<ul>
							<li><span><i class="glyphicon glyphicon-leaf"></i>
									Grand Child</span> <a href="">Goes somewhere</a></li>
						</ul></li>
					<li><span><i class="glyphicon glyphicon-minus-sign"></i>
							Child</span> <a href="">Goes somewhere</a>
						<ul>
							<li><span><i class="glyphicon glyphicon-leaf"></i>
									Grand Child</span> <a href="">Goes somewhere</a></li>
							<li><span><i class="glyphicon glyphicon-minus-sign"></i>
									Grand Child</span> <a href="">Goes somewhere</a>
								<ul>
									<li><span><i class="glyphicon glyphicon-minus-sign"></i>
											Great Grand Child</span> <a href="">Goes somewhere</a>
										<ul>
											<li><span><i class="glyphicon glyphicon-leaf"></i>
													Great great Grand Child</span> <a href="">Goes somewhere</a></li>
											<li><span><i class="glyphicon glyphicon-leaf"></i>
													Great great Grand Child</span> <a href="">Goes somewhere</a></li>
										</ul></li>
									<li><span><i class="glyphicon glyphicon-leaf"></i>
											Great Grand Child</span> <a href="">Goes somewhere</a></li>
									<li><span><i class="glyphicon glyphicon-leaf"></i>
											Great Grand Child</span> <a href="">Goes somewhere</a></li>
								</ul></li>
							<li><span><i class="glyphicon glyphicon-leaf"></i>
									Grand Child</span> <a href="">Goes somewhere</a></li>
						</ul></li>
				</ul></li>
			<li><span><i class="glyphicon glyphicon-folder-open"></i>
					Parent2</span> <a href="">Goes somewhere</a>
				<ul>
					<li><span><i class="glyphicon glyphicon-leaf"></i>
							Child</span> <a href="">Goes somewhere</a></li>
				</ul></li>
		</ul>
	</div>
</body>
</html>