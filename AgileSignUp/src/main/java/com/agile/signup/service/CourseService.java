package com.agile.signup.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.agile.signup.dao.CourseDao;
import com.agile.signup.dao.MixedDao;
import com.agile.signup.models.Course;
import com.agile.signup.models.User;

@Service
public class CourseService {

	@Autowired
	CourseDao courseDao;
	
	@Autowired
	MixedDao mixedDao;
	
	private static final int MAX_NUMBER_ATTENDEES = 28;
	
	public int getMaxNumberAttendees(){
		return MAX_NUMBER_ATTENDEES;
	}
	
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
	
	
	public boolean addAttendeeToCourse(Course course, User user) {
		course.setNumberAttendees(course.getNumberAttendees() + 1);
		if(course.getNumberAttendees() == MAX_NUMBER_ATTENDEES){
			course.setAvailable(false);
		}
		
		user.setCourseID(course.getCourseID());
		return mixedDao.saveUserAndCourse(user, course);
	}

	public boolean removeAttendeeFromCourse(Course course, User user) {
		course.setNumberAttendees(course.getNumberAttendees() - 1);
		course.setAvailable(true);
		
		user.setCourseID(null);
		return mixedDao.saveUserAndCourse(user, course);
	}
}
