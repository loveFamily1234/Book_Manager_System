package Book_Manager_System_Action;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_control.Pubiccontrol;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class DeletePublic extends ActionSupport{
	private String row;
	private String result;
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getRow() {
		return row;
	}

	public void setRow(String row) {
		this.row = row;
	}
	@Override
	public String execute() throws Exception {
		ArrayList<String> list=new ArrayList<>();
		JSONArray array=JSONArray.fromObject(row);
			for(int i=0;i<array.size();i++){
				JSONObject object=array.getJSONObject(i);
				list.add(object.getString("public_id"));
			}
		result=Pubiccontrol.deletepublic(list);
		
		return SUCCESS;
	}
	
}
