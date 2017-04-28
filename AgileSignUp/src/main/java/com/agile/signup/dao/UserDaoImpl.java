package com.agile.signup.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.agile.signup.models.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao{

	private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<User> getAllUsers() {
		return this.sessionFactory.getCurrentSession().createQuery("from User order by lastname", User.class).getResultList();

	}

	@Override
	public boolean addUser(User user) {
		logger.info("Adding {} to database", user.toString());

		sessionFactory.getCurrentSession().saveOrUpdate(user);

		return true;
	}

	@Override
	public User getUserById(int id) {
		return this.sessionFactory.getCurrentSession()
		.createQuery("from User where userid = :useridentify", User.class)
		.setParameter("useridentify", id).getSingleResult();
	}

	@Override
	public List<User> getUsersByCourseId(int courseID) {
		return this.sessionFactory.getCurrentSession()
				.createQuery("from User where courseid = :courseidentify order by lastname", User.class)
				.setParameter("courseidentify", courseID).getResultList();
	}
}
