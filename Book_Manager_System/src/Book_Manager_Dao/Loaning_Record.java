package Book_Manager_Dao;

public class Loaning_Record {
	private int Loaning_record_id;
	private String book_id;
	private String id;
	private String borrow_date;
	private String return_date;
	public int getLoaning_record_id() {
		return Loaning_record_id;
	}
	public void setLoaning_record_id(int loaning_record_id) {
		Loaning_record_id = loaning_record_id;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBorrow_date() {
		return borrow_date;
	}
	public void setBorrow_date(String borrow_date) {
		this.borrow_date = borrow_date;
	}
	public String getReturn_date() {
		return return_date;
	}
	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}
	
}
