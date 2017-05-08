package com.agile.signup.web;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
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

import com.agile.signup.models.Course;
import com.agile.signup.models.User;
import com.agile.signup.service.CourseService;
import com.agile.signup.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CourseController {
	
	@Autowired
	CourseService courseService;
	
	@Autowired
	UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/courses", method = RequestMethod.GET)
	public String course(Model model) {
		logger.info("Now viewing courses");
		
		List<Course> courses = courseService.getListOfCourses();
		
		model.addAttribute("courseData", courses);
		
		return "courses";
	}	
	
	@RequestMapping(value = "/completecourse/{id}", method = RequestMethod.GET)
	public String deleteUserGet(Model model, @PathVariable("id") int id) {
		logger.info("Getting page to complete course {}", id);
		
		Course course = courseService.getCourseById(id);
		if(course == null){
			model.addAttribute("errorMessage", "Could not find course to complete");
			return "error";
		}
		
		model.addAttribute("course", course);
						
		return "completecourse";
	}
	
	@RequestMapping(value = "/completecourse/{id}", method = RequestMethod.POST)
	public String deleteUser(Model model,  @PathVariable("id") int id, @RequestParam(name="submit", required=true)String submit) {
		logger.info("Posting for complete course {}!", id);
		
		Course course = courseService.getCourseById(id);
		if(course == null){
			model.addAttribute("errorMessage", "Could not find course to complete");
			return "redirect:../error";
		}
		
		if(submit.equals("complete")){
			logger.info("Completing course");
			
			List<User> usersEnrolled = userService.getUsersByCourseId(id);
			for(User user: usersEnrolled){
				userService.removeUserById(user.getUserID());
			}
			
			courseService.removeCourseById(id);
		}else if(submit.equals("delete")){
			logger.info("Deleting course");
			
			List<User> usersEnrolled = userService.getUsersByCourseId(id);
			for(User user: usersEnrolled){
				user.setCourseID(null);
				userService.createOrUpdateUser(user);
			}
			
			List<User> usersPreferred = userService.getUsersByPreferredCourseId(id);
			for(User user: usersPreferred){
				user.setPreferredCourseID(-1);
				userService.createOrUpdateUser(user);
			}
			
			courseService.removeCourseById(id);
		}
						
		return "redirect:../courses";
	}
	
	@RequestMapping(value = "/createcourse", method = RequestMethod.GET)
	public String createCourseGet(Model model) {
		logger.info("GET create course");
		
		return "createcourse";
	}
	
	@RequestMapping(value = "/createcourse", method = RequestMethod.POST)
	public String createCoursePost(Model model, @RequestParam("pickedDate") String date, RedirectAttributes redirectAttributes) {
		logger.info("POST create course");
		
		logger.info("Date is {}", date);
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		Date dateObject = new Date();
		try {
			dateObject = sdf.parse(date);
		} catch (ParseException e) {
			redirectAttributes.addFlashAttribute("errorMessage", "Error using this date to create course");
			return "redirect:createcourse";
		}
		
		Date currentDate = new Date();
		
		if(dateObject.before(currentDate)){
			redirectAttributes.addFlashAttribute("errorMessage", "Error! Cannot create a course in the past. Please select a new course date.");
			return "redirect:createcourse";
		}
		
		List<Course> coursesOnDate = courseService.getCoursesByDate(dateObject);
		if(!coursesOnDate.isEmpty()){
			redirectAttributes.addFlashAttribute("errorMessage", "Error! Course on this date already exists! Please select a new course date");
			return "redirect:createcourse";
		}
		
		courseService.createNewCourse(dateObject);
		
		return "redirect:courses";
	}
	
	@RequestMapping(value = "/attendeeslist/{id}", method = RequestMethod.GET)
	public String getAttendees(Model model, @PathVariable("id") String courseID, RedirectAttributes redirectAttribute){
		
		Course course = courseService.getCourseById(Integer.parseInt(courseID));
		if(course == null){
			model.addAttribute("errorMessage", "Could not find course to get attendees");
			return "error";
		}
		
		List<User> users = userService.getUsersByCourseId(course.getCourseID());
		List<String> emails = new LinkedList<String>();
		for(int x = 0; x < users.size(); x++){
			emails.add(users.get(x).getEmail());
		}
		
		model.addAttribute("emailList", emails);
		
		return "attendeeslist";
	}
	
	@RequestMapping(value = "/assigntocourse/{id}", method = RequestMethod.GET)
	public String assignUsersToCourse(Model model, @PathVariable("id") int id) {
		logger.info("Getting mass assign page {}", id);
		
		Course course = courseService.getCourseById(id);
		if(course == null){
			model.addAttribute("errorMessage", "Could not find course to assign users");
			return "error";
		}
		
		List<User> users = userService.getAllUsersOrderedByGivenCourseIdFirst(id);
		
		model.addAttribute("course", course);
		model.addAttribute("userList", users);
						
		return "assigntocourse";
	}
	
	@RequestMapping(value = "/assigntocourse/{id}", method = RequestMethod.POST)
	public String assignUsersToCourse(Model model,  @PathVariable("id") int id, @RequestParam(name="submit", required=true)String submit,
			@RequestParam(name="checkbox", required=false)List<Integer> newUsersAssigned, RedirectAttributes redirectAttribute) {
		logger.info("Posting mass assign for {}", id);
		
		if(newUsersAssigned != null && newUsersAssigned.size() > courseService.getMaxNumberAttendees()){
			redirectAttribute.addFlashAttribute("errorMessage", "Number of selected users exceeds max number of attendees per course: " + courseService.getMaxNumberAttendees());
			return "redirect:../error";
		}
		
		if(submit.equals("save")){			
			Course course = courseService.getCourseById(id);
			if(course == null){
				model.addAttribute("errorMessage", "Could not find course to complete");
				return "error";
			}
			
			List<User> newUsers = new LinkedList<User>();
			if(newUsersAssigned != null){
				for(Integer userID: newUsersAssigned){
					newUsers.add(userService.getUserById(userID));
				}
			}
			
			List<User> usersPreviouslyAssigned = userService.getUsersByCourseId(id);
			for(User user: usersPreviouslyAssigned){
				if(!newUsers.contains(user)){
					courseService.removeAttendeeFromCourse(course, user);
				}
			}
			
			for(User user: newUsers){
				if(user.getCourseID() != null && user.getCourseID() != id){
					Course courseToRemoveFrom = courseService.getCourseById(user.getCourseID());
					courseService.removeAttendeeFromCourse(courseToRemoveFrom, user);
					courseService.addAttendeeToCourse(course, user);
				}else if(user.getCourseID() == null){
					courseService.addAttendeeToCourse(course, user);
				}
			}
			
		}
						
		return "redirect:../courses";
	}
}

