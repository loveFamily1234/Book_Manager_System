package Book_Manager_System_Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_Dao.User_loan;
import Book_Manager_control.Loaning_Recordcontrol;
import Book_Manager_control.Stockcontrol;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class QueryInfo extends ActionSupport{
	private String info_id;
	private String info_name;
	private String info_classmate;
	private String info_sex;
	private String info_age;
	private String info_address;
	private String info_phone;
	private String info_position;
	
	public String getInfo_id() {return info_id;}
	public String getInfo_name() {return info_name;}
	public String getInfo_classmate() {return info_classmate;}
	public String getInfo_sex() {return info_sex;}
	public String getInfo_age() {return info_age;}
	public String getInfo_address() {return info_address;}
	public String getInfo_phone() {return info_phone;}
	public String getInfo_position() {return info_position;}
	
	public void setInfo_id(String info_id) {this.info_id = info_id;}
	public void setInfo_name(String info_name) {this.info_name = info_name;}
	public void setInfo_classmate(String info_classmate) {this.info_classmate = info_classmate;}
	public void setInfo_sex(String info_sex) {this.info_sex = info_sex;}
	public void setInfo_age(String info_age) {this.info_age = info_age;}
	public void setInfo_address(String info_address) {this.info_address = info_address;}
	public void setInfo_phone(String info_phone) {this.info_phone = info_phone;}
	public void setInfo_position(String info_position) {this.info_position = info_position;}
	
	public void queryInfo() throws IOException{
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
