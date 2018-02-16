<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="style/css/bootstrap.min.css" />
<link href="style/css/bootstrap-table.min.css" rel="stylesheet"/> 
<link href="style/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/> 
<script src="style/js/bootstrap-table.min.js"></script>

<script src="style/js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script src="style/js/bootstrap-datetimepicker.min.js"></script>
<script src="style/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="style/js/moment-with-locales.js"></script>
<script type="text/javascript">
/*function Datetime() {
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
    document.getElementById("nowdate").value = mydate;
}
$(document).ready(function () { 

	Datetime();
});*/



$(function () {


    //默认绑定省
    ProviceBind();
    //绑定事件
    $("#Province").change( function () {
        CityBind();
    })
    
    $("#City").change(function () {
    	VillageBind();
    })
})
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
            alert(JSON.stringify(data));
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
            alert(JSON.stringify(data));
            for( var depart_index = 0 ; depart_index < data.length; depart_index++ )
            {  
        	var depart = data[depart_index]; 
      //  	alert(JSON.stringify(depart)); 
            var obj = JSON.parse(JSON
					.stringify(depart)); 
//			alert(JSON.stringify(obj));   
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
            alert(JSON.stringify(data));
             for( var depart_index = 0 ; depart_index < data.length; depart_index++ )
            {  
        	var depart = data[depart_index]; 
      //  	alert(JSON.stringify(depart)); 
            var obj = JSON.parse(JSON
					.stringify(depart)); 
//			alert(JSON.stringify(obj));   
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
<title>登录失败页面</title>

</head> 
<body>  
<!--  <a class='input-group date' id='datetimepicker1' style="float: left; left: 320px;">
                <input type='text' class="form-control" id='nowdate' style="width: 150px; height: 30px;" />
                <span class="input-group-addon" style="float: left; width: 50px; height: 30px;">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
</a>
-->
<div class="form-group">
                <div class="col-sm-2 text-center">
                   省
                </div>
                <div class="col-sm-2">
                    <select class="form-control" name="Province" id="Province">
                        <option>==请选择===</option>
                    </select>


                </div>
                <div class="col-sm-1 text-center">
                   市
                </div>
                <div class="col-sm-2">
                    <select class="form-control" name="City" id="City">
                        <option>==请选择===</option>
                    </select>
                </div>
                <div class="col-sm-1 text-center">
                县/区
                </div>
                <div class="col-sm-2">
                    <select class="form-control" name="Village" id="Village">
                        <option>==请选择===</option>
                    </select>
                </div>
            </div>
</body>  
</html>