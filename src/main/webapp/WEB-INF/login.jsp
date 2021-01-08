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
 <link rel="stylesheet" type="text/css" href="css/login.css">
    <meta charset="UTF-8">
    <title>Login Page</title>
</head>
<body class="login">


<div class="loginform">
    <h3 class="text-center"><a href="/" class="text-light">kommit.</a></h3>
    <p class="mt-3 text-center">Not a member? <a href="/registration">Join us</a>
    <p class="mt-3 text-center"><c:out value="${error}" /></p>
    <form method="post" action="/login">
        <div class="form-row">
        <div class="col-xs-2 ml-3">
            <label for="email" class="hidden"></label>
            <input type="text" id="email" name="email" class="form-control" placeholder="Enter your email"/>
        </div>
       </div> 
         <div class="form-row">
        <div class="col-xs-2 ml-3">
            <label for="password" class="hidden"></label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password"/>
         </div>
       </div> 
       <div class="mt-3 text-center">
        <input type="submit" value="Sign in" class="p-1 btn btn-success signin text-light"/>
        </div>
    </form> 
    
    </div>   
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script> 
    
</body>
</html>