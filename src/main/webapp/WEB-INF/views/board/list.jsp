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

  <title>Blog Home - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/css/blog-home.css" rel="stylesheet">

</head>

<body>

  <%@ include file="../include/nav.jsp"%>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8">

        <h1 class="my-4">My Blog</h1>
        
        

		<c:forEach var="board" items="${boards}">
	        <!-- Blog Post -->
	        <div class="card mb-4">
	          <img class="card-img-top" src="${board.previewImg}" alt="Card image cap" style="max-height:300px;">
	          <div class="card-body">
	            <h2 class="card-title">${board.title}</h2>
	            <div class="card-text" style="display: -webkit-box; -webkit-box-orient: vertical;text-align: left; overflow: hidden; text-overflow: ellipsis; white-space: normal; line-height: 1.2; height: 5em; -webkit-line-clamp: 2; margin-bottom: 20px; word-break:break-all">${board.content}</div>
	            <a href="/board/detail/${board.id}" class="btn btn-primary">Read More &rarr;</a>
	          </div>
	          <div class="card-footer text-muted">
	            Posted on ${board.createDate} By
	            <a href="#">
		            
					<img src="${board.userProfile}" alt="" width="60px;" style="border-radius: 50px;"> ${board.username}
					
				</a>
	          </div>
	        </div>
	     </c:forEach>


		<c:choose>
			<c:when test="${page <= 1}">
				  <!-- Pagination -->
		        <ul class="pagination justify-content-center mb-4">
		          <li class="page-item disabled">
		            <a class="page-link" href="/board/list/${page-1}">&larr; Older</a>
		          </li>
		          <li class="page-item">
		            <a class="page-link" href="/board/list/${page+1}">Newer &rarr;</a>
		          </li>
		        </ul>							
			</c:when>
			<c:otherwise>
					<ul class="pagination justify-content-center mb-4">
		          <li class="page-item">
		            <a class="page-link" href="/board/list/${page-1}">&larr; Older</a>
		          </li>
		          <li class="page-item">
		            <a class="page-link" href="/board/list/${page+1}">Newer &rarr;</a>
		          </li>
		        </ul>				
			</c:otherwise>
		</c:choose>
        


      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

        <!-- Search Widget -->
        <div class="card my-4">
          <h5 class="card-header">Search</h5>
          <div class="card-body">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Search for...">
              <span class="input-group-btn">
                <button class="btn btn-secondary" type="button">Go!</button>
              </span>
            </div>
          </div>
        </div>

       

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
