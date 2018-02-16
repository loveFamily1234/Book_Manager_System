package Book_Manager_System_Action;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_control.Bookcontrol;
import Book_Manager_control.Usercontrol;

public class AddBook extends ActionSupport{
	private String book_id;
	private String book_name;
	private String author;
	private String price;
	private String result;
	private String book_public;
	private String number;
	private String book_publicment;
	public String getBook_publicment() {
		return book_publicment;
	}
	public void setBook_publicment(String book_publicment) {
		this.book_publicment = book_publicment;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getBook_public() {
		return book_public;
	}
	public void setBook_public(String book_public) {
		this.book_public = book_public;
	}
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
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String execute() throws Exception {
		// TODO 自动生成的方法存根
//		System.out.println(id+" "+userName+" "+classmate+" "+sex+" "+Integer.parseInt(age)+" "+address+" "+Integer.parseInt(phone)+" "+password);
//		System.out.println(number);
		result=Bookcontrol.addBook(book_id, book_name, author, price,book_public,number,book_publicment);
        return SUCCESS; // 或return null  
	}
}
