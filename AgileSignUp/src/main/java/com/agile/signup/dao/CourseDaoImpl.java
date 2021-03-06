package com.agile.signup.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.agile.signup.models.Course;

@Repository
@Transactional
public class CourseDaoImpl implements CourseDao{

	private static final Logger logger = LoggerFactory.getLogger(CourseDaoImpl.class);
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<Course> getAllCourses() {
        return this.sessionFactory.getCurrentSession().createQuery("from Course order by coursedate", Course.class).getResultList();

	}

	@Override
	public boolean addCourse(Course course) {
		logger.info("Adding {} to database", course.toString());
		
		try{
			sessionFactory.getCurrentSession().merge(course);
			return true;
		}catch(HibernateException exc){
			return false;
		}
	}

	@Override
	public List<Course> getAvailableCourses() {
		return this.sessionFactory.getCurrentSession()
				.createQuery("from Course where isavailable = :availability order by coursedate", Course.class)
				.setParameter("availability", true)
				.getResultList();
	}

	@Override
	public Course getCourseById(int id) {
		Course course;
		
		try{
		course = this.sessionFactory.getCurrentSession()
				.createQuery("from Course where courseid = :courseidentity", Course.class)
				.setParameter("courseidentity", id)
				.getSingleResult();
		}catch(NoResultException nre){
			return null;
		}
		
		return course;
	}
	
	@Override
	public List<Course> getCourseByDate(Date date) {
		return this.sessionFactory.getCurrentSession()
				.createQuery("from Course where coursedate = :date", Course.class)
				.setParameter("date", date)
				.getResultList();
	}

	@Override
	public boolean removeById(int id) {
		sessionFactory.getCurrentSession().createQuery("DELETE from Course where courseid = :givenid")
		.setParameter("givenid", id).executeUpdate();
		
		return true;
	}
}
