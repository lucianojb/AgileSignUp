package com.agile.signup.web;

import java.util.Arrays;
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
	
	private static final int MAX_NUMBER_ATTENDEES = 28;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String users(Model model) {
		logger.info("Looking at the users!");
		
		List<User> users = userService.getAllUsers();
		model.addAttribute("userData", users);
						
		return "users";
	}
	
	@RequestMapping(value = "/edituser/{id}", method = RequestMethod.GET)
	public String editUserGet(@PathVariable("id") int id, Model model) {
		logger.info("Editing User {} GET", id);
		
		User user = userService.getUserById(id);
		if(user == null){
			return "error";
		}
		
		model.addAttribute("user", user);
		
		return "edituser";
	}
	
	@RequestMapping(value = "/createuser", method = RequestMethod.GET)
	public String createUserGet(Model model) {
		logger.info("Creating a new user GET");
		
		List<Division> divisionList = Arrays.asList(Division.values());
		
		model.addAttribute("divisions", divisionList);
		
		
		return "createuser";
	}
	
	@RequestMapping(value = "/createuser", method = RequestMethod.POST)
	public String createUser(Model model, @RequestParam("submit") String submit, @RequestParam("firstName") String fname,
			@RequestParam("lastName") String lname, @RequestParam("email") String email, @RequestParam("myRadio") String employeeType,
			@RequestParam("mySelect") String division) {
		logger.info("Create a new user POST");
		
		if(submit.equals("cancel")){
			logger.info("Cancelling request to create user");
			
			return this.users(model);
		}
		
		User user = createOrUpdateUser(fname, lname, email, employeeType, division);
		
		userService.createOrUpdateUser(user);
		
		return this.users(model);
	}
	
	private User createOrUpdateUser(String fname, String lname, String email, String employeeType, String division) {
		User user = new User();
		user.setFirstName(fname);
		user.setLastName(lname);
		user.setEmail(email);
		if(employeeType.equals("federal")){
			user.setFederal(true);
		}else{
			user.setFederal(false);
		}
		user.setDivision(Division.valueOf(division));
		
		return user;
	}

	@RequestMapping(value = "/selectcourse/{id}", method = RequestMethod.GET)
	public String selectCourse(@PathVariable("id") int id, Model model) {
		
		User user = userService.getUserById(id);
		if(user.getCourseID() != null){
			//set this as selected in the views
			model.addAttribute("memberOfCourse", user.getCourseID());
		}
		
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
		
		Course course;
		User user = userService.getUserById(id);
		if(user.getCourseID() != null){
			course = courseService.getCourseById(user.getCourseID());
			removeAttendeeFromCourse(course);
		}
		user.setCourseID(Integer.parseInt(courseID));
		userService.createOrUpdateUser(user);
		
		course = courseService.getCourseById(Integer.parseInt(courseID));
		addAttendeeToCourse(course);
		
		return users(model);
	}

	private void addAttendeeToCourse(Course course) {
		course.setNumberAttendees(course.getNumberAttendees() + 1);
		if(course.getNumberAttendees() == MAX_NUMBER_ATTENDEES){
			course.setAvailable(false);
		}
		courseService.updateCourse(course);		
	}

	private void removeAttendeeFromCourse(Course course) {
		course.setNumberAttendees(course.getNumberAttendees() - 1);
		course.setAvailable(true);
		courseService.updateCourse(course);		
	}
}
