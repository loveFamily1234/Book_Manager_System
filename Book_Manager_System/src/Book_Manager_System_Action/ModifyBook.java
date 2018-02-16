package Book_Manager_System_Action;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;

import Book_Manager_Dao.Book;
import Book_Manager_Dao.Stock_Size;
import Book_Manager_control.Bookcontrol;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class ModifyBook extends ActionSupport{
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
//		System.out.println(row+" "+field);
		JSONObject a=JSONObject.fromObject(row);
	    Book book=new Book();
	    Stock_Size stock=new Stock_Size();
	    
	//    System.out.println(a.get(temp));
		JSONObject b=a.getJSONObject("book");
		if(field.contains("book.")){
	//		System.out.println("sfds");
			String key=field.substring(field.indexOf(".")+1, field.length()-1);
	//		System.out.println(a.getString(field));
			String temp=field.substring(1, field.length()-1);
			b.element(key, a.getString(temp));
	//		System.out.println(b.getString("author"));
			book.setAuthor(b.getString("author"));
			book.setBook_id(b.getString("book_id"));
			book.setBook_name(b.getString("book_name"));
			book.setPrice(b.getDouble("price"));
			book.setBook_public(b.getString("book_public"));
			stock.setSize(Integer.parseInt(a.getString("size")));
		
			stock.setBook(book);
		}else{
			String temp=field.substring(1, field.length()-1);
			book.setAuthor(b.getString("author"));
			book.setBook_id(b.getString("book_id"));
			book.setBook_name(b.getString("book_name"));
			book.setPrice(b.getDouble("price"));
			book.setBook_public(b.getString("book_public"));
			stock.setSize(Integer.parseInt(a.getString(temp)));
			stock.setBook(book);
		}

//		System.out.println(stock.getSize()+" "+stock.getBook().getBook_id()+
//				" "+stock.getBook().getBook_name()+" "+stock.getBook().getBook_public()+" "+stock.getBook().getAuthor()+
//				" "+stock.getBook().getPrice()
//				);
		
		
		
		
		
		result=Bookcontrol.modify(stock);
		return SUCCESS;
	}
}
