package com.agile.signup.web;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

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
			model.addAttribute("errorMessage", "Could not find course");
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
			model.addAttribute("errorMessage", "Could not find course to delete");
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
	public String getAttendees(Model model, @PathVariable("id") String courseID){
		
		Course course = courseService.getCourseById(Integer.parseInt(courseID));
		if(course.getNumberAttendees() == 0){
			model.addAttribute("errorMessage", "No people in course to generate email list");
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
}

