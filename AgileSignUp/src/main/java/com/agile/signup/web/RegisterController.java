package com.agile.signup.web;
import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String createUserGet(Model model, User user) {
		logger.info("Creating a new user GET");
		
		List<Division> divisionList = Arrays.asList(Division.values());
		
		model.addAttribute("divisions", divisionList);
		
		List<Course> courseList = courseService.getListOfCourses();
		
		model.addAttribute("coursesList", courseList);
		
		return "createuser";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String createUser(Model model, @Valid User user, BindingResult bindingResult, RedirectAttributes redirectAttributes,
			@RequestParam("submit")String submit){
		logger.info("Create a new user POST");
		
		if(bindingResult.hasErrors()){
	        redirectAttributes.addFlashAttribute("errors", bindingResult);
			redirectAttributes.addFlashAttribute("user", user);
			
			List<Division> divisionList = Arrays.asList(Division.values());
			
			model.addAttribute("divisions", divisionList);
			
			List<Course> courseList = courseService.getListOfCourses();
			
			model.addAttribute("coursesList", courseList);
			
			return "createuser";
		}
		
		if(submit.equals("cancel")){
			logger.info("Cancelling request to create user");
			
			return "redirect:./";
		}
		
		if(user.getPreferredCourseID() != -1){
			Course course = courseService.getCourseById(user.getPreferredCourseID());
			if(course.isAvailable()){
				courseService.addAttendeeToCourse(course, user);
			}
		}else{
			userService.createOrUpdateUser(user);
		}
		
		return "redirect:./registersuccess";
	}	
	
	@RequestMapping(value = "/registersuccess", method = RequestMethod.GET)
	public String registersuccess(Model model) {
		return "registersuccess";
	}
	
}