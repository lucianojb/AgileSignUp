package com.agile.signup.dao;

import com.agile.signup.models.Course;
import com.agile.signup.models.User;

public interface MixedDao {
	public boolean saveUserAndCourse(User user, Course course);
}
