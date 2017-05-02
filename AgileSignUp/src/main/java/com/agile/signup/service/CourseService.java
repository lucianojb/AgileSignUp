package com.agile.signup.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.agile.signup.dao.CourseDao;
import com.agile.signup.models.Course;

@Service
public class CourseService {

	@Autowired
	CourseDao courseDao;
	
	public List<Course> getListOfCourses(){
		return courseDao.getAllCourses();		
	}
	
	public boolean createNewCourse(Date date){
		Course course = new Course(date);
		return courseDao.addCourse(course);
	}
	
	public boolean updateCourse(Course course){
		return courseDao.addCourse(course);
	}

	public List<Course> getListOfAvailableCourses() {
		return courseDao.getAvailableCourses();
	}

	public Course getCourseById(int id) {
		return courseDao.getCourseById(id);
	}
	
	public List<Course> getCoursesByDate(Date date){
		return courseDao.getCourseByDate(date);
	}

	public boolean removeCourseById(int id) {
		return courseDao.removeById(id);
	}
	
}
