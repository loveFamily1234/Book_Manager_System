package Book_Manager_System_Action;

import org.eclipse.jdt.internal.compiler.lookup.ReductionResult;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_control.Pubiccontrol;

public class AddPublic extends ActionSupport{
	private String public_name;
	private String public_phone;
	private String public_email;
	private String result;
	
	
	public String getResult() {
		return result;
	}



	public void setResult(String result) {
		this.result = result;
	}



	public String getPublic_name() {
		return public_name;
	}



	public void setPublic_name(String public_name) {
		this.public_name = public_name;
	}



	public String getPublic_phone() {
		return public_phone;
	}



	public void setPublic_phone(String public_phone) {
		this.public_phone = public_phone;
	}



	public String getPublic_email() {
		return public_email;
	}



	public void setPublic_email(String public_email) {
		this.public_email = public_email;
	}



	@Override
	public String execute() throws Exception {
		// TODO 自动生成的方法存根
	//	System.out.println(public_name+" "+public_phone+" "+public_email);
		result=Pubiccontrol.addpublic(public_name, public_phone, public_email);
		return SUCCESS;
	}
}
