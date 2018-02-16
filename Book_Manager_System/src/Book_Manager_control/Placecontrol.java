package Book_Manager_control;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import Book_Manager_Dao.City;
import Book_Manager_Dao.Province;
import Book_Manager_Dao.Public;
import Book_Manager_Dao.Village;

public class Placecontrol {

	public static List<Province> queryProvince() {
		// TODO 自动生成的方法存根
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		Transaction transaction = session.beginTransaction();

		Query query = session.createQuery("from Province province");
		// Query query = session.createQuery( "from Province province where
		// province_name=?");
		// query.setString(0, "山东省");
		List<Province> list = query.list();
		transaction.commit();

		// 6. 关闭 Session
		// System.out.println("提示"+list.size());
		session.close();
		// 7. 关闭 SessionFactory 对象
		sessionFactory.close();

		return list;

	}

	public static List<City> queryCity(String parentiD) {
		// TODO 自动生成的方法存根
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		Transaction transaction = session.beginTransaction();
		System.out.println("传递的是" + parentiD);
		Query query = session.createQuery("from Province province where province_name=?");
		query.setString(0, parentiD);
		List<Province> pro = (List<Province>) query.list();

		System.out.println("对应的编号" + pro.get(0).getProvince_id());
		query = session.createQuery("from City city where city.parent_id=?");
		query.setString(0, pro.get(0).getProvince_id());
		List<City> list = query.list();
		transaction.commit();

		// 6. 关闭 Session
		// System.out.println("提示"+list.size());
		session.close();
		// 7. 关闭 SessionFactory 对象
		sessionFactory.close();

		return list;
	}

	public static List<Village> queryVillage(String parentiD) {
		// TODO 自动生成的方法存根
		SessionFactory sessionFactory = null;

		sessionFactory = new Configuration().configure().buildSessionFactory();

		// 2. 创建一个 Session 对象
		Session session = sessionFactory.openSession();

		// 3. 开启事务
		Transaction transaction = session.beginTransaction();
		System.out.println("传递的是" + parentiD);
		Query query = session.createQuery("from City city where city_name=?");
		query.setString(0, parentiD);
		List<City> pro = (List<City>) query.list();

		System.out.println("对应的编号" + pro.get(0).getCity_id());
		query = session.createQuery("from Village village where village.parent_id=?");
		query.setString(0, pro.get(0).getCity_id());
		List<Village> list = query.list();
		transaction.commit();

		// 6. 关闭 Session
		// System.out.println("提示"+list.size());
		session.close();
		// 7. 关闭 SessionFactory 对象
		sessionFactory.close();

		return list;
	}

}
