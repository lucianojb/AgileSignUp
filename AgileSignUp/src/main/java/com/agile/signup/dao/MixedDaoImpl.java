package com.agile.signup.dao;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.agile.signup.models.Course;
import com.agile.signup.models.User;

@Repository
@Transactional
public class MixedDaoImpl implements MixedDao{

	private static final Logger logger = LoggerFactory.getLogger(MixedDaoImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean saveUserAndCourse(User user, Course course) {
		logger.info("Adding {} and {} to database", user, course);
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.getTransaction();
		try{
			session.merge(user);
			session.merge(course);
			return true;
		}catch(HibernateException exc){
			tx.rollback();
			return false;
		}
	}
}