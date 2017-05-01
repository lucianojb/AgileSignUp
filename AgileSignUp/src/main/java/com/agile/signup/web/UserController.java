package com.agile.signup.web;

import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		
		List<Division> divisionList = Arrays.asList(Division.values());
		
		model.addAttribute("divisions", divisionList);
		
		model.addAttribute("user", user);
		
		return "edituser";
	}
	
	@RequestMapping(value = "/edituser/{id}", method = RequestMethod.POST)
	public String editUserPost(@PathVariable("id") int id, Model model, @RequestParam("firstName") String fname,
			@RequestParam("lastName") String lname, @RequestParam("email") String email, @RequestParam("myradio") String employeeType,
			@RequestParam("myselect") String division, @RequestParam("submit")String submit){
		logger.info("Editing User {} POST", id);
		
		if(submit.equals("cancel")){
			RedirectView rview = new RedirectView();
			rview.setUrl("../users");
			return "redirect:../users";
		}
		
		User user = userService.getUserById(id);
		user = updateUserFromStrings(user, fname, lname, email, employeeType, division);
		
		userService.createOrUpdateUser(user);
		
		RedirectView rview = new RedirectView();
		rview.setUrl("../users");
		return "redirect:../users";
	}
	
	private User updateUserFromStrings(User user, String fname, String lname, String email, String employeeType,
			String division) {
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
		
		if(user == null){
			return "error";
		}
		
		if(user.getCourseID() != null){
			model.addAttribute("memberOfCourse", user.getCourseID());
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
		
		if(submit.equals("remove")){
			if(user.getCourseID() != null){
				course = courseService.getCourseById(user.getCourseID());
				removeAttendeeFromCourse(course, user);
			}
			
			return "redirect:../users";
		}
		
		if(user.getCourseID() != null){
			course = courseService.getCourseById(user.getCourseID());
			removeAttendeeFromCourse(course, user);
		}
		
		course = courseService.getCourseById(courseID);
		if(course.getNumberAttendees() == MAX_NUMBER_ATTENDEES){
			redirectAttributes.addFlashAttribute("errorMessage", "Could not add to course, course was full");
			return "redirect:../error";
		}
		addAttendeeToCourse(course, user);
		
		return "redirect:../users";
	}

	private void addAttendeeToCourse(Course course, User user) {
		course.setNumberAttendees(course.getNumberAttendees() + 1);
		if(course.getNumberAttendees() == MAX_NUMBER_ATTENDEES){
			course.setAvailable(false);
		}
		courseService.updateCourse(course);
		
		user.setCourseID(course.getCourseID());
		userService.createOrUpdateUser(user);
	}

	private void removeAttendeeFromCourse(Course course, User user) {
		course.setNumberAttendees(course.getNumberAttendees() - 1);
		course.setAvailable(true);
		courseService.updateCourse(course);		
		
		user.setCourseID(null);
		userService.createOrUpdateUser(user);
	}
}
