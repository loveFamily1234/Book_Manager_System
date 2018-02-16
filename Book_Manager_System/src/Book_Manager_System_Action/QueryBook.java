package Book_Manager_System_Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder.In;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_Dao.Book;
import Book_Manager_Dao.Stock_Size;
import Book_Manager_control.Bookcontrol;
import net.sf.json.JSONObject;

public class QueryBook extends ActionSupport{
	public String pageSize;  //个数
	public String pageNumber;  //页数
	public String getPageSize() {
		return pageSize;
	}
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(String pageNumber) {
		this.pageNumber = pageNumber;
	}
	
	public void queryBook() throws IOException{
		
	//	System.out.println(pageSize+" "+pageNumber);
	//	System.out.println("查询书籍");
		ArrayList<Stock_Size> list=(ArrayList<Stock_Size>) Bookcontrol.queryAll();
//		  for(int i=0;i<list.size();i++){
//			  System.out.println(list.get(i).getBook_name());
//			  
//		  }
		  ArrayList<Stock_Size> temp=new ArrayList<>();
		  int compare=0;
		  int size=Integer.parseInt(pageSize); //单页的个数
		  int number=Integer.parseInt(pageNumber); //当前的页码
		  int remain=list.size()-(number-1)*size;
		  if(remain>=size){
			  compare=size;
		  }else{
			  compare=list.size();
		  }
//		  System.out.println("i="+(number-1)*size+"  compare="+compare);
		  for(int i=(number-1)*size;i<compare;i++){
			  temp.add(list.get(i));
		  }
		  
		  Map<String,Object> map = new HashMap<String,Object>();
	      
          map.put("total", list.size());
          
          map.put("rows",temp);
          ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
          PrintWriter out = ServletActionContext.getResponse().getWriter(); 
          JSONObject json = JSONObject.fromObject(map);
  //        System.out.println(json.toString());
          out.println(json);
          out.flush(); 
          out.close();
	}
}
