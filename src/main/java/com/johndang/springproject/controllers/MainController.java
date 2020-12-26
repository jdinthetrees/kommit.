package com.johndang.springproject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.johndang.springproject.models.Comment;
import com.johndang.springproject.models.Event;
import com.johndang.springproject.models.User;
import com.johndang.springproject.services.CommentService;
import com.johndang.springproject.services.MainService;
import com.johndang.springproject.services.UserService;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private UserService userService;
	

	//display front page
	
	@GetMapping("/") 
	public String front() {
		return "front.jsp";
	}
	//creating two step process
	@GetMapping("/events") 
	public String index(@ModelAttribute("event") Event emptyEvent, 
			HttpSession session,
			Model model) {
		//passing user id to form as host connected to event
		Long user_id = (Long) session.getAttribute("user_id");
		User user = userService.findUserById(user_id);
		List<Event> allEvents = mainService.getAllEvents();
		if(user_id == null)
			return "redirect:/";
		model.addAttribute("user", user);
		model.addAttribute("user_id", user_id);
		model.addAttribute("events", allEvents);
		return "dashboard.jsp";
	}
	
	@PostMapping("events/new")
	public String createEvent(@Valid @ModelAttribute("event") Event filledEvent, BindingResult results, 
			HttpSession session,
			Model model) {
		if(results.hasErrors()) {
			Long user_id = (Long) session.getAttribute("user_id");
			List<Event> allEvents = mainService.getAllEvents();
			model.addAttribute("user_id", user_id);
			model.addAttribute("events", allEvents);
			
			return "dashboard.jsp";
		}
		//else create a new event, anytime we deal with database we deal with service file
		mainService.createEvent(filledEvent);
		return "redirect:/events";
}
	//show single event
	@GetMapping("/events/{id}")
	public String show(@PathVariable("id")Long id, Model model, HttpSession session) {
		Long user_id = (Long) session.getAttribute("user_id");
		Event event = mainService.findEvent(id);
		if(user_id == null)
			return "redirect:/";
		if(event == null)
			return "redirect:/events";
		model.addAttribute("user_id", user_id);
		model.addAttribute("event", event);
		return "show.jsp";
	}
	
	//create comment
		@PostMapping("/events/{id}/newComment")
		public String addComment(@PathVariable("id") Long id, @RequestParam("comment") String comment, RedirectAttributes redirects, HttpSession session) {
			Long user_id = (Long) session.getAttribute("user_id");
			if(user_id == null)
				return "redirect:/";
			if(comment.equals("")) {
				redirects.addFlashAttribute("error", "Comment must not be blank");
				return "redirect:/events/" + id ;
			}
			
			User user = userService.findUserById(user_id);
			Event event = mainService.findEvent(id);
			Comment newComment = new Comment(comment, user, event);
			commentService.createComment(newComment);
			return "redirect:/events/" + id;
		}
	//display the edit
	@GetMapping("/events/{id}/edit")
	public String editEvent(@PathVariable("id") Long id, Model model) {
//		System.out.println(id);
		Event editEvent = mainService.findEvent(id);
		model.addAttribute("event", editEvent);
		return "edit.jsp";
	}
	
	//process the edit
	@PutMapping("/events/{id}/edit")
	public String processEditEvent(
			@Valid @ModelAttribute("event") Event filledEvent, 
			BindingResult results
			) {
				if(results.hasErrors()) {
					return"edit.jsp";
				}
				mainService.createEvent(filledEvent);
				return"redirect:/events";
	}
	
	
	//join event
	@GetMapping(value="/events/{id}/join")
	public String joinEvent(@PathVariable("id") Long id, HttpSession session) {
		Long user_id = (Long) session.getAttribute("user_id");
		User user = userService.findUserById(user_id);
		Event currentEvent = mainService.findEvent(id);
		mainService.addUsertoEvent(user, currentEvent);
		return "redirect:/events/{id}";
	}
	//cancel event
	@GetMapping(value="/events/{id}/cancel")
	public String cancelEventAttendance(@PathVariable("id") Long id, HttpSession session) {
		Long user_id = (Long) session.getAttribute("user_id");
		User user = userService.findUserById(user_id);
		Event currentEvent = mainService.findEvent(id);
		mainService.removeUserfromEvent(user, currentEvent);
		return "redirect:/events";
	}

	
	//delete
	@GetMapping("/events/{id}/delete")
	public String deleteEvent(@PathVariable("id") Long id) {
		mainService.deleteEvent(id);
		return "redirect:/events";
	}
	
	
}