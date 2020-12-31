<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page isErrorPage="true" %>   
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <link rel="stylesheet" type="text/css" href="/css/show.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
<title>Show Event</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/events">kommit.</a>
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

<div id ="jumbo" class="jumbotron-fluid text-white">
	<div class="container">
	<h1 class="disply-4">Make things</h1>
	<p class="lead">Imagine if you can spend time with friends and family.</p>
	<%-- <h6 class="text-left">Welcome <c:out value="${user.firstName}"/></h6> --%>
	</div>
</div>

<div class="container">
<div class="container1">
	<h1> ${event.name }</h1>
	<h2> <i class="fas fa-user"> </i> ${event.host.firstName }  ${event.host.lastName } </h2>
	<h2> <i class="fas fa-info-circle"> </i> ${event.description}</h2>
	<h2> <i class="fas fa-location-arrow"> </i>${event.city },  ${event.state } </h2>
	<h2> <i class="far fa-calendar-alt"></i> <fmt:formatDate pattern ="MMMM dd, yyyy" value ="${event.date}"/></h2>
</div>


<div class="container2">
<table class="table table-striped">
	<h1>Who's coming:</h1>
	   <!--  <thead class="thead bg-secondary text-light">
	        <tr>
	            <th>Name</th>
	            
	        </tr>
	    </thead> -->
	    <tbody>
	        <c:forEach items="${event.attendees}" var="attendee">
		        <tr>
		        	<td><i class="fas fa-user"> <c:out value="${attendee.firstName} ${attendee.lastName}"/></td>
	            </tr> 
            </c:forEach>
	    </tbody>
</table>
	</div>
	</div>
	
	<div class="container3">
	<table class="table table-striped">
	<h2><i class="far fa-comments"></i> Comments</h2>
	<tbody>
	<c:forEach items="${event.comments}" var="comment">
	<tr>
       	<td><i class="far fa-comment"></i> <c:out value="${comment.user.firstName} says: ${comment.comment}"/></td>
       	</tr>
    </c:forEach>
   </tbody>
 </table>
  <form action="/events/${event.id}/newComment" method="post">
    	<span>Add Comment:</span><br/>
    	<textarea name="comment" class="form-control" rows="3"></textarea>
    	<button>Submit</button>
    </form>
 
 </div>

   
	


</body>
</html>