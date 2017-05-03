package com.agile.signup.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.agile.signup.dao.CourseDao;
import com.agile.signup.models.Course;
import com.agile.signup.models.User;

@Service
public class CourseService {

	@Autowired
	CourseDao courseDao;
	
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
	
	
	public void addAttendeeToCourse(Course course, User user, UserService userService) {
		course.setNumberAttendees(course.getNumberAttendees() + 1);
		if(course.getNumberAttendees() == MAX_NUMBER_ATTENDEES){
			course.setAvailable(false);
		}
		this.updateCourse(course);
		
		user.setCourseID(course.getCourseID());
		userService.createOrUpdateUser(user);
	}

	public void removeAttendeeFromCourse(Course course, User user, UserService userService) {
		course.setNumberAttendees(course.getNumberAttendees() - 1);
		course.setAvailable(true);
		this.updateCourse(course);		
		
		user.setCourseID(null);
		userService.createOrUpdateUser(user);
	}
}
