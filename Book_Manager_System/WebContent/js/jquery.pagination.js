var pageIndex = -1;  //页面索引初始值 
 var pageSize = 5;  //每页显示条数初始化，修改显示条数，修改这里即可 
 var pageCount = 0;  //每页显示条数初始化，修改显示条数，修改这里即可 
 InitTable(pageIndex); //Load事件，初始化表格数据，页面索引为0（第一页） 
  //分页，PageCount是总条目数，这是必选参数，其它参数都是可选 
  //翻页调用 
 function PageCallback(index, jq) { 
  InitTable(index); 
  } 
  
 //请求数据 
 function InitTable(pi) { 
  var sendpn = 0; 
  if(pi!=-1){ 
   sendpn = pi; 
  } 
  $.ajax({ 
   type: "POST", 
   dataType: "json", 
   url: 'findEquipmentInfo.action',  //提交到一般处理程序请求数据 
   data: {pageNo:sendpn,pageSize:pageSize},   //提交两个参数：pageIndex(页面索引)，pageSize(显示条数) 
   success: function(data) { 
    var tabletr=''; 
    $(data.root).each(function(i,obj){ 
      tabletr=tabletr+"<tr><td><input type='checkbox' class='checkboxAll' value='"+obj.id+"'/></td><td>"+obj.deviceName+"</td>"+"<td>"+obj.deviceIP+"</td>"+"<td>"+obj.companyName+"</td>"+"<td>"+obj.deviceSN+"</td>"+"<td>"+obj.devicePN+"</td>"+"<td>"+obj.inTime+"</td>"+"<td>"+obj.warrantyTime+"</td>"+"</tr>"; 
    }); 
    $("#tablepos_tbody").html(tabletr); 
    pageCount = data.total; 
    if(pageIndex==-1){ 
     pageIndex=0; 
     $("#Pagination").pagination(pageCount, { 
      callback: PageCallback, //PageCallback() 为翻页调用次函数。 
      prev_text: "« 上一页", 
      next_text: "下一页 »", 
      items_per_page:pageSize, 
      num_edge_entries: 2,  //两侧首尾分页条目数 
      num_display_entries: 6, //连续分页主体部分分页条目数 
      current_page: pageIndex, //当前页索引 
     }); 
    } 
   } 
  }); 
 } 