package com.agile.signup.web;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.agile.signup.models.Course;
import com.agile.signup.models.Division;
import com.agile.signup.models.User;
import com.agile.signup.service.CourseService;
import com.agile.signup.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	CourseService courseService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String users(Locale locale, Model model) {
		logger.info("Looking at the users!");
		
		List<User> users = userService.getAllUsers();
		model.addAttribute("userData", users);
				
		return "users";
	}
	
	@RequestMapping(value = "/edituser/{id}", method = RequestMethod.GET)
	public String editUserGet(@PathVariable("id") int id, Model model) {
		logger.info("Editing User {} GET", id);
		
		User user = userService.getUserById(id);
		model.addAttribute("user", user);
		
		return "edituser";
	}
	
	@RequestMapping(value = "/selectcourse/{id}", method = RequestMethod.GET)
	public String selectCourse(@PathVariable("id") int id, Model model) {
		
		User user = userService.getUserById(id);
		
		model.addAttribute("user", user);	
		
		List<Course> availableCourses = courseService.getListOfAvailableCourses();
		
		model.addAttribute("coursesList", availableCourses);
		
		return "selectcourse";
	}
	
	@RequestMapping(value = "/selectcourse/{id}", method = RequestMethod.POST)
	public String selectCoursePost(@PathVariable("id")int id, @RequestParam("course")String courseID, Model model){
		if(courseID != null){
			logger.info("Selected course with course id {}.", courseID);
		}
		
		
		return "users";
	}
}
