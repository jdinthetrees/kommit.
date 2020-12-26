<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page isErrorPage="true" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Show Event</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">kommit.</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="/events">Events</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/logout">Log out</a>
        </li>
        
      </ul>
    </div>
  </div>
</nav>
<div class="container">
	<h1> ${event.name }</h1>
	<h2> ${event.host.firstName }  ${event.host.lastName } </h2>
	<h2> ${event.city },  ${event.state } </h2>
	<h2> ${event.event_date} </h2>
</div>



<table>
	<h1>List of who's coming:</h1>
	    <thead>
	        <tr>
	            <th>Name</th>
	            
	        </tr>
	    </thead>
	    <tbody>
	        <c:forEach items="${event.attendees}" var="attendee">
		        <tr>
		        	<td><c:out value="${attendee.firstName} ${attendee.lastName}"/></td>
	            </tr> 
            </c:forEach>
	    </tbody>
</table>
	
	
	<h2>Message Wall</h2>
	<c:forEach items="${event.comments}" var="comment">
       	<p><c:out value="${comment.user.firstName} says: ${comment.comment}"/></p>
    </c:forEach>
   
 
    <form action="/events/${event.id}/newComment" method="post">
    	<span>Add Comment:</span><br/>
    	<textarea name="comment" class="form-control" rows="3"></textarea>
    	<button>Submit</button>
    </form>


</body>
</html>