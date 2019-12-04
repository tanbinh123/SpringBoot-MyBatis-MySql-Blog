<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Blog Post - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/css/blog-post.css" rel="stylesheet">

</head>

<body>

  <%@ include file="../include/nav.jsp"%>
  
  <!--login modal-->

  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
          
          <h1 style="margin:0 auto;">Login</h1>
      </div>
      <div class="modal-body">
          <form class="form col-md-12 center-block" method="POST" action="/user/login">
            <div class="form-group">
              <input name="username" type="text" class="form-control input-lg" placeholder="Username">
            </div>
            <div class="form-group">
              <input name="password" type="password" class="form-control input-lg" placeholder="Password">
            </div>
            <div class="form-group">
              <button class="btn btn-primary btn-lg btn-block">Login</button>
              <span class="pull-right"><a href="/user/joinForm">Register</a></span>
            </div>
          </form>
      </div>

  </div>
  </div>

  



  <!-- Footer -->
  <footer class="py-5 bg-dark" style="position:fixed;bottom: 0px;width: 100%;">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="/vendor/jquery/jquery.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
