package Book_Manager_control;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import Book_Manager_Dao.Book;
import Book_Manager_Dao.Loaning_Record;
import Book_Manager_Dao.Stock_Size;
import Book_Manager_Dao.User;
import Book_Manager_Dao.User_loan;
import Method.Method;

public class Loaning_Recordcontrol {
	public static ArrayList<User_loan> queryAll() {
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		Transaction transaction = session.beginTransaction();

		Query query = session.createQuery(
				"select user.name,book.book_name,loaning_record.return_date,loaning_record.Loaning_record_id "
						+ "from Book as book,User as user,Loaning_Record as loaning_record "
						+ "where loaning_record.id=user.id and loaning_record.book_id=book.book_id");
		List<Object> list = query.list();
		transaction.commit();

		// 6. 关闭 Session
		// System.out.println("提示"+list.size());
		session.close();
		// 7. 关闭 SessionFactory 对象
		sessionFactory.close();
		ArrayList<User_loan> userlist = new ArrayList<>();
		User_loan user_loan = null;
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateNowStr = sdf.format(d);
		// System.out.println(dateNowStr);
		for (int i = 0; i < list.size(); i++) {
			user_loan = new User_loan();
			Object[] object = (Object[]) list.get(i);// 每行记录不在是一个对象 而是一个数
			// System.out.println("tishi "+(int)object[3] );
			user_loan.setUsername((String) object[0]);
			user_loan.setBookname((String) object[1]);
			user_loan.setReturn_date((String) object[2]);
			user_loan.setId((int) object[3]);
			if (Method.compare_date(dateNowStr, (String) object[2]) == 1) {
				user_loan.setState("正常");
				user_loan.setMoney("0");
			} else {
				user_loan.setState("欠款");
				user_loan.setMoney(String.valueOf(Method.differentDays(dateNowStr, (String) object[2]) * 0.1));
			}
			userlist.add(user_loan);
		}
		return userlist;
	}

	public static String addloan(String book_id, String user_id) throws ParseException {
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		Transaction transaction = session.beginTransaction();

		User user = session.load(User.class, user_id);
		// System.out.println("添加记录查询"+user.getPosition());
		// 4. 执行保存操作
		Loaning_Record loan = new Loaning_Record();
		loan.setBook_id(book_id);
		loan.setId(user_id);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateNowStr = sdf.format(date);
		loan.setBorrow_date(dateNowStr);
		if (user.getPosition().equals("本科生")) {
			loan.setReturn_date(Method.addDate(dateNowStr, 30));
		} else if (user.getPosition().equals("研究生")) {
			loan.setReturn_date(Method.addDate(dateNowStr, 40));
		}
		// System.out.println("哈哈"+loan.getBook_id()+" "
		// +loan.getBorrow_date()+" "+
		// loan.getReturn_date()+" "+loan.getId());

		session.save(loan);

		Stock_Size stock = session.load(Stock_Size.class, book_id);

		stock.setSize(stock.getSize() - 1);

		session.update(stock);
		// 5. 提交时务
		transaction.commit();

		// 6. 关闭 Session

		session.close();
		// 7. 关闭 SessionFactory 对象
		sessionFactory.close();
		return "success";
	}

	public static String delete(ArrayList<String> list, ArrayList<String> booklist) {
		// TODO 自动生成的方法存根
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		Transaction transaction = session.beginTransaction();
		for (int i = 0; i < list.size(); i++) {
			System.out.println("循环中" + booklist.get(i));
			Query q = session.createQuery("from Book book where book_name=?");
			q.setString(0, booklist.get(i));
			List<Book> book = q.list();
			System.out.println("书号为" + book.get(i).getBook_id());

			Stock_Size stock = session.load(Stock_Size.class, book.get(0).getBook_id());

			System.out.println("霍村" + stock.getSize());
			stock.setSize(stock.getSize() + 1);

			session.update(stock);

			Loaning_Record loan = new Loaning_Record();

			loan.setLoaning_record_id(Integer.parseInt(list.get(i)));
			session.delete(loan);

			// 5. 提交时务
		}

		transaction.commit();

		// 6. 关闭 Session

		session.close();
		// 7. 关闭 SessionFactory 对象
		sessionFactory.close();

		return "success";
	}

	public static boolean isState(String user_id) {

		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		Transaction transaction = session.beginTransaction();

		Query q = session.createQuery("from Loaning_Record loaning_record where id=?");

		q.setString(0, user_id);

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateNowStr = sdf.format(date);

		List<Loaning_Record> list = q.list();
		boolean flag = true;
		for (int i = 0; i < list.size(); i++) {
			if (Method.compare_date(dateNowStr, list.get(i).getReturn_date()) == -1) {
				flag = false;
				break;
			}
		}

		transaction.commit();

		// 6. 关闭 Session

		session.close();
		// 7. 关闭 SessionFactory 对象
		sessionFactory.close();
		return flag;

	}

	public static int querynumber(String user_id) {
		// TODO 自动生成的方法存根
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		Transaction transaction = session.beginTransaction();

		Query query = session.createQuery("from Loaning_Record as loaning_record " + "where loaning_record.id=?");
		query.setString(0, user_id);
		List<Loaning_Record> list = query.list();
		transaction.commit();

		// 6. 关闭 Session
		// System.out.println("提示"+list.size());
		session.close();
		// 7. 关闭 SessionFactory 对象
		sessionFactory.close();

		return list.size();
	}

	public static int queryInfo(String user_id) {
		// TODO 自动生成的方法存根
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		Transaction transaction = session.beginTransaction();

		Query query = session.createQuery("from Loaning_Record as loaning_record " + "where loaning_record.id=?");
		query.setString(0, user_id);
		List<Loaning_Record> list = query.list();
		transaction.commit();

		// 6. 关闭 Session
		// System.out.println("提示"+list.size());
		session.close();
		// 7. 关闭 SessionFactory 对象
		sessionFactory.close();

		return list.size();
	}
}
