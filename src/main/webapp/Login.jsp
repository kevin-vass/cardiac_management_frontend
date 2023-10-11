<%--
  Created by IntelliJ IDEA.
  User: Study
  Date: 10/5/2023
  Time: 7:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>System Login</title>

    <!-- Custom fonts for this template-->
    <link href="CSS/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="CSS/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="CSS/css/new-css.css" rel="stylesheet">

</head>

<body class="bg-gradient">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block test-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                </div>
                                <form class="user" action="${pageContext.request.contextPath}/login" method="post">
                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-user"
                                               id="txtloginemail" aria-describedby="emailHelp" name="email"
                                               placeholder="Enter Email Address...">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user" name="password"
                                               id="txtloginpassword" placeholder="Password">
                                    </div>
                                    <div class="form-group">
<%--                                        <div class="custom-control custom-checkbox small">--%>
<%--                                            <input type="checkbox" class="custom-control-input" id="customCheck">--%>
<%--                                            <label class="custom-control-label" for="customCheck">Remember--%>
<%--                                                Me</label>--%>
<%--                                        </div>--%>
                                    </div>
                                    <button type="submit" id="idLogin" class="btn btn-primary btn-user btn-block">Login</button>
<%--                                    <a href="index.html" class="btn btn-primary btn-user btn-block">--%>
<%--                                        Login--%>
<%--                                    </a>--%>
                                    <hr>
<%--                                    <a href="index.html" class="btn btn-google btn-user btn-block">--%>
<%--                                        <i class="fab fa-google fa-fw"></i> Login with Google--%>
<%--                                    </a>--%>
<%--                                    <a href="index.html" class="btn btn-facebook btn-user btn-block">--%>
<%--                                        <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook--%>
<%--                                    </a>--%>
                                </form>
                                <hr>
<%--                                <div class="text-center">--%>
<%--                                    <a class="small" href="forgot-password.html">Forgot Password?</a>--%>
<%--                                </div>--%>
<%--                                <div class="text-center">--%>
<%--                                    <a class="small" href="register.html">Create an Account!</a>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>



</div>

<!-- Bootstrap core JavaScript-->
<script src="CSS/vendor/jquery/jquery.min.js"></script>
<script src="CSS/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="CSS/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<script>
    // Check if the URL contains a query parameter indicating a successful login
    const urlParams = new URLSearchParams(window.location.search);
    const loginSuccess = urlParams.get("loginSuccess");
    const errorMessage = urlParams.get("errorMessage");

    if (loginSuccess === "true") {
        // Display an alert for a successful login
        alert("Login Successful");
    } else if (loginSuccess === "false") {
        // Display an alert for incorrect email or password
        alert("Email or password is incorrect");
    } else if (errorMessage) {
        // Display an alert with the error message
        alert("Login Failed: " + decodeURIComponent(errorMessage));
    }
</script>


</body>

</html>
