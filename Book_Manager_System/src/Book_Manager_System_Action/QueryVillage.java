package Book_Manager_System_Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_Dao.City;
import Book_Manager_Dao.Village;
import Book_Manager_control.Placecontrol;
import net.sf.json.JSONArray;

public class QueryVillage extends ActionSupport{
	private String parentiD;

	public String getParentiD() {
		return parentiD;
	}

	public void setParentiD(String parentiD) {
		this.parentiD = parentiD;
	}
	public void queryvillage() throws IOException{
	//	System.out.println("农村"+parentiD);
		 List<Village> list=Placecontrol.queryVillage(parentiD);
		  ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
		  PrintWriter out = ServletActionContext.getResponse().getWriter(); 
	      JSONArray json = JSONArray.fromObject(list);
	//      System.out.println(json.toString());
	      out.println(json);
	      out.flush(); 
	      out.close();
	}
	
}
