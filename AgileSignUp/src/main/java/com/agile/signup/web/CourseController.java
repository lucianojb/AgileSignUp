package com.agile.signup.web;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
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
	
	@RequestMapping(value = "/createcourse", method = RequestMethod.GET)
	public String createCourseGet(Model model) {
		logger.info("GET create course");
		
		return "createcourse";
	}
	
	@RequestMapping(value = "/createcourse", method = RequestMethod.POST)
	public String createCoursePost(Model model, @RequestParam("pickedDate") String date, RedirectAttributes redirectAttributes) {
		logger.info("POST create course");
		
		logger.info("Date is {}", date);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dateObject = new Date();
		try {
			dateObject = sdf.parse(date);
		} catch (ParseException e) {
			redirectAttributes.addFlashAttribute("errorMessage", "Error using this date to create course");
			return "redirect:createcourse";
		}
		
		Date currentDate = new Date();
		
		if(dateObject.before(currentDate)){
			redirectAttributes.addFlashAttribute("errorMessage", "Cannot create a course in the past.");
			return "redirect:createcourse";
		}
		
		List<Course> coursesOnDate = courseService.getCoursesByDate(dateObject);
		if(!coursesOnDate.isEmpty()){
			redirectAttributes.addFlashAttribute("errorMessage", "Course on this date already exists!");
			return "redirect:createcourse";
		}
		
		courseService.createNewCourse(dateObject);
						
		RedirectView rview = new RedirectView();
		rview.setUrl("courses");
		
		return "redirect:courses";
	}
	
	@RequestMapping(value = "/attendeeslist/{id}", method = RequestMethod.GET)
	public String getAttendees(Model model, @PathVariable("id") String courseID){
		
		Course course = courseService.getCourseById(Integer.parseInt(courseID));
		if(course.getNumberAttendees() == 0){
			model.addAttribute("errorMessage", "No peoples to view here");
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

