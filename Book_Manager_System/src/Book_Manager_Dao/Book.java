package Book_Manager_Dao;

public class Book {
	private String book_id;
	private String book_name;
	private String author;
	private double price;
	private String book_public;
	private String book_publicment;
	public String getBook_publicment() {
		return book_publicment;
	}
	public void setBook_publicment(String book_publicment) {
		this.book_publicment = book_publicment;
	}
	public String getBook_public() {
		return book_public;
	}
	public void setBook_public(String book_public) {
		this.book_public = book_public;
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
}
