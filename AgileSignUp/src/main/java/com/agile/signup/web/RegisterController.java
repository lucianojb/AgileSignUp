package com.agile.signup.web;

import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.agile.signup.models.Course;
import com.agile.signup.models.Division;
import com.agile.signup.models.User;
import com.agile.signup.service.CourseService;
import com.agile.signup.service.UserService;

@Controller
public class RegisterController {

	@Autowired
	UserService userService;
	
	@Autowired
	CourseService courseService;
		
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String createUserGet(Model model) {
		logger.info("Creating a new user GET");
		
		List<Division> divisionList = Arrays.asList(Division.values());
		
		model.addAttribute("divisions", divisionList);
		
		List<Course> courseList = courseService.getListOfCourses();
		
		model.addAttribute("coursesList", courseList);
		
		return "createuser";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public RedirectView createUser(Model model, @RequestParam("submit") String submit, @RequestParam("firstName") String fname,
			@RequestParam("lastName") String lname, @RequestParam("email") String email, @RequestParam("fed") String employeeType,
			@RequestParam("mySelect") String division, @RequestParam("course") Integer preferredCourseID) {
		logger.info("Create a new user POST");
		
		if(submit.equals("cancel")){
			logger.info("Cancelling request to create user");
			
			return "redirect:./";
		}
		
		User user = createUserFromStrings(fname, lname, email, employeeType, division);
		user.setPreferredCourseID(preferredCourseID);
		
		userService.createOrUpdateUser(user);
		
		return "redirect:./";
	}
	
	
	private User createUserFromStrings(String fname, String lname, String email, String employeeType, String division) {
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
	
}
