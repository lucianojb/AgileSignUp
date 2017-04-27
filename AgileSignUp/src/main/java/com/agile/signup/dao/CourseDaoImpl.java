package com.agile.signup.dao;

import java.util.List;

import javax.transaction.Transactional;

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
        return this.sessionFactory.getCurrentSession().createQuery("from Course", Course.class).getResultList();

	}

	@Override
	public boolean addCourse(Course course) {
		logger.info("Adding {} to database", course.toString());
		
		sessionFactory.getCurrentSession().saveOrUpdate(course);
		
		return true;
	}

	@Override
	public List<Course> getAvailableCourses() {
		return this.sessionFactory.getCurrentSession()
				.createQuery("from Course where isavailable = :availability", Course.class)
				.setParameter("availability", true)
				.getResultList();
	}

	@Override
	public Course getCourseById(int id) {
		return this.sessionFactory.getCurrentSession()
				.createQuery("from Course where courseid = :courseidentity", Course.class)
				.setParameter("courseidentity", id)
				.getSingleResult();
	}
}
