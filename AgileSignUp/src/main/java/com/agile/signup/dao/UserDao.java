package com.agile.signup.dao;

import java.util.List;

import com.agile.signup.models.User;

public interface UserDao {
	public List<User> getAllUsers();
	public boolean addUser(User user);
	public User getUserById(int id);
	public List<User> getUsersByCourseId(int courseID);
	public boolean remove(int id);
}
