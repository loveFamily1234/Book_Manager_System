package Book_Manager_control;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import Book_Manager_Dao.Stock_Size;
import Book_Manager_Dao.User;


public class Usercontrol {
	public static String addUser(String id, String name, String classmate, String sex, int age, String address, String phone,String password, String position) {
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		Transaction transaction = session.beginTransaction();

		// 4. 执行保存操作
			User people = new User();
			people.setId(id);
			people.setAddress(address);
			people.setAge(age);
			people.setClassmate(classmate);
			people.setName(name);
			people.setPhone(phone);
			people.setSex(sex);
			people.setPassword(password);
			people.setPosition(position);
			session.save(people);
			// 5. 提交时务
			transaction.commit();

			// 6. 关闭 Session

			session.close();
			// 7. 关闭 SessionFactory 对象
			sessionFactory.close();
			return "success";
	}
	   public static User isIN(String id){
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		 Transaction transaction = session.beginTransaction();
		 User u=(User)session.get(User.class, id);
		transaction.commit();

			// 6. 关闭 Session

		session.close();
			// 7. 关闭 SessionFactory 对象
		sessionFactory.close();
		return u;
	}
	   
	   public static List<User> queryAll(){
			Stock_Size stock_size=new Stock_Size();
			
			SessionFactory sessionFactory = null;

			sessionFactory = new Configuration().configure().buildSessionFactory();

			// 2. 创建一个 Session 对象
			Session session = sessionFactory.openSession();

			// 3. 开启事务
			Transaction transaction = session.beginTransaction();
			 
			Query q=session.createQuery("from User user where position=? or position=?");
			q.setString(0, "本科生");
			q.setString(1, "研究生");
			List<User> list=q.list();
			
			transaction.commit();

			// 6. 关闭 Session

			session.close();
			// 7. 关闭 SessionFactory 对象
			sessionFactory.close();
			
			return list;
		}
}
