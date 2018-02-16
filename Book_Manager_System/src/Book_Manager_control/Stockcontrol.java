package Book_Manager_control;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import Book_Manager_Dao.Stock_Size;

public class Stockcontrol {
	public static int quertsome(String book_id){
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		 Transaction transaction = session.beginTransaction();
		 Stock_Size u=(Stock_Size)session.get(Stock_Size.class, book_id);
		 transaction.commit();

			// 6. 关闭 Session

		session.close();
			// 7. 关闭 SessionFactory 对象
		sessionFactory.close();
		return u.getSize();
	}
}
