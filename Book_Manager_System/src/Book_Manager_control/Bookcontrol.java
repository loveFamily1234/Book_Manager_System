package Book_Manager_control;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import Book_Manager_Dao.Book;
import Book_Manager_Dao.Stock_Size;
import Book_Manager_Dao.User;

public class Bookcontrol {
	public static List<Stock_Size> queryAll(){
		Stock_Size stock_size=new Stock_Size();
		
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		
		Session session = sessionFactory.openSession();

	
		Transaction transaction = session.beginTransaction();
		 
		Query q=session.createQuery("from Stock_Size stock_size");
		
		List<Stock_Size> list=q.list();
		
		transaction.commit();

		

		session.close();
		
		sessionFactory.close();
		
		return list;
	}
	
	public static String addBook(String book_id,String book_name,String author,String price,String book_public,String number, String book_publicment){
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

	
		Session session = sessionFactory.openSession();

		
		Transaction transaction = session.beginTransaction();

		
		    Book book=new Book();
		    book.setAuthor(author);
		    book.setBook_id(book_id);
		    book.setBook_name(book_name);
		    book.setPrice(Double.parseDouble(price));
		    book.setBook_public(book_public);
		    book.setBook_publicment(book_publicment);
		    Stock_Size stock=new Stock_Size();
		    stock.setBook(book);
		    stock.setSize(Integer.parseInt(number));
			session.save(stock);
			
			transaction.commit();

			

			session.close();
			
			sessionFactory.close();
			return "success";
	}
	public static String modify(Stock_Size stock){
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		
		Session session = sessionFactory.openSession();

	
		Transaction transaction = session.beginTransaction();

		

//		System.out.println(book.getAuthor()+" "+book.getBook_id()+" "+
//		book.getBook_name()+" "+book.getPrice()
//				);
		
		    Stock_Size temp=session.load(Stock_Size.class, stock.getBook().getBook_id());
		    temp.setBook(stock.getBook());
		    temp.setSize(stock.getSize());
		    session.clear();
		    session.update(temp);
			
			transaction.commit();

			

			session.close();
			
			sessionFactory.close();
			return "success";
	}
	public static String delete(ArrayList<String> list){
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		
		Session session = sessionFactory.openSession();

	//	System.out.println("列表的长度为"+list.size());
		
		
		 Transaction transaction = session.beginTransaction();
		  String hql = "";
	        for(int i=0;i<list.size();i++) {
	        	Stock_Size stock=session.load(Stock_Size.class, list.get(i));
	//        	System.out.println("加载    "+stock.getBook().getBook_name());
	        	session.delete(stock);
	        	
	        }   
	    //    Query q= session.createQuery("delete from Book where "+hql);
	     //   q.executeUpdate();
	        transaction.commit();
	        session.close();
			
			sessionFactory.close();
			return "success";
	}
	public static void main(String args[]){
//		ArrayList<Stock_Size> list=(ArrayList<Stock_Size>) queryAll();
//		for(int i=0;i<list.size();i++){
//			System.out.println(list.get(i).getBook().getBook_name());
//		}
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		Session session = sessionFactory.openSession();

		
		Transaction transaction = session.beginTransaction();

		
//		    Book book=new Book();
//		    book.setAuthor("1");
//		    book.setBook_id("001");
//		    book.setBook_name("1");
//		    book.setPrice(Double.parseDouble("3"));
//		    book.setBook_public("2016-3-4");
		    Stock_Size stock=new Stock_Size();
//		    stock.setBook(book);
//		    stock.setSize(3);
	//	    session.save(book);
//			session.save(stock);
			
		
	
		
		   stock=session.load(Stock_Size.class, "002");
//		   stock.getBook().setPrice(1000);
//		   session.save(stock);
		   session.delete(stock);
			transaction.commit();

			

			session.close();
			
			sessionFactory.close();
	}
	
	public static List<Stock_Size> querySimple(String bookName){
		Stock_Size stock_size=new Stock_Size();
		
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		Transaction transaction = session.beginTransaction();
		
		Query q=session.createQuery("from Stock_Size as stock_size where stock_size.book.book_name like :name or stock_size.book.author like :author"
				+ " or stock_size.book.book_publicment like :publicment");
		System.out.print(bookName);
		//q.setString(0, bookName);
		q.setString("name", "%" + bookName + "%");
		q.setString("author", "%" + bookName + "%");
		q.setString("publicment", "%" + bookName + "%");
		List<Stock_Size> list=q.list();
		
		transaction.commit();

		// 6. 关闭 Session

		session.close();
		// 7. 关闭 SessionFactory 对象
		sessionFactory.close();
		
		return list;
	}
	
	public static List<Stock_Size> queryHighLevel(String book_name,String book_author,String book_publish,String book_time_start,
			String book_time_end){
		book_time_start = book_time_start + "-1-1";
		book_time_end = book_time_end + "-12-31";
		System.out.println(book_time_start);
		java.sql.Date beginDate = java.sql.Date.valueOf(book_time_start);
		java.sql.Date endDate = java.sql.Date.valueOf(book_time_end);
		Stock_Size stock_size=new Stock_Size();
		
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		Transaction transaction = session.beginTransaction();
		
		Query q=session.createQuery("from Stock_Size as stock_size where stock_size.book.book_name like :name "
				+ "and stock_size.book.author like :author and stock_size.book.book_publicment like :publish "
				+ "and stock_size.book.book_public >=:beginDate and stock_size.book.book_public <=:endDate");
		//q.setString(0, bookName);
		System.out.println(book_name);
		q.setString("name", "%" + book_name + "%");
		q.setString("author", "%" + book_author + "%");
		q.setString("publish", "%" + book_publish + "%");
		q.setDate("beginDate", beginDate);
		q.setDate("endDate", endDate);
		List<Stock_Size> list=q.list();
		
		transaction.commit();

		// 6. 关闭 Session

		session.close();
		// 7. 关闭 SessionFactory 对象
		sessionFactory.close();
		
		return list;
	}
	
	public static List<Book> queryNull(String bookName){
		Book book = new Book();
		
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		Transaction transaction = session.beginTransaction();
		
		Query q=session.createQuery("from Book book where book.book_name=?");
		//q.setString(0, bookName);
		q.setString(0, "null");
		
		List<Book> list=q.list();
		
		transaction.commit();

		// 6. 关闭 Session

		session.close();
		// 7. 关闭 SessionFactory 对象
		sessionFactory.close();
		
		return list;
	}
}
