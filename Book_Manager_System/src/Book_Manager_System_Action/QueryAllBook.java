package Book_Manager_System_Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_Dao.Stock_Size;
import Book_Manager_control.Bookcontrol;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class QueryAllBook extends ActionSupport{
	public void queryallBook() throws IOException{
		

			ArrayList<Stock_Size> list=(ArrayList<Stock_Size>) Bookcontrol.queryAll();
	          ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
	          PrintWriter out = ServletActionContext.getResponse().getWriter(); 
	          JSONArray json = JSONArray.fromObject(list);
	//          System.out.println(json.toString());
	          out.println(json);
	          out.flush(); 
	          out.close();
		}
}
