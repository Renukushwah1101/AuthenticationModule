package org.renu.hibernate.DAO;

import org.renu.hibernate.entity.Files;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class FileDAO {
	SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Files.class)
			.buildSessionFactory();

	public void addFileDetails(Files file) {
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		session.save(file);
		session.getTransaction().commit();
		System.out.println(file.getEmail() + " Got added");
	}

	public List<Files> resultout(String email1) {
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		Query query = session.createQuery("from user where email= :email1");
		// session.getTransaction().commit();
		query.setParameter("email1", email1);
		List<Files> files = query.list();

		return files;
	}

	public void updatePasswordThroughNo(String phone, String password) {
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		Query query = session.createQuery("update user set password=:password1 where mobile_no =:phone1");
		query.setParameter("password1", password);
		query.setParameter("phone1", phone);
		int status = query.executeUpdate();
		session.getTransaction().commit();
		System.out.println(status + "Got updated Password");

	}

	public void updatePasswordThroughMail(String email, String password) {
		System.out.println("In file Dao");
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		Query query = session.createQuery("update user set password=:password1 where email =:email");
		query.setParameter("password1", password);
		query.setParameter("email", email);
		int status = query.executeUpdate();
		session.getTransaction().commit();
		System.out.println(status + "Got updated Password");
	}
}
