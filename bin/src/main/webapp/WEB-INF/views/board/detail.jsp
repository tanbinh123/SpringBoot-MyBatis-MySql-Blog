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

  <!-- Page Content -->
  <div class="container">

    <div class="row">
    
    <div class="col-lg-2"></div>

      <!-- Post Content Column -->
      <div class="col-lg-8">

        <!-- Title -->
        <h1 class="mt-4">${board.title}</h1>

        <!-- Author -->
        <p class="lead">
          by
          <a href="#"><img src="${board.userProfile}" alt="" width="60px;" style="border-radius: 50px;"> ${board.username}</a>
        </p>

        <hr>

        <!-- Date/Time -->
        <p>Posted on ${board.createDate}</p>

        <hr>

      
        <!-- Post Content -->
        ${board.content}
        <hr>

        <form name="delete" action="/board/delete" method="POST">
        <input type="hidden" name="id" value="${board.id}" />
        </form>
        

       	

        <div class="col-lg-8">
        <a href="javascript:document.delete.submit()" class="btn btn-primary">삭제하기</a>
        <a href="/board/updateForm/${board.id}" class="btn btn-primary">수정하기</a>
        </div>        
        <br/>
        <br/>





      </div>



    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
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
