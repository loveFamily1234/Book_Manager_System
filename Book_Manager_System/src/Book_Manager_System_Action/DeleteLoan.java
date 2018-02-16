package Book_Manager_System_Action;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_control.Bookcontrol;
import Book_Manager_control.Loaning_Recordcontrol;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class DeleteLoan extends ActionSupport{
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
		// TODO 自动生成的方法存根
		ArrayList<String> list=new ArrayList<>();
		ArrayList<String> booklist=new ArrayList<>();
			System.out.println("出入的是"+row);
			JSONArray array=JSONArray.fromObject(row);
			for(int i=0;i<array.size();i++){
				JSONObject object=array.getJSONObject(i);
				list.add(object.getString("id"));
				booklist.add(object.getString("bookname"));
			}
			System.out.println("booklist"+booklist);
			result=Loaning_Recordcontrol.delete(list,booklist);
		return SUCCESS;
	}
}
