<!-- Navigation -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/board">MyBatis Blog</a>
      <c:if test="${!empty sessionScope.user}"><a class="navbar-brand" href="/user/profileUpdateForm" href="/blog/user/userprofileform.jsp"><img src="${sessionScope.user.userProfile}" style="border-radius:50px;" width="50px"/>${sessionScope.user.username}</a></c:if>
      
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">

          
		<c:choose>
			<c:when test="${empty sessionScope.user}">			
				<li class="nav-item">
	            <a class="nav-link" href="/user/joinForm">join</a>
	            </li>
	            <li class="nav-item">
	            <a class="nav-link" href="/user/loginForm">login</a>
           		 </li>			
			</c:when>
			<c:otherwise>
			     <li class="nav-item">
          		 <a class="nav-link" href="/board/writeForm">Posting</a>
         		 </li>
			    <li class="nav-item">
	            <a class="nav-link" href="/user/logout">Logout</a>
           		</li>
			</c:otherwise>
		</c:choose>



        </ul>
      </div>
    </div>
  </nav>