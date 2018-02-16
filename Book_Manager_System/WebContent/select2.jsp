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
<link href="style/css/select2.css" rel="stylesheet" />
<link href="style/css/animate.min.css" rel="stylesheet" />
<link href="style/css/style.min.css" rel="stylesheet" />
<script src="style/js/bootstrap-table.min.js"></script>
<script src="style/js/bootstrap-editable.js"></script>
<script src="style/js/bootstrap-table-editable.js"></script>
<script src="style/js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script src="style/js/bootstrap-table-export.js"></script>
<script src="style/js/select2.js"></script>
<script src="style/js/tableExport.js"></script>
<script type="text/javascript">  
$(document).ready(function () { 

	   $("#test_3").select2({
           language: "zh-CN", //设置 提示语言
           width: "100%", //设置下拉框的宽度
           placeholder: "请选择",
           tags: true,
           maximumSelectionLength: 2  //设置最多可以选择多少项
       });


	   $.ajax({  
	        url : "${pageContext.request.contextPath}/queryuser", //所需要的列表接口地址  
	        type : "post",  
	        dataType : "json",  
	        success : function(data) { 
	     //       alert(JSON.stringify(data.length)); 
	     //       if (data.msg == "获取列表成功！") {  
	                var h = "";  
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
				//		alert(JSON.stringify(obj));   
	                	h += "<option><span class='list-group-item disabled'></span>"+obj.id+"</option>";  
	                	}
	                $("#first").append(h);//append 添加进去并展示  
	        //        $("#datatable_ajax_model")//当点击后，将选中的text传到id为content的文本框中。  
	         //               .on(  
	         //                       "change",  
	         //                       function(a, b, c) {  
	          //                          $("#content").val(  
	           //                                 $("#datatable_ajax_model option:selected").text());  
	          //                     })  
	    //        }  
	        }  
	    }); 
	 
	   
	  /* $("#first").select2({    
           ajax: {    
               url:  "${pageContext.request.contextPath}/queryuser",    
               dataType: 'json',    
               delay: 250,    
               data: function (params) {    
                   return {    
                   //    likeId: params.term, // 函数的参数    
                       //page: params.page  //分页显示先不要，没有效果    
                   };    
               },    
               processResults: function (data, params) {
                    alert(data);
                   //params.page = params.page || 1;    
                   return {    
   
                       results: data.items,    
                       //pagination: {    
                       //    more: (params.page * 10) < data.total_count    
                       //}    
                   };    
               },    
               cache: true    
           },    
           escapeMarkup: function (markup) { return markup; }, // let our custom formatter work    
           minimumInputLength: 1,    
           templateResult: formatRepo,    
           templateSelection: formatRepo    
       });    
       function formatRepo(repo) {    
           if (repo.loading) return repo.text;    
           var markup = "<div>" + repo.name + "</div>";    
           return markup;    
       }    */


});
</script>  
<title>在此处插入标题</title>
</head>
<body>
<div id="body"> 

<select class="selectpicker form-control" data-live-search="true" id="first" name="first"> 

</select>  

 
<select id="test_3" class="form-control js-example-placeholder-multiple js-states select2-hidden-accessible" multiple="multiple">
        <optgroup label="Alaskan/Hawaiian Time Zone">
            <option value="AK" imgPath="https://select2.github.io/vendor/images/flags/ak.png">Alaska</option>
            <option value="HI" imgPath="https://select2.github.io/vendor/images/flags/hi.png">Hawaii</option>
        </optgroup>
        <optgroup label="Pacific Time Zone">
            <option value="CA" imgPath="https://select2.github.io/vendor/images/flags/ca.png" style="color:#FFF">California</option>
            <option value="NV" imgPath="https://select2.github.io/vendor/images/flags/nv.png">Nevada</option>
            <option value="OR" imgPath="https://select2.github.io/vendor/images/flags/or.png">Oregon</option>
            <option value="WA" imgPath="https://select2.github.io/vendor/images/flags/wa.png">Washington</option>
        </optgroup>
        <optgroup label="Mountain Time Zone">
            <option value="AZ" imgPath="https://select2.github.io/vendor/images/flags/az.png">Arizona</option>
            <option value="CO" imgPath="https://select2.github.io/vendor/images/flags/co.png">Colorado</option>
            <option value="ID" imgPath="https://select2.github.io/vendor/images/flags/id.png">Idaho</option>
            <option value="MT" imgPath="https://select2.github.io/vendor/images/flags/mt.png">Montana</option>
            <option value="NE" imgPath="https://select2.github.io/vendor/images/flags/ne.png">Nebraska</option>
            <option value="NM" imgPath="https://select2.github.io/vendor/images/flags/nm.png">New Mexico</option>
            <option value="ND" imgPath="https://select2.github.io/vendor/images/flags/nd.png">North Dakota</option>
            <option value="UT" imgPath="https://select2.github.io/vendor/images/flags/ut.png">Utah</option>
            <option value="WY" imgPath="https://select2.github.io/vendor/images/flags/wy.png">Wyoming</option>
        </optgroup>
        <optgroup label="Central Time Zone">
            <option value="AL">Alabama</option>
            <option value="AR">Arkansas</option>
            <option value="IL">Illinois</option>
            <option value="IA">Iowa</option>
            <option value="KS">Kansas</option>
            <option value="KY">Kentucky</option>
            <option value="LA">Louisiana</option>
            <option value="MN">Minnesota</option>
            <option value="MS">Mississippi</option>
            <option value="MO">Missouri</option>
            <option value="OK">Oklahoma</option>
            <option value="SD">South Dakota</option>
            <option value="TX">Texas</option>
            <option value="TN">Tennessee</option>
            <option value="WI">Wisconsin</option>
        </optgroup>
        <optgroup label="Eastern Time Zone">
            <option value="CT">Connecticut</option>
            <option value="DE">Delaware</option>
            <option value="FL">Florida</option>
            <option value="GA">Georgia</option>
            <option value="IN">Indiana</option>
            <option value="ME">Maine</option>
            <option value="MD">Maryland</option>
            <option value="MA">Massachusetts</option>
            <option value="MI">Michigan</option>
            <option value="NH">New Hampshire</option>
            <option value="NJ">New Jersey</option>
            <option value="NY">New York</option>
            <option value="NC">North Carolina</option>
            <option value="OH">Ohio</option>
            <option value="PA">Pennsylvania</option>
            <option value="RI">Rhode Island</option>
            <option value="SC">South Carolina</option>
            <option value="VT">Vermont</option>
            <option value="VA">Virginia</option>
            <option value="WV">West Virginia</option>
        </optgroup>
    </select>
</div>  
  
  
  <select>
  <option style="color: #FFF">asdfasd</option>
  </select>
  
  
  

</body>
</html>