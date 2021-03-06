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
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <link rel="stylesheet" type="text/css" href="/css/show.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
 <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;900&display=swap" rel="stylesheet">
<title>Show Event</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
        <a href="/events" class="navbar-brand">kommit.</a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#myNav3">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="myNav3">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="/events" class="nav-link">Events</a>
                </li>
                <li class="nav-item">
                    <a href="/logout" class="nav-link">Log out</a>
                </li>
            </ul>
        </div>
</nav>

<div id ="jumbo" class="jumbotron-fluid text-white py-5">
</div>

	
	</div>
	<div class="center">
	<div class="container4 container-fluid d-flex flex-row flex-fill align-self-stretch justify-content-between">
	<div class="lcontainer lcontainer1 col-4">
	<h3> ${event.name }</h3>
	<h4> <i class="fas fa-user"> </i>  ${event.host.firstName }  ${event.host.lastName } </h4>
	<h4> <i class="fas fa-info-circle"> </i>  ${event.description}</h4>
	<h4> <i class="fas fa-location-arrow"> </i>  ${event.city },  ${event.state } </h4>
	<h4> <i class="far fa-calendar-alt"></i> <fmt:formatDate pattern ="MMMM dd, yyyy" value = "${event.date}"/></h4>
	 
	 </div>
	 
	 <div class="lcontainer lcontainer2 col-4">
<table class="table table-striped">
	<h3>Who's coming:</h3>
	
	    <tbody>
	        <c:forEach items="${event.attendees}" var="attendee">
		        <tr>
		        
		        	<td class="d-flex flex-row"><i class="fas fa-user"> <span><c:out value="${attendee.firstName} ${attendee.lastName}"/></span></td>
		   
	            </tr> 
            </c:forEach>
	    </tbody>
</table>
	</div>
	
	<div class="lcontainer lcontainer3 col-4">
	<table class="table table-striped">
	<h3><i class="far fa-comments"></i> Comments</h3>
	<tbody>
	<c:forEach items="${event.comments}" var="comment">
	<tr>
       	<td><i class="far fa-comment ml-1"></i> <c:out value="${comment.user.firstName} says: ${comment.comment}"/></td>
       	</tr>
    </c:forEach>
   </tbody>
 </table>
  <form action="/events/${event.id}/newComment" method="post">
    	<span class="ml-3">Add Comment:</span><br/>
    	<textarea name="comment" class="textarea ml-3" rows="3"></textarea><br>
    	<button class="btn btn-sm btn-success submit ml-3 mt-2 mb-2">Submit</button>
    </form>
 
 </div>
	
	
</div>
</div>

	
	
	<footer class="d-flex flex-row justify-content-end align-items-center">

<a href="/events" class="navbar-brand text-light">kommit.</a> <p class="mt-3 mr-5 text-secondary">to the people you care about most</p>

</footer>
   
	    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>	


</body>
</html>