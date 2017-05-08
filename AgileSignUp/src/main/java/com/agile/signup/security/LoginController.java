package com.agile.signup.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.agile.signup.web.CourseController;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	 	@RequestMapping(value = "/login", method = RequestMethod.GET)
	    public String login(Model model) {
	        return "login";
	    }
	 
	 	@RequestMapping(value = "/login", method = RequestMethod.POST)
	    public String loginsuccess(Model model) {
	        return "home";
	    }
	 
	    @RequestMapping(value = "/logout", method = RequestMethod.GET)
	    public String logout(ModelMap model) {
	        return "logout";
	    }
	    
	    @RequestMapping(value = "/denied", method = RequestMethod.GET)
	    public String loginerror(ModelMap model) {
	        model.addAttribute("error", "true");
	        return "denied";
	    }

}
