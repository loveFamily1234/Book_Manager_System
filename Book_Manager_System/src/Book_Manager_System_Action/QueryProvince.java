package Book_Manager_System_Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_Dao.Province;
import Book_Manager_Dao.Public;
import Book_Manager_control.Placecontrol;
import Book_Manager_control.Pubiccontrol;
import net.sf.json.JSONArray;

public class QueryProvince extends ActionSupport{
	private String parentiD;
	private String MyColums;
	public String getParentiD() {
		return parentiD;
	}
	public void setParentiD(String parentiD) {
		this.parentiD = parentiD;
	}
	public String getMyColums() {
		return MyColums;
	}
	public void setMyColums(String myColums) {
		MyColums =myColums;
	}
	public void queryprovince() throws IOException{
//		System.out.println("省份"+parentiD+"  "+MyColums);
		  List<Province> list=Placecontrol.queryProvince();
		  ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
		  PrintWriter out = ServletActionContext.getResponse().getWriter(); 
	      JSONArray json = JSONArray.fromObject(list);
//	      System.out.println(json.toString());
	      out.println(json);
	      out.flush(); 
	      out.close();
	}
}
