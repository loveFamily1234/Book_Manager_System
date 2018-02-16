package Book_Manager_System_Action;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_Dao.Public;
import Book_Manager_control.Pubiccontrol;
import net.sf.json.JSONObject;

public class ModifyPublic extends ActionSupport{
	private String field;
	private String row;
	private String result;
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
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
	//	System.out.println("修改public"+field+" row"+row);
		JSONObject a=JSONObject.fromObject(row);
		Public pub=new Public();
		pub.setPublic_id(Integer.parseInt(a.getString("public_id")));
		pub.setPublic_name(a.getString("public_name"));
		pub.setPublic_email(a.getString("public_email"));
		pub.setPublic_phone(a.getString("public_phone"));
//		System.out.println(pub.getPublic_id()+" "+
//		pub.getPublic_name()+" "+pub.getPublic_phone()+" "+
//				pub.getPublic_email()
//				);
		result=Pubiccontrol.modify(pub);
		return SUCCESS;
	}
}
