package com.johndang.springproject.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="events")
public class Event {
	 @Id
	    @GeneratedValue(strategy=GenerationType.IDENTITY)
	    private Long id;
	 @Size(min=2, max=25, message="Event name must be between 2 and 25 characters")   
	 private String name;
	 @NotNull(message="You must have an event date")
	 @DateTimeFormat(pattern="yyyy-MM-dd")
	 private Date event_date;
	 
	 
	 
	 @Size(min = 2, max=25, message="City must have between 2 and 25 characters")
	 private String city;
	 @NotNull
	 private String state;
	 
	
	 
	 //relationships
	 @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name="user_id")
	    private User host;
	 
	    @OneToMany(mappedBy="event", fetch = FetchType.LAZY, cascade=CascadeType.ALL)
	    private List<Comment> comments;
	    
	    @ManyToMany(fetch = FetchType.LAZY)
	    @JoinTable(
	    	name = "events_users",
	    	joinColumns = @JoinColumn(name = "event_id"),
	    	inverseJoinColumns = @JoinColumn(name = "user_id")
	    )
	    private List<User> attendees;
	 
	 
	   @Column(updatable=false)
	    private Date createdAt;
	    private Date updatedAt;
	    
	    public Event() {
	    	this.attendees = new ArrayList<User>();
	    }
	    
	    
	    
		


		public Long getId() {
			return id;
		}







		public void setId(Long id) {
			this.id = id;
		}







		public String getName() {
			return name;
		}







		public void setName(String name) {
			this.name = name;
		}







		public Date getEvent_date() {
			return event_date;
		}







		public void setEvent_date(Date event_date) {
			this.event_date = event_date;
		}







		public String getCity() {
			return city;
		}







		public void setCity(String city) {
			this.city = city;
		}







		public String getState() {
			return state;
		}







		public void setState(String state) {
			this.state = state;
		}







		public User getHost() {
			return host;
		}







		public void setHost(User host) {
			this.host = host;
		}







		public List<Comment> getComments() {
			return comments;
		}







		public void setComments(List<Comment> comments) {
			this.comments = comments;
		}







		public List<User> getAttendees() {
			return attendees;
		}







		public void setAttendees(List<User> attendees) {
			this.attendees = attendees;
		}







		public Date getCreatedAt() {
			return createdAt;
		}







		public void setCreatedAt(Date createdAt) {
			this.createdAt = createdAt;
		}







		public Date getUpdatedAt() {
			return updatedAt;
		}







		public void setUpdatedAt(Date updatedAt) {
			this.updatedAt = updatedAt;
		}







		@PrePersist
	    protected void onCreate(){
	        this.createdAt = new Date();
	    }

		@PreUpdate
	    protected void onUpdate(){
	        this.updatedAt = new Date();
	    }

}
