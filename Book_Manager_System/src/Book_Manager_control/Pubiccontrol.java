package Book_Manager_control;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import Book_Manager_Dao.Loaning_Record;
import Book_Manager_Dao.Public;
import Book_Manager_Dao.Stock_Size;
import Book_Manager_Dao.User_loan;
import Method.Method;


public class Pubiccontrol {
	public static String addpublic(String public_name,String public_phone,String public_email){
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		Transaction transaction = session.beginTransaction();

		// 4. 执行保存操作
		 Public pub=new Public();
		 
		    pub.setPublic_name(public_name);
		    pub.setPublic_phone(public_phone);
		    pub.setPublic_email(public_email);
		 
			session.save(pub);
			// 5. 提交时务
			transaction.commit();

			// 6. 关闭 Session

			session.close();
			// 7. 关闭 SessionFactory 对象
			sessionFactory.close();
		return "success";
	}
	public static String deletepublic(ArrayList<String> list){
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		Transaction transaction = session.beginTransaction();
		for(int i=0;i<list.size();i++){
			Public pub=new Public();
			pub.setPublic_id(Integer.parseInt(list.get(i)));
			session.delete(pub);
		}
		transaction.commit();

		// 6. 关闭 Session

		session.close();
		// 7. 关闭 SessionFactory 对象
		sessionFactory.close();
		
		return "success";
	}
	public static String modify(Public pub){
	SessionFactory sessionFactory = null;

	sessionFactory = new Configuration().configure().buildSessionFactory();

	// 2. 创建一个 Session 对象
	Session session = sessionFactory.openSession();

	// 3. 开启事务
	Transaction transaction = session.beginTransaction();

	// 4. 执行更新操作


	    session.update(pub);
		// 5. 提交时务
		transaction.commit();

		// 6. 关闭 Session

		session.close();
		// 7. 关闭 SessionFactory 对象
		sessionFactory.close();
		return "success";
	}
	public static List<Public>  queryAll() {
		// TODO 自动生成的方法存根
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		Transaction transaction = session.beginTransaction();
		 
		Query query = session.createQuery( "from Public public");
		List<Public> list=query.list();
		transaction.commit();

		// 6. 关闭 Session
	//	System.out.println("提示"+list.size());
		session.close();
		// 7. 关闭 SessionFactory 对象
		sessionFactory.close();
	
		return list;
	}
}
