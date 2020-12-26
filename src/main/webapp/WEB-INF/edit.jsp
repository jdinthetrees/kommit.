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
<title>edit page</title>
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
	<h1>Hello</h1>
	<div>
		<form:form action="/events/${event.id }/edit" method="post" modelAttribute="event">
		<input type="hidden" name="_method" value="put"/>
		<form:input path="host" value="${ user_id }" type="hidden"/>
		<p>
		<form:label path="name">Event:</form:label>
		<form:input type="text" path="name"/>
		<form:errors path="name"/>
		</p>
		<p>
		<form:label path="event_date">Event Date:</form:label>
		<form:input type="date" path="event_date"/>
		<form:errors path="event_date"/>
		</p>
		<p>
		<form:label path="city">City:</form:label>
		<form:input type="text" path="city"/>
		<form:errors path="city"/>
		</p>
		<p>
		<form:label path="state">State:</form:label>
		<form:select path="state">
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
		</p>
		 <input type="submit" value="Edit your Event!"/>
	</form:form>
	</div>
</body>
</html>