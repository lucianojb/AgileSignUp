package com.agile.signup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.agile.signup.dao.UserDao;
import com.agile.signup.models.User;

public class UserService {

	@Autowired
	UserDao userDao;
	
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	public User getUserById(int id) {
		return userDao.getUserById(id);
	}

	public void createOrUpdateUser(User user) {
		userDao.addUser(user);
	}

	public List<User> getUsersByCourseId(int courseID) {
		return userDao.getUsersByCourseId(courseID);
	}

	public boolean removeUserById(int id) {
		return userDao.remove(id);
	}

	public List<User> getUsersByPreferredCourseId(int id) {
		return userDao.getUsersByPreferredCourseId(id);
	}

	public List<User> getAllUsersOrderedByGivenCourseIdFirst(int id) {
		return userDao.getAllUsersOrderedByGivenCourseIdFirst(id);
	}
}
