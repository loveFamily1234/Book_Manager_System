package Book_Manager_System_Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_control.Loaning_Recordcontrol;
import Method.Method;
import net.sf.json.JSONArray;

public class QueryState extends ActionSupport{
	private String user_id;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void querystate() throws IOException {
		String result = String.valueOf(Loaning_Recordcontrol.isState(user_id));
		HashMap<String, String> map = new HashMap<>();
		map.put("state", result);
		if (result.equals("true")) {

			int number = Loaning_Recordcontrol.querynumber(user_id);
		//	System.out.println("总共借了" + number);
			if (number >=2) {
				map.put("total", "false");
			} else {
				map.put("total", "true");
			}
		}
		JSONArray re = JSONArray.fromObject(map);
		ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		// System.out.println(re.toString());
		out.println(re);
		out.flush();
		out.close();
	}
}
