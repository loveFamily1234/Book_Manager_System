package Book_Manager_System_Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_control.Stockcontrol;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class QueryStock extends ActionSupport{
	private String book_id;
	
	public String getBook_id() {
		return book_id;
	}

	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public void querystock() throws IOException{
		String size=String.valueOf(Stockcontrol.quertsome(book_id));
		HashMap<String, String> map=new HashMap<>();
		map.put("size", size);
		JSONArray re=JSONArray.fromObject(map);
		ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
        PrintWriter out = ServletActionContext.getResponse().getWriter(); 
//        System.out.println(re.toString());
        out.println(re);
        out.flush(); 
        out.close();
	}
}
