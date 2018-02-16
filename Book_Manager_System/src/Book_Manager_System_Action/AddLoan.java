package Book_Manager_System_Action;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_control.Loaning_Recordcontrol;

public class AddLoan extends ActionSupport{
	private String book_id;
	private String user_id;
	private String result;
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String execute() throws Exception {
		// TODO 自动生成的方法存根
		result=Loaning_Recordcontrol.addloan(book_id,user_id);
		return SUCCESS;
		//return super.execute();
	}
}
