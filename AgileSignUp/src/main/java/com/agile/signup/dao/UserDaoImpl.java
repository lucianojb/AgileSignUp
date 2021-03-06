package com.agile.signup.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import org.hibernate.HibernateException;
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
		try{
			sessionFactory.getCurrentSession().merge(user);
			return true;
		}catch(HibernateException exc){
			return false;
		}
	}

	@Override
	public User getUserById(int id) {
		User user;
		try{
			user = this.sessionFactory.getCurrentSession()
					.createQuery("from User where userid = :useridentify", User.class)
					.setParameter("useridentify", id).getSingleResult();
		}catch(NoResultException nre){
			return null;
		}
		
		return user;
	}

	@Override
	public List<User> getUsersByCourseId(int courseID) {
		return this.sessionFactory.getCurrentSession()
				.createQuery("from User where courseid = :courseidentify order by lastname", User.class)
				.setParameter("courseidentify", courseID).getResultList();
	}

	@Override
	public boolean remove(int id) {
		sessionFactory.getCurrentSession().createQuery("DELETE from User where userid = :givenid")
		.setParameter("givenid", id).executeUpdate();
		
		return true;
	}

	@Override
	public List<User> getUsersByPreferredCourseId(int id) {
		return this.sessionFactory.getCurrentSession()
				.createQuery("from User where preferredcourse = :courseidentify order by lastname", User.class)
				.setParameter("courseidentify", id).getResultList();
	}

	@Override
	public List<User> getAllUsersOrderedByGivenCourseIdFirst(int id) {
		return this.sessionFactory.getCurrentSession()
				.createQuery("from User order by case when courseid = :courseidentify then 1 else 2 end", User.class)
				.setParameter("courseidentify", id).getResultList();
	}
}
