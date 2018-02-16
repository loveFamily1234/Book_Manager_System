package Book_Manager_System_Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_Dao.Public;
import Book_Manager_Dao.User_loan;
import Book_Manager_control.Loaning_Recordcontrol;
import Book_Manager_control.Pubiccontrol;
import net.sf.json.JSONArray;

public class QueryPublic extends ActionSupport{
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
	public void querypublic() throws IOException{
//		System.out.println(pageSize+" "+pageNumber);
//		System.out.println("sdfdsfdsfdsfdsfdsfsd");
		List<Public> list=Pubiccontrol.queryAll();
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
