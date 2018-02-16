package Book_Manager_System_Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;


import Book_Manager_Dao.User;

import Book_Manager_control.Usercontrol;
import net.sf.json.JSONArray;

public class QueryUser {
	public void queryuser() throws IOException{
		
		  ArrayList<User> list=(ArrayList<User>) Usercontrol.queryAll();
          ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
          PrintWriter out = ServletActionContext.getResponse().getWriter(); 
          JSONArray json = JSONArray.fromObject(list);
 //         System.out.println(json.toString());
          out.println(json);
          out.flush(); 
          out.close();
	}
}
