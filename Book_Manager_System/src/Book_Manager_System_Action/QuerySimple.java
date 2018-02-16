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

public class QuerySimple extends ActionSupport{
	public String pageSize;  //个数
	public String pageNumber;  //页数
	public String bookName;
	public String book_name;
	public String book_author;
	public String book_publish;
	public String book_time_start;
	public String book_time_end;
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
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getBook_publish() {
		return book_publish;
	}
	public void setBook_publish(String book_publish) {
		this.book_publish = book_publish;
	}
	public String getBook_time_start() {
		return book_time_start;
	}
	public void setBook_time_start(String book_time_start) {
		this.book_time_start = book_time_start;
	}
	public String getBook_time_end() {
		return book_time_end;
	}
	public void setBook_time_end(String book_time_end) {
		this.book_time_end = book_time_end;
	}
	public void querySimple() throws IOException{
		this.bookName= new String(bookName.getBytes("iso-8859-1"),"utf-8");
		System.out.println(pageSize+" "+pageNumber);
		System.out.println(bookName);
		ArrayList<Stock_Size> list=(ArrayList<Stock_Size>) Bookcontrol.querySimple(bookName);
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
		  System.out.println("i="+(number-1)*size+"  compare="+compare);
		  for(int i=(number-1)*size;i<compare;i++){
			  temp.add(list.get(i));
		  }
		  
		  Map<String,Object> map = new HashMap<String,Object>();
	      
          map.put("total", list.size());
          
          map.put("rows",temp);
          ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
          PrintWriter out = ServletActionContext.getResponse().getWriter(); 
          JSONObject json = JSONObject.fromObject(map);
          System.out.println(json.toString());
          out.println(json);
          out.flush(); 
          out.close();
	}
	public void queryNull() throws IOException{
		this.bookName= new String(bookName.getBytes("iso-8859-1"),"utf-8");
		System.out.println(pageSize+" "+pageNumber);
		System.out.println(bookName);
		ArrayList<Book> list=(ArrayList<Book>) Bookcontrol.queryNull(bookName);
//		  for(int i=0;i<list.size();i++){
//			  System.out.println(list.get(i).getBook_name());
//			  
//		  }
		  ArrayList<Book> temp=new ArrayList<>();
		  int compare=0;
		  int size=Integer.parseInt(pageSize); //单页的个数
		  int number=Integer.parseInt(pageNumber); //当前的页码
		  int remain=list.size()-(number-1)*size;
		  if(remain>=size){
			  compare=size;
		  }else{
			  compare=list.size();
		  }
		  System.out.println("i="+(number-1)*size+"  compare="+compare);
		  for(int i=(number-1)*size;i<compare;i++){
			  temp.add(list.get(i));
		  }
		  
		  Map<String,Object> map = new HashMap<String,Object>();
	      
          map.put("total", list.size());
          
          map.put("rows",temp);
          ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
          PrintWriter out = ServletActionContext.getResponse().getWriter(); 
          JSONObject json = JSONObject.fromObject(map);
          System.out.println(json.toString());
          out.println(json);
          out.flush(); 
          out.close();
	}
}
