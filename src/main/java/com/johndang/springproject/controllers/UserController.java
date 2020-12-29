package com.johndang.springproject.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.johndang.springproject.models.User;
import com.johndang.springproject.services.UserService;
import com.johndang.springproject.validators.UserValidator;

@Controller
public class UserController {
	@Autowired 
	private UserService userService;
	
	@Autowired
	private UserValidator userValidator;
	
	@GetMapping("/registration")
	public String registration(@ModelAttribute("user")User emptyUser) {
		return "registration.jsp";
	}
	
	@PostMapping("/registration")
	public String processRegister(
			@Valid @ModelAttribute("user")User filledUser, BindingResult results, 
			HttpSession session 
	) {
		userValidator.validate(filledUser, results);
		if(results.hasErrors()) {
			return "registration.jsp";
		}
//		CREATE USER
		User newUser = userService.registerUser(filledUser);
//		SAVE THE USER'S ID IN SESSION THEN REDIRECT TO DASHBOARD
		session.setAttribute("user_id", newUser.getId());
		return "redirect:/events";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login.jsp";
	}
	
	@PostMapping("/login")
	public String processLogin(
			@RequestParam("email")String postEmail,
			@RequestParam("password")String postPassword,
			RedirectAttributes redirectAttributes,
			HttpSession session
	) {
//		IF EMAIL IS NOT FOUND OR IF PASSWORD DOES NOT MATCH
		if( !userService.authenticateUser(postEmail, postPassword)) {
			redirectAttributes.addFlashAttribute("error", "Please try again");
			return "redirect:/login";
		}
//		FIND USER FROM DB AND THEN SET USER ID IN SESSION
		User loggedUser = userService.findByEmail(postEmail);
		session.setAttribute("user_id", loggedUser.getId());
		return "redirect:/events";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
}
