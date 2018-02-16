package Book_Manager_System_Action;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_Dao.MailSenderInfo;
import Method.SimpleMailSender;

public class SendTestAction extends ActionSupport{
	private String receive_people;
	private String subject;
	private String area;
	private String result;
	
	

	public String getResult() {
		return result;
	}



	public void setResult(String result) {
		this.result = result;
	}



	public String getReceive_people() {
		return receive_people;
	}



	public void setReceive_people(String receive_people) {
		this.receive_people = receive_people;
	}



	public String getSubject() {
		return subject;
	}



	public void setSubject(String subject) {
		this.subject = subject;
	}



	public String getArea() {
		return area;
	}



	public void setArea(String area) {
		this.area = area;
	}



	@Override
	public String execute() throws Exception {
		// TODO 自动生成的方法存根
		
		MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.163.com");
        mailInfo.setMailServerPort("25");
        mailInfo.setValidate(true);
        mailInfo.setFromAddress("m18852854251@163.com");//自己邮箱
        mailInfo.setToAddress(receive_people);//目标邮箱
        mailInfo.setUserName("m18852854251@163.com");//自己邮箱
        //需要开启此邮箱的POP3/SMTP/IMAP服务，具体设置进入邮箱以后在“设置”里进行开启
        mailInfo.setPassword("swf203232");//自己邮箱密码
        //System.out.println("password="+password);
        mailInfo.setSubject(subject);
        mailInfo.setContent(area);

        boolean isSend = SimpleMailSender.sendTextMail(mailInfo);

        /*HttpServletResponse response;
        PrintWriter out = response.getWriter();*/

        if(isSend){
          result="success";
          return SUCCESS; 

        }else{
        	result="error";
        	return ERROR;
        }
		
		
	}
}
