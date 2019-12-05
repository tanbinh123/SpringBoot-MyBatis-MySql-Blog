<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>

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
  
<style>
/*
*
* ==========================================
* CUSTOM UTIL CLASSES
* ==========================================
*
*/
.file-upload input[type='file'] {
	display: none;
}

/*
*
* ==========================================
* FOR DEMO PURPOSES
* ==========================================
*
*/
body {
	height: 100vh;
}

.rounded-lg {
	border-radius: 1rem;
}

.custom-file-label.rounded-pill {
	border-radius: 50rem;
}

.custom-file-label.rounded-pill::after {
	border-radius: 0 50rem 50rem 0;
}
</style>

<section>
	<div class="container p-5">
		<!-- For demo purpose -->
		<div class="row mb-5 text-center text-white">
			<div class="col-lg-10 mx-auto"></div>
		</div>
		<!-- End -->


		<div class="row">
			<div class="col-lg-5 mx-auto">
				<div class="p-5 bg-white shadow rounded-lg">
					<img id="img_warp" src="${sessionScope.user.userProfile}" alt="" width="200" class="d-block mx-auto mb-4 rounded-pill">

					<!-- Default bootstrap file upload-->

					<h6 class="text-center mb-4 text-muted">프로필 사진 변경</h6>
					<form action="/user/profileUpdate" method="POST" enctype="multipart/form-data">
						<div class="custom-file overflow-hidden rounded-pill mb-5">
							<input name="file" id="customFile" type="file" class="custom-file-input rounded-pill"> <label id="fileNameLabel" for="customFile" class="custom-file-label rounded-pill">Choose file</label>
						</div>
						<!-- End -->

						<h6 class="text-center mb-4 text-muted">프로필 파일을 선택하세요(2MB 미만)</h6>

						<!-- Custom bootstrap upload file-->
						<label for="fileUpload" class="file-upload btn btn-primary btn-block rounded-pill shadow"><i class="fa fa-upload mr-2"></i>Browse for file ... <input id="fileUpload" type="file">
						</label>
						<!-- End -->
						<input class="file-upload btn btn-primary btn-block rounded-pill shadow" type="submit" value="전송"/>
					</form>

				</div>
			</div>
		</div>
	</div>
</section>

	<script>
		$("#customFile").on("change",handleImgFile);
		
		function handleImgFile(e){
			console.log(e);
			console.log(e.target);
			console.log(e.target.files);
			console.log(e.target.files[0]);
			var f = e.target.files[0];
			
			if(!f.type.match("image.*")){
				console.log("이미지 타입이 아닙니다");
				alert("이미지 타입이 아닙니다.");
				return;
			}
			var reader = new FileReader();
			
			reader.onload = function(e){
				console.log("================");
				console.log(e.target);
				console.log(e.target.result);
				$("#img_warp").attr("src",e.target.result);
				$("#fileNameLabel").text(f.name);
				
			}
			
			reader.readAsDataURL(f);			
			
		}
	</script>

  



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
