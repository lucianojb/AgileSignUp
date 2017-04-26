package com.agile.signup.web;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.agile.signup.models.Course;
import com.agile.signup.service.CourseService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CourseController {
	
	@Autowired
	CourseService courseService;
	
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
	public String createCoursePost(Model model, @RequestParam("pickedDate") String date) {
		logger.info("POST create course");
		
		logger.info("Date is {}", date);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		Date dateObject = new Date();
		try {
			dateObject = sdf.parse(date);
		} catch (ParseException e) {
			return "createcourse";
		}
		
		courseService.createNewCourse(dateObject);
		
		List<Course> courses = courseService.getListOfCourses();
		
		model.addAttribute("courseData", courses);
		
		return "courses";
	}
}

