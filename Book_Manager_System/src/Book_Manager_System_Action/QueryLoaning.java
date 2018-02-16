package Book_Manager_System_Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_Dao.User_loan;
import Book_Manager_control.Loaning_Recordcontrol;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class QueryLoaning extends ActionSupport{
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
	public void queryLoaning() throws IOException{
	//	System.out.println(pageSize+" "+pageNumber);
//		System.out.println("dsfdsf");
		ArrayList<User_loan> list=Loaning_Recordcontrol.queryAll();
//		System.out.println("sdfd"+list.get(0).getBookname());
        ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
         PrintWriter out = ServletActionContext.getResponse().getWriter(); 
         JSONArray json = JSONArray.fromObject(list);
 //        System.out.println(json.toString());
         out.println(json);
         out.flush(); 
         out.close();
	}
}
