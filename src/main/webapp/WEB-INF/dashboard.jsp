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
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
        crossorigin="anonymous">
 <link rel="stylesheet" type="text/css" href="css/styles.css">
<title>dashboard</title>
</head>
<body>

 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a href="/" class="navbar-brand">kommit.</a>
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
            <!--     <li class="nav-item">
                    <a href="#" class="nav-link">Contact</a>
                </li> -->
            </ul>
        </div>
</nav>

<div id ="jumbo" class="jumbotron-fluid text-white">
	<div class="container">
	<h1 class="disply-4">Make things</h1>
	<p class="lead">Imagine if you can spend time with friends and family.</p>
	<h6 class="text-left">Welcome <c:out value="${user.firstName}"/></h6>
	</div>
</div>
<div class="maintable">
 	<table class="table table-sm table-striped table-bordered table-hover table-responsive-sm table-responsive-md">
 	 
		<thead class="thead bg-secondary text-light">
			<tr>
				<th>Name</th>
				<th>Date</th>
				<th>Location</th>
				<th>Host</th>
				<th>Action</th>
				
			</tr>
		</thead>
	<tbody>
			<c:forEach items="${events }" var="event">
			
				<tr>
					<td>
						<a href="/events/${event.id}" class="btn btn-primary">${event.name }</a>
					</td>
					<td><fmt:formatDate pattern ="MMMM dd, yyyy" value ="${event.date}"/></td>
					
					<td>${event.city }, ${event.state }</td>
					<td>${event.host.firstName}</td>
					<%-- <c:if test = "${ event.host == user  }">
					<td>
						<a href="/events/${event.id}/edit" class="btn btn-primary">Edit</a> |
						<a href="/events/${event.id}/delete" class="btn btn-danger">Delete</a>
					</td>
					</c:if>
					<td>
					 
					<c:if test = "${ event.host != user   }">
					<td>
						<a href="/events/${event.id}/join" class="btn btn-outline-success">Join</a> |
						<a href="/events/${event.id}/cancel" class="btn btn-outline-danger">Cancel</a>
					</td>
					</c:if>  --%>
	           
	            
	            <c:choose>
                        <c:when test="${event.host == user}">
                        <td><a href="/events/${event.id}" class="btn btn-success">Attending</a> | <a href="/events/${event.id}/edit" class="btn btn-primary">Edit</a> | <a href="events/${event.id}/delete" class="btn btn-danger">Delete</a></td>
                        </c:when>
                        <c:otherwise>
                            <c:set var="attending" value="${false}"/>
                            <c:forEach items="${event.getAttendees()}" var="attendee">
                             <c:if test="${attendee == user}">
                                 <c:set var="attending" value="${true}"/>
                               </c:if>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${attending == false}">
                                 <td><a href="/events/${event.id}/join" class="btn btn-outline-success">Join</a></td>
                                </c:when>
                                <c:otherwise>
                                 <td><a href="/events/${event.id}" class="btn btn-success">Attending</a>  | <a href="events/${event.id}/cancel" class="btn btn-outline-danger">Cancel</a></td>
                                </c:otherwise>
                           </c:choose>
                        </c:otherwise>
                        </c:choose>  
				</tr>
			</c:forEach>
		</tbody>
	</table> 
</div>
<div class="createform">
	<h3 class="text-light">Make your event:</h3>
	<form:form action="/events" method="post" modelAttribute="event">
		<form:input path="host" value="${ user_id }" type="hidden"/>
		<div class="form-row">
		<div class="col-xs-2 ml-4">
		<form:label path="name"></form:label>
		<form:input type="text" path="name" class="form-control" placeholder="Enter your event"/>
		<form:errors path="name" class="text-muted err"/>
		</div>
		<div class="col-xs-2 ml-4">
		<form:label path="description"></form:label>
		<form:input type="text" path="description" class="form-control" placeholder="Describe your event"/>
		<form:errors path="description" class="text-muted err"/>
		</div>
		<div class="col-xs-2 ml-4">
		<form:label path="date"></form:label>
		<form:input type="date" class="form-control" path="date"/>
		<form:errors path="date" class="text-muted err"/>
		</div>
		<div class="col-xs-2 ml-4">
		<form:label path="city"></form:label>
		<form:input type="text" path="city" class="form-control" placeholder="Enter your city"/>
		<form:errors path="city" class="text-muted err"/>
		</div>
		<div class="col-xs-2 ml-4">
		<form:label path="state"></form:label>
		<form:select  path="state"  class="form-control">
			        <form:option value ="AL">Alabama</form:option>
                    <form:option value ="AK">Alaska</form:option>
                    <form:option value ="AZ">Arizona</form:option>
                    <form:option value ="AR">Arkansas</form:option>
                    <form:option value ="CA">California</form:option>
                    <form:option value ="CO">Colorado</form:option>
                    <form:option value ="CT">Connecticut</form:option>
                    <form:option value ="DE">Delaware</form:option>
                    <form:option value ="FL">Florida</form:option>
                    <form:option value ="GA">Georgia</form:option>
                    <form:option value ="HI">Hawaii</form:option>
                    <form:option value ="ID">Idaho</form:option>
                    <form:option value ="IL">Illinois</form:option>
                    <form:option value ="IN">Indiana</form:option>
                    <form:option value ="IA">Iowa</form:option>
                    <form:option value ="KS">Kansas</form:option>
                    <form:option value ="KY">Kentucky</form:option>
					<form:option value ="LA">Louisana</form:option>
                    <form:option value ="ME">Maine</form:option>
                    <form:option value ="MD">Maryland</form:option>
                    <form:option value ="MA">Massachusetts</form:option>
                    <form:option value ="MI">Michigan</form:option>
                    <form:option value ="MN">Minnesota</form:option>
                    <form:option value ="MS">Mississippi</form:option>
                    <form:option value ="MO">Missouri</form:option>
                    <form:option value ="MT">Montana</form:option>
                    <form:option value ="NE">Nebraska</form:option>
                    <form:option value ="NV">Nevada</form:option>
                    <form:option value ="NH">New Hampshire</form:option>
                    <form:option value ="NJ">New Jersey</form:option>
                    <form:option value ="NM">New Mexico</form:option>
                    <form:option value ="NY">New York</form:option>
                    <form:option value ="NC">North Carolina</form:option>
                    <form:option value ="ND">North Dakota</form:option>
                    <form:option value ="OH">Ohio</form:option>
                    <form:option value ="OK">Oklahoma</form:option>
                    <form:option value ="OR">Oregon</form:option>
					<form:option value ="PA">Pennsylvania</form:option>
                    <form:option value ="RI">Rhode Island</form:option>
                    <form:option value ="SC">South Carolina</form:option>
                    <form:option value ="SD">South Dakota</form:option>
                    <form:option value ="TN">Tennessee</form:option>
                    <form:option value ="TX">Texas</form:option>
                    <form:option value ="UT">Utah</form:option>
                    <form:option value ="VT">Vermont</form:option>
                    <form:option value ="VA">Virginia</form:option>
                    <form:option value ="WA">Washington</form:option>
                    <form:option value ="WV">West Virginia</form:option>
                    <form:option value ="WI">Wisconsin</form:option>
                    <form:option value ="WY">Wyoming</form:option>       
        </form:select>
		<form:errors path="state" class="text-muted err"/>
		</div>
		 <div class="mt-2 submit text-center">
		 <input type="submit" value="Submit" class="p-1 create text-light"/>
		 </div>
		 </div>
	</form:form>
	</div>
</div>

</body>
</html>