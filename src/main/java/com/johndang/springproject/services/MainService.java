package com.johndang.springproject.services;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.johndang.springproject.models.Event;
import com.johndang.springproject.models.User;
import com.johndang.springproject.repositories.EventRepository;

@Service
public class MainService {
	@Autowired
	private EventRepository eventRepository;

	public void createEvent(@Valid Event filledEvent) {
		eventRepository.save(filledEvent);
		
	}

	public List<Event> getAllEvents() {
		return eventRepository.findAll();
	}

	public Event findEvent(Long id) {
		
		return eventRepository.findById(id).orElse(null);
		}

	public void deleteEvent(Long id) {
		eventRepository.deleteById(id);
		
	}
	
	public void editEvent(Long id, Event event) {
		eventRepository.save(event);
	}
	
	public void addUsertoEvent(User user, Event event) {
		List<User> users = event.getAttendees();
		users.add(user);
		eventRepository.save(event);
	}
	
	public void removeUserfromEvent(User user, Event event) {
		List<User> users = event.getAttendees();
		users.remove(user);
		eventRepository.save(event);
	}

}
