package Book_Manager_System_Action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_Dao.User;
import Book_Manager_control.Usercontrol;

public class Confirm_login extends ActionSupport{

	private String username;
	private String password;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String execute() throws Exception {
		// TODO 自动生成的方法存根
		if (username.equals("") || password.equals("")) {
			return this.ERROR;
		} else {
			User user = Usercontrol.isIN(username);
			if (user == null) {
				return this.ERROR;
			} else if (user.getPassword().equals(password) &&(user.getPosition().equals("本科生")||user.getPosition().equals("研究生"))) {
				ServletActionContext.getRequest().getSession().setAttribute("username", user.getName());
				ServletActionContext.getRequest().getSession().setAttribute("id", user.getId());
				ServletActionContext.getRequest().getSession().setAttribute("classmate", user.getClassmate());
				ServletActionContext.getRequest().getSession().setAttribute("sex", user.getSex());
				ServletActionContext.getRequest().getSession().setAttribute("age", user.getAge());
				ServletActionContext.getRequest().getSession().setAttribute("address", user.getAddress());
				ServletActionContext.getRequest().getSession().setAttribute("phone", user.getPhone());
				ServletActionContext.getRequest().getSession().setAttribute("position", user.getPosition());
				return "Student";
			}else if(user.getPassword().equals(password) &&user.getPosition().equals("老师")) {
				//System.out.println("查询结果");
				ServletActionContext.getRequest().getSession().setAttribute("username", user.getName());
				return "Teacher";
			}
			else {
				return this.ERROR;
			}
		}

	}
}
