package com.agile.signup.dao;

import java.util.Date;
import java.util.List;

import com.agile.signup.models.Course;

public interface CourseDao {
	public List<Course> getAllCourses();
	public boolean addCourse(Course course);
	public List<Course> getAvailableCourses();
	public Course getCourseById(int id);
	public List<Course> getCourseByDate(Date date);
	public boolean removeById(int id);
}
