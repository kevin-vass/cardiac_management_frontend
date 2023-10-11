<%--
  Created by IntelliJ IDEA.
  User: Study
  Date: 10/6/2023
  Time: 12:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // Check if the user has an active session
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("email") == null) {
        // User is not authenticated, redirect to the login page
        response.sendRedirect("Login.jsp");
    }
%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Predict Heart Decease</title>

    <!-- Custom fonts for this template-->
    <link href="CSS/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="CSS/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="CSS/css/new-css.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="Dashboard.jsp">
            <div class="sidebar-brand-icon rotate-n-15">
                <%--                <i class="fas fa-laugh-wink"></i>--%>
            </div>
            <div class="sidebar-brand-text mx-3">Patient Management<sup></sup></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="Dashboard.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
               aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-table"></i>
                <span>Patient Management</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Patient Management:</h6>
                    <a class="collapse-item" href="PatientInfo.jsp">Patient Information</a>
                    <a class="collapse-item" href="AddNewPatient.jsp">Add New Patient</a>
                </div>
            </div>
        </li>



        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->


        <li class="nav-item">
        <li class="nav-item active">
            <a class="nav-link" href="PredictionUi.jsp">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Get Prediction</span>
            </a>
        </li>
        </li>

        <hr class="sidebar-divider">

        <li class="nav-item">
            <a class="nav-link" href="BillingPage.jsp">
                <i class="fas fa-fw fa-cog"></i>
                <span>Billing</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="PredictionUi.jsp">
                <i class="fas fa-fw fa-wrench"></i>
                <span>Add New User</span>
            </a>
        </li>


        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>


                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                             aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="Search for..." aria-label="Search"
                                           aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>



                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                            <img class="img-profile rounded-circle"
                                 src="img/undraw_profile.svg">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Profile
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                Settings
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Activity Log
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-4 text-gray-800">Heart Decease Prediction</h1>

                <form id="prediction-form" method="post">
                    <!-- Text Fields -->
                    <div class="form-group">
                        <label for="field1">Age:</label>
                        <input type="text" class="form-control" id="field1" name="age" required>
                    </div>
                    <div class="form-group">
                        <label for="spinner1">Sex:</label>
                        <label for="spinner1">M:Male(1) / F:Female(0)</label>
                        <select class="form-control" id="spinner1" name="sex_selection">
                            <option value="1">1</option>
                            <option value="0">0</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="spinner2">Chest Pain Type:</label>
                        <label for="spinner2">ASY:Asymptomatic(0) / ATA:Atypical Angina(1) / NAP:Non-Anginal pain(2) / TA:Typical Angina(3)</label>
                        <select class="form-control" id="spinner2" name="pain_type">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="field2">Resting BP:</label>
                        <input type="text" class="form-control" id="field2" name="resting_bp" required>
                    </div>
                    <div class="form-group">
                        <label for="field3">Cholesterol:</label>
                        <input type="text" class="form-control" id="field3" name="cholesterol" required>
                    </div>
                    <div class="form-group">
                        <label for="spinner3">Fasting BS:</label>
                        <label for="spinner3">1:if FastingBS > 120 mg/dl / 0:Otherwise</label>
                        <select class="form-control" id="spinner3" name="fasting_bs">
                            <option value="1">1</option>
                            <option value="0">0</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="spinner4">Resting ECG:</label>
                        <label for="spinner4">LVH: Shoving Probable or definite left ventricular hypertrophy(0) / Normal:Normal(1) / ST:Having ST-T Wave abnormality(2)</label>
                        <select class="form-control" id="spinner4" name="resting_ecg">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="field4">Max HR:</label>
                        <input type="text" class="form-control" id="field4" name="max_hr" required>
                    </div>
                    <div class="form-group">
                        <label for="spinner5">Exercise Angina:</label>
                        <label for="spinner5">N:No(0) / Y:Yes(1)</label>
                        <select class="form-control" id="spinner5" name="exercise_angina">
                            <option value="0">0</option>
                            <option value="1">1</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="field5">Old peak:</label>
                        <input type="text" class="form-control" id="field5" name="oldpeak" required>
                    </div>
                    <div class="form-group">
                        <label for="spinner6">ST Slope:</label>
                        <label for="spinner6">Down:Downsloping(0) / Flat:Flat(1) / Up:Upsloping(2)</label>
                        <select class="form-control" id="spinner6" name="st_slope">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                    </div>


                    <!-- Submit Button -->
                    <button type="submit" id="predict-button" class="btn btn-primary">Submit</button>

                </form>
                <!-- Display the prediction result here -->
                <div id="prediction-result">
                    <!-- The prediction result will be displayed here -->
                </div>

                <!-- JavaScript for handling the prediction request and displaying the result -->
                <script>
                    // JavaScript for handling the prediction request and displaying the result
                    document.addEventListener("DOMContentLoaded", function() {
                        const predictionResultDiv = document.getElementById("prediction-result");
                        const predictionForm = document.getElementById("prediction-form");

                        predictionForm.addEventListener("submit", function(event) {
                            event.preventDefault(); // Prevent the default form submission

                            // Prepare the data to send to the server
                            const formData = new FormData(predictionForm);
                            const data = {};
                            formData.forEach((value, key) => {
                                data[key] = value;
                            });

                            // Make an AJAX request to the prediction endpoint
                            fetch("http://127.0.0.1:5000/predict", {
                                method: "POST",
                                body: JSON.stringify(data),
                                headers: {
                                    "Content-Type": "application/json"
                                }
                            })
                                .then(response => response.json())
                                .then(data => {
                                    // Update the prediction result on the web page
                                    if (data.result) {
                                        predictionResultDiv.textContent = "Prediction Result: " + data.result;
                                    } else {
                                        predictionResultDiv.textContent = "Prediction Result: Unknown";
                                    }
                                })
                                .catch(error => {
                                    // Handle any errors here
                                    predictionResultDiv.textContent = "Error occurred while making the prediction.";
                                });
                        });
                    });
                </script>



            </div>

<%--            </div>--%>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
<%--                    <span>Copyright &copy; Your Website 2020</span>--%>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <form action="LogoutServlet" method="post">
                    <input type="submit" value="Logout" class="btn btn-primary">
                    <%--                <a class="btn btn-primary">Logout</a>--%>
                </form>
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

</body>

</html>
