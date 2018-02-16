package com;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {  
    private String name;
    private String password;
  
    public String execute() throws Exception {  
  
        if (getName().equals("admin")&&getPassword().equals("123456")) {  
             System.out.println("Action excute!!!");  
            return SUCCESS; // why???  
        } else {  
            return ERROR;  
        }  
     }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}  
    
}