<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>     

<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/edit.css">
<meta charset="UTF-8">
<title>edit page</title>
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
            <!--     <li class="nav-item">
                    <a href="#" class="nav-link">Contact</a>
                </li> -->
            </ul>
        </div>
</nav>


<div class="editform">
	<h3 class="text-light text-center">  Edit your event</h3>

		<form:form action="/events/${event.id }/edit" method="post" modelAttribute="event">
		<input type="hidden" name="_method" value="put"/>
		<form:input path="host" value="${ user_id }" type="hidden"/>
		
		<div class="form-row">
	
		<div class="col-10 ml-4">
		<form:label path="name"></form:label>
		<form:input type="text" class="form-control" path="name"/>
		<form:errors path="name"/>
		</div>
		
		<div class="col-10 ml-4">
		<form:label path="description"></form:label>
		<form:input type="text" path="description" class="form-control" placeholder="Describe your event"/>
		<form:errors path="description" class="text-muted err"/>
		</div>
		
		<div class="col-10 ml-4">
		<form:label path="date"></form:label>
		<form:input type="date" class="form-control" path="date"/>
		<form:errors path="date"/>
		</div>
		
		<div class="col-10 ml-4">
		<form:label path="city"></form:label>
		<form:input type="text" class="form-control" path="city"/>
		<form:errors path="city"/>
		</div>
		
		<div class="col-10 ml-4">
		<form:label path="state"></form:label>
		<form:select class="form-control" path="state">
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
		<form:errors path="state"/>
		
		</div>
		
		</div>
		<div class="mt-3 text-center">
		 <input type="submit" value="Edit!"  class="p-1 btn btn-success edit text-light"/>
		 </div>
	</form:form>

	</div>
	
	    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>
</html>