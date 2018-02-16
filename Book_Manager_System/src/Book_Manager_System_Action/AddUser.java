package Book_Manager_System_Action;

import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_control.Usercontrol;

public class AddUser extends ActionSupport{
    private String userName;
	private String password;
    private String address; 
    private String id;
	private String age;
	private String classmate;
	private String phone;
	private String sex;
	private String position;
    public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getClassmate() {
		return classmate;
	}
	public void setClassmate(String classmate) {
		this.classmate = classmate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}

	private String result;
    public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setAddress(String address) {
		this.address = address;
	}
    public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	@Override
	public String execute() throws Exception {
		// TODO 自动生成的方法存根
//		System.out.println(id+" "+userName+" "+classmate+" "+sex+" "+Integer.parseInt(age)+" "+address+" "+Integer.parseInt(phone)+" "+password);
		result=Usercontrol.addUser(id, userName, classmate, sex, Integer.parseInt(age), address, phone, password,position);
        return SUCCESS; // 或return null  
		
	}
	public String getUserName() {
		return userName;
	}

	public String getPassword() {
		return password;
	}

	public String getAddress() {
		return address;
	}

}
