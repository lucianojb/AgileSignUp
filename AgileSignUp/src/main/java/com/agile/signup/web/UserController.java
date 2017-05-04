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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

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
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String users(Model model) {
		logger.info("Looking at the users!");
		
		List<User> users = userService.getAllUsers();
		model.addAttribute("userData", users);
						
		return "users";
	}
	
	@RequestMapping(value = "/deleteuser/{id}", method = RequestMethod.GET)
	public String deleteUserGet(Model model, @PathVariable("id") int id) {
		logger.info("Getting page to delete user {}", id);
		
		User user = userService.getUserById(id);
		if(user == null){
			model.addAttribute("errorMessage", "Could not find user to delete");
			return "error";
		}
		
		model.addAttribute("user", user);
						
		return "deleteuser";
	}
	
	@RequestMapping(value = "/deleteuser/{id}", method = RequestMethod.POST)
	public String deleteUser(Model model,  @PathVariable("id") int id, @RequestParam(name="submit", required=true)String submit) {
		logger.info("Deleting user {}!", id);
		
		if(submit.equals("delete")){
			//get user
			User user = userService.getUserById(id);
			if(user == null){
				model.addAttribute("errorMessage", "Could not find user to delete");
				return "redirect:../error";
			}
			//remove from course if courseID != null
			if(user.getCourseID() != null){
				Course course = courseService.getCourseById(user.getCourseID());
				if(course != null){
					logger.info("Removing user {} from course {}", user, course);
					courseService.removeAttendeeFromCourse(course, user);
				}
			}
			//remove user	
			userService.removeUserById(id);
		}
		
						
		return "redirect:../users";
	}
	
	@RequestMapping(value = "/edituser/{id}", method = RequestMethod.GET)
	public String editUserGet(@PathVariable("id") int id, Model model, User user) {
		user = userService.getUserById(id);
		logger.info("Editing User {} is {} GET", id, user);
		if(user == null){
			model.addAttribute("errorMessage", "Could not find user to edit");
			return "error";
		}
		
		List<Division> divisionList = Arrays.asList(Division.values());
		
		model.addAttribute("divisions", divisionList);
		
		model.addAttribute("user", user);
		
		return "edituser";
	}
	
	@RequestMapping(value = "/edituser/{id}", method = RequestMethod.POST)
	public String editUserPost(@PathVariable("id") int id, Model model, @Valid User user, 
			BindingResult bindingResult, RedirectAttributes redirectAttributes, @RequestParam("submit")String submit){
		logger.info("Editing User {} is {} POST", id, user);
		
		if(bindingResult.hasErrors()){
	        redirectAttributes.addFlashAttribute("errors", bindingResult);
			redirectAttributes.addFlashAttribute("user", user);
			
			List<Division> divisionList = Arrays.asList(Division.values());
			
			model.addAttribute("divisions", divisionList);
			
			return "edituser";
		}
		
		if(submit.equals("cancel")){
			return "redirect:../users";
		}
		
		user.setUserID(id);
		userService.createOrUpdateUser(user);
		
		RedirectView rview = new RedirectView();
		rview.setUrl("../users");
		return "redirect:../users";
	}
	
	@RequestMapping(value = "/selectcourse/{id}", method = RequestMethod.GET)
	public String selectCourse(@PathVariable("id") int id, Model model) {
		
		User user = userService.getUserById(id);
		
		if(user == null){
			model.addAttribute("errorMessage", "Could not find user to select course");
			return "error";
		}
		
		if(user.getCourseID() != null){
			model.addAttribute("memberOfCourse", user.getCourseID());
			model.addAttribute("enrolledCourseDate", courseService.getCourseById(user.getCourseID()).getCourseDate());
		}
		
		model.addAttribute("user", user);	
		
		if(user.getPreferredCourseID() != null && user.getPreferredCourseID() >= 0){
			Course preferredCourse = courseService.getCourseById(user.getPreferredCourseID());
			model.addAttribute("preferredCourse", preferredCourse);
		}
		
		List<Course> availableCourses = courseService.getListOfAvailableCourses();
		
		model.addAttribute("coursesList", availableCourses);
		
		return "selectcourse";
	}
	
	@RequestMapping(value = "/selectcourse/{id}", method = RequestMethod.POST)
	public String selectCoursePost(@PathVariable("id")int id,@RequestParam("submit") String submit, 
			@RequestParam(value = "course", required = false)Integer courseID, Model model, RedirectAttributes redirectAttributes){
		if(courseID != null){
			logger.info("Selected course with course id {}.", courseID);
		}
		
		User user = userService.getUserById(id);
		Course course;
		
		
		if(submit.equals("cancel")){
			return "redirect:../users";
		}
		if(submit.equals("remove")){
			if(user.getCourseID() != null){
				course = courseService.getCourseById(user.getCourseID());
				courseService.removeAttendeeFromCourse(course, user);
			}
			
			return "redirect:../users";
		}
		
		if(user.getCourseID() != null){
			course = courseService.getCourseById(user.getCourseID());
			courseService.removeAttendeeFromCourse(course, user);
		}
		
		course = courseService.getCourseById(courseID);
		if(course.getNumberAttendees() == courseService.getMaxNumberAttendees()){
			redirectAttributes.addFlashAttribute("errorMessage", "Could not add to course, course was full");
			return "redirect:../error";
		}
		courseService.addAttendeeToCourse(course, user);
		
		return "redirect:../users";
	}
}
