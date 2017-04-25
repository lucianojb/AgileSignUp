package com.agile.signup.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import com.agile.signup.models.Course;

public class CourseDaoImpl implements CourseDao{

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<Course> getAllCourses() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addCourse(Course course) {
		// TODO Auto-generated method stub
		return false;
	}
}
