<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
       
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
     <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Registration Page</title>
</head>
<body>

<div class="registerform">
  <h1>Register!</h1>
    
    <p><form:errors path="user.*"/></p>
    
    <form:form method="POST" action="/registration" modelAttribute="user">
    	<div class="form-row">
    	<div class="col-xs-2">
            <form:label path="firstName">First Name:</form:label>
            <form:input path="firstName" class="form-control" placeholder="Enter your first name"/>
        </div>
       </div> 
        <div class="form-row">
        <div class="col-xs-2">
            <form:label path="lastName">Last Name:</form:label>
            <form:input path="lastName" class="form-control" placeholder="Enter your last name"/>
        </div>
        </div>
         <div class="form-row">
        <div class="col-xs-2">
            <form:label path="city">City:</form:label>
            <form:input type="test" path="city" class="form-control" placeholder="Enter your city"/>
        </div>
        </div>
        
        <div class="form-row">
        <div class="col-xs-2">
        	<form:label path = "state">State:</form:label>
            <form:select path="state" class="form-control">
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
            
        </div>
        </div>
    
        <div class="form-row">
        <div class="col-xs-2">
            <form:label path="email">Email:</form:label>
            <form:input type="email" path="email" class="form-control" placeholder="Enter your email"/>
         </div>
        </div>
       <div class="form-row">
        <div class="col-xs-2">
            <form:label path="password">Password:</form:label>
            <form:password path="password" class="form-control" placeholder="Enter your password"/>
          </div>
        </div>
        <div class="form-row">
        <div class="col-xs-2">
            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
            <form:password path="passwordConfirmation" class="form-control" placeholder="Confirm your password"/>
         </div>
        </div>
        <input type="submit" value="Register!"/>
       
    </form:form>

</div>

    
</body>
</html>