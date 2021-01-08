<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page isErrorPage="true" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <link rel="stylesheet" type="text/css" href="css/styles.css">

<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;900&display=swap" rel="stylesheet">
<title>front page</title>
</head> 
<body class="front">

 <nav class="navbar navbar-fluid navbar-expand-lg navbar-dark">
        <a href="/" class="navbar-brand">kommit.</a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#myNav3">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="myNav3">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="/registration" class="nav-link">Join</a>
                </li>
                <li class="nav-item">
                    <a href="/login" class="nav-link">Sign In</a>
                </li>
            </ul>
        </div>
</nav>

	<div class="tag">
	
<h1 class=" ml-5 front-h1">kommit.</h1>

	</div>
	
	<div>
		<p class="ml-5 lead">kommit. is a platform for meaningful social engagement</p>
	</div>
	
<footer class="d-flex flex-row justify-content-end align-items-center frontfoot">

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