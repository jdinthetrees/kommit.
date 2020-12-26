package com.johndang.springproject.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.JoinColumn;





//ATTRIBUTES
@Entity
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    
    @NotNull
    @Size(min=2, max=25, message="First Name must be between 2 and 25 characters")
    private String firstName;
    
    @NotNull
    @Size(min=2, max=25, message="Last Name must be between 2 and 25 characters")
    private String lastName;
    
    @NotNull
    @Size(min=2, max=25, message="City must be between 2 and 15 characters")
    private String city;
    
    @NotNull
    @Size(min=2, max=25, message="State must be between 2 and 10 characters")
    private String state;
    
    
    @Email(message="Email must be valid")
    @NotNull
    @Size(min=5, message="You must enter a valid email")
    private String email;
    
  
    
    @Size(min=8, message="Password must be minimum 8 characters")
    private String password;
    
    @Transient
    private String passwordConfirmation;
    @Transient
    private String duplicate;
    
    //relationships
    @OneToMany(mappedBy="host", fetch = FetchType.LAZY)
    private List<Event> hostedEvents;
    
    
	
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Comment> comments;
	
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
    		name="events_users",
    		joinColumns = @JoinColumn(name = "user_id"),
    		inverseJoinColumns = @JoinColumn(name = "event_id")
    )
    
    private List<Event> attending;

	@Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
   
    //CONSTRUCTERS

    
    public User() {
    }
    

	


	// GETTERS AND SETTERS
    
    
 

	public Long getId() {
		return id;
	}





	public void setId(Long id) {
		this.id = id;
	}





	public String getFirstName() {
		return firstName;
	}





	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}





	public String getLastName() {
		return lastName;
	}





	public void setLastName(String lastName) {
		this.lastName = lastName;
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





	public String getEmail() {
		return email;
	}





	public void setEmail(String email) {
		this.email = email;
	}





	public String getPassword() {
		return password;
	}





	public void setPassword(String password) {
		this.password = password;
	}





	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}





	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
	}





	public String getDuplicate() {
		return duplicate;
	}





	public void setDuplicate(String duplicate) {
		this.duplicate = duplicate;
	}





	public List<Event> getHostedEvents() {
		return hostedEvents;
	}





	public void setHostedEvents(List<Event> hostedEvents) {
		this.hostedEvents = hostedEvents;
	}





	public List<Comment> getComments() {
		return comments;
	}





	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}





	public List<Event> getAttending() {
		return attending;
	}





	public void setAttending(List<Event> attending) {
		this.attending = attending;
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