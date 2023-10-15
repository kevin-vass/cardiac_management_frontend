<%--
  Created by IntelliJ IDEA.
  User: Study
  Date: 10/5/2023
  Time: 8:53 PM
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Patient Information</title>

    <!-- Custom fonts for this template -->
    <link href="CSS/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="CSS/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="CSS/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
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
        <li class="nav-item">
            <a class="nav-link" href="Dashboard.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <%--        <div class="sidebar-heading">--%>
        <%--            Interface--%>
        <%--        </div>--%>

        <!-- Nav Item - Pages Collapse Menu -->


        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
               aria-expanded="true" aria-controls="collapseTwo">
                <%--            <a class="nav-link" href="tables.html">--%>
                <i class="fas fa-fw fa-table"></i>
                <span>Patient Management</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Patient Management:</h6>
                    <%--        <li class="nav-item active">--%>
                    <a class="collapse-item" href="PatientInfo.jsp">Patient Information</a>
                    <a class="collapse-item" href="AddNewPatient.jsp">Add New Patient</a>
                    <a class="collapse-item  nav-item active" href="ViewClinicData.jsp">View Clinic Data</a>
                    <%--    </li>--%>
                </div>
            </div>
        </li>
        <%--        <li class="nav-item">--%>
        <%--            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"--%>
        <%--               aria-expanded="true" aria-controls="collapseTwo">--%>
        <%--                <i class="fas fa-fw fa-cog"></i>--%>
        <%--                <span>Components</span>--%>
        <%--            </a>--%>
        <%--            <div id="collapseTw" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">--%>
        <%--                <div class="bg-white py-2 collapse-inner rounded">--%>
        <%--                    <h6 class="collapse-header">Custom Components:</h6>--%>
        <%--                    <a class="collapse-item" href="buttons.html">Buttons</a>--%>
        <%--                    <a class="collapse-item" href="cards.html">Cards</a>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </li>--%>


        <!-- Nav Item - Utilities Collapse Menu -->
        <%--        <li class="nav-item">--%>
        <%--            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"--%>
        <%--               aria-expanded="true" aria-controls="collapseUtilities">--%>
        <%--                <i class="fas fa-fw fa-wrench"></i>--%>
        <%--                <span>Utilities</span>--%>
        <%--            </a>--%>
        <%--            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"--%>
        <%--                 data-parent="#accordionSidebar">--%>
        <%--                <div class="bg-white py-2 collapse-inner rounded">--%>
        <%--                    <h6 class="collapse-header">Custom Utilities:</h6>--%>
        <%--                    <a class="collapse-item" href="utilities-color.html">Colors</a>--%>
        <%--                    <a class="collapse-item" href="utilities-border.html">Borders</a>--%>
        <%--                    <a class="collapse-item" href="utilities-animation.html">Animations</a>--%>
        <%--                    <a class="collapse-item" href="utilities-other.html">Other</a>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </li>--%>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <%--        <div class="sidebar-heading">--%>
        <%--            Addons--%>
        <%--        </div>--%>

        <!-- Nav Item - Pages Collapse Menu -->


        <li class="nav-item">
            <a class="nav-link" href="PredictionUi.jsp">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Get Prediction</span>
            </a>
        </li>
        <%--            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">--%>
        <%--                <div class="bg-white py-2 collapse-inner rounded">--%>
        <%--                    <h6 class="collapse-header">Login Screens:</h6>--%>
        <%--                    <a class="collapse-item" href="login.html">Login</a>--%>
        <%--                    <a class="collapse-item" href="register.html">Register</a>--%>
        <%--                    <a class="collapse-item" href="forgot-password.html">Forgot Password</a>--%>
        <%--                    <div class="collapse-divider"></div>--%>
        <%--                    <h6 class="collapse-header">Other Pages:</h6>--%>
        <%--                    <a class="collapse-item" href="404.html">404 Page</a>--%>
        <%--                    <a class="collapse-item" href="blank.html">Blank Page</a>--%>
        <%--                </div>--%>
        <%--            </div>--%>


        <hr class="sidebar-divider">

        <li class="nav-item">
            <%--        <li class="nav-item active">--%>
            <a class="nav-link" href="BillingPage.jsp">
                <i class="fas fa-fw fa-cog"></i>
                <span>Billing</span>
            </a>
            <%--        </li>--%>
        </li>

        <li class="nav-item">
            <%--        <li class="nav-item active">--%>
            <a class="nav-link" href="AddNewUser.jsp">
                <i class="fas fa-fw fa-wrench"></i>
                <span>Add New User</span>
            </a>
            <%--        </li>--%>
        </li>

        <!-- Nav Item - Charts -->
        <%--        <li class="nav-item">--%>
        <%--            <a class="nav-link" href="charts.html">--%>
        <%--                <i class="fas fa-fw fa-chart-area"></i>--%>
        <%--                <span>Charts</span></a>--%>
        <%--        </li>--%>

        <!-- Nav Item - Tables -->
        <%--        <li class="nav-item">--%>
        <%--            <a class="nav-link" href="tables.html">--%>
        <%--                <i class="fas fa-fw fa-table"></i>--%>
        <%--                <span>Tables</span></a>--%>
        <%--        </li>--%>

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
                <form class="form-inline">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                </form>

                <!-- Topbar Search -->
                <%--                <form--%>
                <%--                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">--%>
                <%--                    <div class="input-group">--%>
                <%--                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."--%>
                <%--                               aria-label="Search" aria-describedby="basic-addon2">--%>
                <%--                        <div class="input-group-append">--%>
                <%--                            <button class="btn btn-primary" type="button">--%>
                <%--                                <i class="fas fa-search fa-sm"></i>--%>
                <%--                            </button>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </form>--%>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <%--                    <li class="nav-item dropdown no-arrow d-sm-none">--%>
                    <%--                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"--%>
                    <%--                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                    <%--                            <i class="fas fa-search fa-fw"></i>--%>
                    <%--                        </a>--%>
                    <%--                        <!-- Dropdown - Messages -->--%>
                    <%--                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"--%>
                    <%--                             aria-labelledby="searchDropdown">--%>
                    <%--                            <form class="form-inline mr-auto w-100 navbar-search">--%>
                    <%--                                <div class="input-group">--%>
                    <%--                                    <input type="text" class="form-control bg-light border-0 small"--%>
                    <%--                                           placeholder="Search for..." aria-label="Search"--%>
                    <%--                                           aria-describedby="basic-addon2">--%>
                    <%--                                    <div class="input-group-append">--%>
                    <%--                                        <button class="btn btn-primary" type="button">--%>
                    <%--                                            <i class="fas fa-search fa-sm"></i>--%>
                    <%--                                        </button>--%>
                    <%--                                    </div>--%>
                    <%--                                </div>--%>
                    <%--                            </form>--%>
                    <%--                        </div>--%>
                    <%--                    </li>--%>

                    <!-- Nav Item - Alerts -->
                    <%--                    <li class="nav-item dropdown no-arrow mx-1">--%>
                    <%--                        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"--%>
                    <%--                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                    <%--                            <i class="fas fa-bell fa-fw"></i>--%>
                    <%--                            <!-- Counter - Alerts -->--%>
                    <%--                            <span class="badge badge-danger badge-counter">3+</span>--%>
                    <%--                        </a>--%>
                    <%--                        <!-- Dropdown - Alerts -->--%>
                    <%--                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"--%>
                    <%--                             aria-labelledby="alertsDropdown">--%>
                    <%--                            <h6 class="dropdown-header">--%>
                    <%--                                Alerts Center--%>
                    <%--                            </h6>--%>
                    <%--                            <a class="dropdown-item d-flex align-items-center" href="#">--%>
                    <%--                                <div class="mr-3">--%>
                    <%--                                    <div class="icon-circle bg-primary">--%>
                    <%--                                        <i class="fas fa-file-alt text-white"></i>--%>
                    <%--                                    </div>--%>
                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <div class="small text-gray-500">December 12, 2019</div>--%>
                    <%--                                    <span class="font-weight-bold">A new monthly report is ready to download!</span>--%>
                    <%--                                </div>--%>
                    <%--                            </a>--%>
                    <%--                            <a class="dropdown-item d-flex align-items-center" href="#">--%>
                    <%--                                <div class="mr-3">--%>
                    <%--                                    <div class="icon-circle bg-success">--%>
                    <%--                                        <i class="fas fa-donate text-white"></i>--%>
                    <%--                                    </div>--%>
                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <div class="small text-gray-500">December 7, 2019</div>--%>
                    <%--                                    $290.29 has been deposited into your account!--%>
                    <%--                                </div>--%>
                    <%--                            </a>--%>
                    <%--                            <a class="dropdown-item d-flex align-items-center" href="#">--%>
                    <%--                                <div class="mr-3">--%>
                    <%--                                    <div class="icon-circle bg-warning">--%>
                    <%--                                        <i class="fas fa-exclamation-triangle text-white"></i>--%>
                    <%--                                    </div>--%>
                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <div class="small text-gray-500">December 2, 2019</div>--%>
                    <%--                                    Spending Alert: We've noticed unusually high spending for your account.--%>
                    <%--                                </div>--%>
                    <%--                            </a>--%>
                    <%--                            <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>--%>
                    <%--                        </div>--%>
                    <%--                    </li>--%>

                    <!-- Nav Item - Messages -->
                    <%--                    <li class="nav-item dropdown no-arrow mx-1">--%>
                    <%--                        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"--%>
                    <%--                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                    <%--                            <i class="fas fa-envelope fa-fw"></i>--%>
                    <%--                            <!-- Counter - Messages -->--%>
                    <%--                            <span class="badge badge-danger badge-counter">7</span>--%>
                    <%--                        </a>--%>
                    <%--                        <!-- Dropdown - Messages -->--%>
                    <%--                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"--%>
                    <%--                             aria-labelledby="messagesDropdown">--%>
                    <%--                            <h6 class="dropdown-header">--%>
                    <%--                                Message Center--%>
                    <%--                            </h6>--%>
                    <%--                            <a class="dropdown-item d-flex align-items-center" href="#">--%>
                    <%--                                <div class="dropdown-list-image mr-3">--%>
                    <%--                                    <img class="rounded-circle" src="img/undraw_profile_1.svg"--%>
                    <%--                                         alt="...">--%>
                    <%--                                    <div class="status-indicator bg-success"></div>--%>
                    <%--                                </div>--%>
                    <%--                                <div class="font-weight-bold">--%>
                    <%--                                    <div class="text-truncate">Hi there! I am wondering if you can help me with a--%>
                    <%--                                        problem I've been having.</div>--%>
                    <%--                                    <div class="small text-gray-500">Emily Fowler · 58m</div>--%>
                    <%--                                </div>--%>
                    <%--                            </a>--%>
                    <%--                            <a class="dropdown-item d-flex align-items-center" href="#">--%>
                    <%--                                <div class="dropdown-list-image mr-3">--%>
                    <%--                                    <img class="rounded-circle" src="img/undraw_profile_2.svg"--%>
                    <%--                                         alt="...">--%>
                    <%--                                    <div class="status-indicator"></div>--%>
                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <div class="text-truncate">I have the photos that you ordered last month, how--%>
                    <%--                                        would you like them sent to you?</div>--%>
                    <%--                                    <div class="small text-gray-500">Jae Chun · 1d</div>--%>
                    <%--                                </div>--%>
                    <%--                            </a>--%>
                    <%--                            <a class="dropdown-item d-flex align-items-center" href="#">--%>
                    <%--                                <div class="dropdown-list-image mr-3">--%>
                    <%--                                    <img class="rounded-circle" src="img/undraw_profile_3.svg"--%>
                    <%--                                         alt="...">--%>
                    <%--                                    <div class="status-indicator bg-warning"></div>--%>
                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <div class="text-truncate">Last month's report looks great, I am very happy with--%>
                    <%--                                        the progress so far, keep up the good work!</div>--%>
                    <%--                                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>--%>
                    <%--                                </div>--%>
                    <%--                            </a>--%>
                    <%--                            <a class="dropdown-item d-flex align-items-center" href="#">--%>
                    <%--                                <div class="dropdown-list-image mr-3">--%>
                    <%--                                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"--%>
                    <%--                                         alt="...">--%>
                    <%--                                    <div class="status-indicator bg-success"></div>--%>
                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone--%>
                    <%--                                        told me that people say this to all dogs, even if they aren't good...</div>--%>
                    <%--                                    <div class="small text-gray-500">Chicken the Dog · 2w</div>--%>
                    <%--                                </div>--%>
                    <%--                            </a>--%>
                    <%--                            <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>--%>
                    <%--                        </div>--%>
                    <%--                    </li>--%>

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span class="mr-2 d-none d-lg-inline text-gray-600 small">
            Welcome <%= session.getAttribute("email") %> <!-- Display "Welcome [user's email]" -->
        </span>
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" data-toggle="modal" data-target="#logoutModal">
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
                <h1 class="h3 mb-2 text-gray-800">Clinic Info</h1>
                <%--                <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.--%>
                <%--                    For more information about DataTables, please visit the <a target="_blank"--%>
                <%--                                                                               href="https://datatables.net">official DataTables documentation</a>.</p>--%>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Clinic info on patients</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Clinic ID</th>
                                    <th>Patient ID</th>
                                    <th>Age</th>
                                    <th>Gender</th>
                                    <th>Pain Type</th>
                                    <th>View Detailed Record</th>
                                    <th>Edit</th>
                                    <th>Delete</th>

                                </tr>
                                </thead>
                                <tbody id="clinicTableBody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <script>
                    $(document).ready(function () {
                        var deleteUserId; // Variable to store the user ID to be deleted

                        // Function to show the delete modal and set the user ID to be deleted
                        function showDeleteModal(userId) {
                            $('#deleteModal').modal('show');
                            deleteUserId = userId; // Set the user ID to be deleted
                        }

                        // Function to delete the user when the "Delete" button in the modal is clicked
                        function deleteConfirmedUser() {
                            // Send the delete request to the backend with the stored user ID
                            $.ajax({
                                url: 'http://localhost:8080/BackendComponents_war_exploded/api/clinic/delete/' + deleteUserId,
                                method: 'DELETE',
                                success: function(response) {
                                    // Handle successful deletion (e.g., remove the row from the table)
                                    console.log(response);
                                    // Reload the table or update it as needed
                                    // For example, you can remove the row from the table:
                                    $('#userRow_' + deleteUserId).remove();
                                    $('#deleteModal').modal('hide'); // Close the modal
                                },
                                error: function(error) {
                                    console.error('Error deleting user: ' + error);
                                    $('#deleteModal').modal('hide'); // Close the modal
                                }
                            });
                        }

                        function showClinicRecordsModal(patient) {
                            // Set values for the text fields in the "View Clinic Records" modal
                            $('#field8view').val(patient.clinic_id);
                            $('#field7view').val(patient.patient_id);
                            $('#field1view').val(patient.age);
                            $('#field6view').val(patient.sex);
                            $('#field66view').val(patient.chest_pain);
                            $('#field2view').val(patient.resting_bp);
                            $('#field3view').val(patient.cholesterol);
                            $('#field76view').val(patient.fasting_bs);
                            $('#field776view').val(patient.resting_ecg);
                            $('#field4view').val(patient.max_hr);
                            $('#field74view').val(patient.exercise_angina);
                            $('#field5view').val(patient.old_peak);
                            $('#field77view').val(patient.st_slope);

                            // Show the "View Clinic Records" modal
                            $('#viewModal').modal('show');
                        }

                        // Function to show the Edit Modal with user data
                        function showEditModal(clinic) {
                            $('#field8').val(clinic.clinic_id);
                            $('#field7').val(clinic.patient_id); // Set the email field in the Edit Modal
                            $('#field1').val(clinic.age); // Set the name field in the Edit Modal
                            $('#field6').val(clinic.sex);

                            // Show the Edit Modal
                            $('#EditModal').modal('show');
                        }

                        // Fetch user data from the backend
                        $.ajax({
                            url: 'http://localhost:8080/BackendComponents_war_exploded/api/clinic/view',
                            method: 'GET',
                            dataType: 'json',
                            success: function (data) {
                                // Clear existing table rows
                                $('#clinicTableBody').empty();

                                // Populate the table with data and add a click event handler for "Edit" buttons
                                data.forEach(function (clinic) {
                                    var row = '<tr id="userRow_' + clinic.clinic_id + '">' +
                                        '<td>' + clinic.clinic_id + '</td>' +
                                        '<td>' + clinic.patient_id + '</td>' +
                                        '<td>' + clinic.age + '</td>' +
                                        '<td>' + clinic.sex + '</td>' +
                                        '<td>' + clinic.chest_pain + '</td>' +
                                        '<td><button class="btn btn-secondary btn-sm viewButton" data-target="#viewModal" data-toggle="modal" data-id="' + clinic.clinic_id + '">View</button></td>' +
                                        '<td><button class="btn btn-secondary btn-sm editButton" data-id="' + clinic.clinic_id + '">Edit</button></td>' +
                                        '<td><button class="btn btn-danger btn-sm deleteButton" data-id="' + clinic.clinic_id + '">Delete</button></td>' +
                                        '</tr>';
                                    $('#clinicTableBody').append(row);
                                });

                                $('.viewButton').click(function() {
                                  var id = $(this).data('id');
                                  var clinic = data.find(p => p.clinic_id === id);
                                  if (clinic) {
                                    showClinicRecordsModal(clinic);
                                  }
                                });

                                // Add a click event handler for the "Delete" buttons
                                $('.deleteButton').click(function() {
                                    var id = $(this).data('id');
                                    if (confirm('Are you sure you want to delete this user?')) {
                                        deleteUserId = id;
                                        deleteConfirmedUser();
                                    }
                                });

                                // Add a click event handler for the "Edit" buttons
                                $('.editButton').click(function () {
                                    var id = $(this).data('id');
                                    var clinic = data.find(p => p.clinic_id === id); // Find the user data for the given ID
                                    if (clinic) {
                                        showEditModal(clinic); // Show the Edit Modal with user data
                                    }
                                });
                            },
                            error: function (error) {
                                console.log('Error fetching data: ' + error);
                            }
                        });
                    });
                </script>

            </div>
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

<!-- edit clinic data Modal-->
<div class="modal fade" id="EditModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabelAddClinicData"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabelAddClinicData">Edit Record</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/clinic-edit" method="post">
                    <!-- Text Fields -->
                    <div class="form-group">
                        <label for="field8">Clinic ID:</label>
                        <input type="text" class="form-control" id="field8" name="cid" required>
                    </div>
                    <div class="form-group">
                        <label for="field7">Patient ID:</label>
                        <input type="text" class="form-control" id="field7" name="pid" required>
                    </div>
                    <div class="form-group">
                        <label for="field1">Age:</label>
                        <input type="text" class="form-control" id="field1" name="age" required>
                    </div>
                    <div class="form-group">
                        <label for="field6">Sex:</label>
                        <input type="text" class="form-control" id="field6" name="sex" required>
                    </div>
                    <div class="form-group">
                        <label for="spinner2">Chest Pain Type:</label>
                        <label for="spinner2">ASY:Asymptomatic / ATA:Atypical Angina / NAP:Non-Anginal pain / TA:Typical
                            Angina</label>
                        <select class="form-control" id="spinner2" name="pain_type">
                            <option value="ASY">ASY</option>
                            <option value="ATA">ATA</option>
                            <option value="NAP">NAP</option>
                            <option value="TA">TA</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="field2">Resting BP:</label>
                        <input type="text" class="form-control" id="field2" name="resting_bp" required
                               oninput="validateNumericInput(this)">
                    </div>
                    <div class="form-group">
                        <label for="field3">Cholesterol:</label>
                        <input type="text" class="form-control" id="field3" name="cholesterol" required
                               oninput="validateNumericInput(this)">
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
                        <label for="spinner4">LVH: Shoving Probable or definite left ventricular hypertrophy /
                            Normal:Normal / ST:Having ST-T Wave abnormality</label>
                        <select class="form-control" id="spinner4" name="resting_ecg">
                            <option value="LVH">LVH</option>
                            <option value="Normal">Normal</option>
                            <option value="ST">ST</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="field4">Max HR:</label>
                        <input type="text" class="form-control" id="field4" name="max_hr" required
                               oninput="validateNumericInput(this)">
                    </div>
                    <div class="form-group">
                        <label for="spinner5">Exercise Angina:</label>
                        <label for="spinner5">N:No / Y:Yes</label>
                        <select class="form-control" id="spinner5" name="exercise_angina">
                            <option value="N">N</option>
                            <option value="Y">Y</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="field5">Old peak:</label>
                        <input type="text" class="form-control" id="field5" name="oldpeak" required
                               oninput="validateDecimalInput(this)">
                    </div>
                    <div class="form-group">
                        <label for="spinner6">ST Slope:</label>
                        <label for="spinner6">Down:Downsloping / Flat:Flat / Up:Upsloping</label>
                        <select class="form-control" id="spinner6" name="st_slope">
                            <option value="Down">Down</option>
                            <option value="Flat">Flat</option>
                            <option value="Up">Up</option>
                        </select>
                    </div>

                    <!-- Submit Button -->
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <button class="btn btn-primary" id="confirmAdd" type="submit">Add</button>
                    </div>
                    <script>
                        $(document).ready(function () {
                            // Disable the "Id" input field for editing
                            $('#field7').prop('readonly', true);
                            $('#field1').prop('readonly', true);
                            $('#field6').prop('readonly', true);
                            $('#field8').prop('readonly', true);
                        });

                        function validateNumericInput(inputElement) {
                            // Remove any non-numeric characters
                            inputElement.value = inputElement.value.replace(/[^0-9]/g, '');
                        }

                        function validateDecimalInput(inputElement) {
                            // Remove any non-numeric and non-decimal characters
                            inputElement.value = inputElement.value.replace(/[^0-9.]/g, '');
                        }
                    </script>
                </form>


            </div>

        </div>
    </div>
</div>


<!-- view clinic data Modal-->
<div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="viewClinicaldata" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="viewClinicaldata">View Record</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Text Fields -->
                <div class="form-group">
                    <label for="field8">Clinic ID:</label>
                    <input type="text" class="form-control" id="field8view" name="cid" required>
                </div>
                <div class="form-group">
                    <label for="field7">Patient ID:</label>
                    <input type="text" class="form-control" id="field7view" name="pid" required>
                </div>
                <div class="form-group">
                    <label for="field1">Age:</label>
                    <input type="text" class="form-control" id="field1view" name="age" required>
                </div>
                <div class="form-group">
                    <label for="field6">Sex:</label>
                    <input type="text" class="form-control" id="field6view" name="sex" required>
                </div>
                <div class="form-group">
                    <label for="spinner2">Chest Pain Type:</label>
                    <label for="spinner2">ASY:Asymptomatic / ATA:Atypical Angina / NAP:Non-Anginal pain / TA:Typical Angina</label>
                    <input type="text" class="form-control" id="field66view" name="paintype" required>
                </div>
                <div class="form-group">
                    <label for="field2">Resting BP:</label>
                    <input type="text" class="form-control" id="field2view" name="resting_bp" required oninput="validateNumericInput(this)">
                </div>
                <div class="form-group">
                    <label for="field3">Cholesterol:</label>
                    <input type="text" class="form-control" id="field3view" name="cholesterol" required oninput="validateNumericInput(this)">
                </div>
                <div class="form-group">
                    <label for="spinner3">Fasting BS:</label>
                    <label for="spinner3">1:if FastingBS > 120 mg/dl / 0:Otherwise</label>
                    <input type="text" class="form-control" id="field76view" name="fastingbs" required>
                </div>
                <div class="form-group">
                    <label for="spinner4">Resting ECG:</label>
                    <label for="spinner4">LVH: Shoving Probable or definite left ventricular hypertrophy / Normal:Normal / ST:Having ST-T Wave abnormality</label>
                    <input type="text" class="form-control" id="field776view" name="restingecg" required>
                </div>
                <div class="form-group">
                    <label for="field4">Max HR:</label>
                    <input type="text" class="form-control" id="field4view" name="max_hr" required oninput="validateNumericInput(this)">
                </div>
                <div class="form-group">
                    <label for="spinner5">Exercise Angina:</label>
                    <label for="spinner5">N:No / Y:Yes</label>
                    <input type="text" class="form-control" id="field74view" name="exerciseangina" required>
                </div>
                <div class="form-group">
                    <label for="field5">Old peak:</label>
                    <input type="text" class="form-control" id="field5view" name="oldpeak" required oninput="validateDecimalInput(this)">
                </div>
                <div class="form-group">
                    <label for="spinner6">ST Slope:</label>
                    <label for="spinner6">Down:Downsloping / Flat:Flat / Up:Upsloping</label>
                    <input type="text" class="form-control" id="field77view" name="stslope" required>
                </div>

                <!-- Submit Button -->
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <button class="btn btn-primary" id="checkdisease" type="button">Check</button>
                </div>
                <div id="prediction-result">
                    <!-- The prediction result will be displayed here -->
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Disable all input fields in the modal
    $('#field7view, #field1view, #field6view, #field8view, #field66view, #field2view, #field3view, #field76view, #field776view, #field4view, #field74view, #field5view, #field77view').prop('readonly', true);

    // JavaScript for handling the prediction request and displaying the result
    document.addEventListener("DOMContentLoaded", function () {
        const predictionResultDiv = document.getElementById("prediction-result");
        const checkButton = document.getElementById("checkdisease");

        function convertValuesForPrediction() {
            // Map the values for sex
            const sexSelection = document.getElementById("field6view").value;
            const sexMap = {
                "Male": 1,
                "Female": 0
            };
            const sex = sexMap[sexSelection] || 0; // Default to 0 if not found in the map

            // Map the values for chest pain type
            const chestPainSelection = document.getElementById("field66view").value;
            const chestPainMap = {
                "ATA": 1,
                "NAP": 2,
                "ASY": 0,
                "TA": 3
            };
            const chestPainType = chestPainMap[chestPainSelection] || 0;

            // Map the values for Resting ECG
            const restingEcgSelection = document.getElementById("field776view").value;
            const restingEcgMap = {
                "Normal": 1,
                "ST": 2,
                "LVH": 0
            };
            const restingEcg = restingEcgMap[restingEcgSelection] || 0;

            // Map the values for Exercise Angina
            const exerciseAnginaSelection = document.getElementById("field74view").value;
            const exerciseAnginaMap = {
                "N": 0,
                "Y": 1
            };
            const exerciseAngina = exerciseAnginaMap[exerciseAnginaSelection] || 0;

            // Map the values for St Slope
            const stSlopeSelection = document.getElementById("field77view").value;
            const stSlopeMap = {
                "UP": 2,
                "Flat": 1,
                "Down": 0
            };
            const stSlope = stSlopeMap[stSlopeSelection] || 0;

            const data = {
                age: parseInt(document.getElementById("field1view").value),
                sex_selection: sex,
                pain_type: chestPainType,
                resting_bp: parseInt(document.getElementById("field2view").value),
                cholesterol: parseInt(document.getElementById("field3view").value),
                fasting_bs: parseInt(document.getElementById("field76view").value),
                resting_ecg: restingEcg,
                max_hr: parseInt(document.getElementById("field4view").value),
                exercise_angina: exerciseAngina,
                oldpeak: parseInt(document.getElementById("field5view").value),
                st_slope: stSlope
            };
            return data;
        }

        checkButton.addEventListener("click", function () {
            const data = convertValuesForPrediction();

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
                    if (data.result !== undefined) {
                        // Format the probability to two decimal points
                        const formattedProbability = data.probability_positive.toFixed(2);

                        // Display the prediction result and probability
                        predictionResultDiv.textContent = "Prediction Result: " + data.result + " (Probability: " + formattedProbability + "%)";
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

<%--<div class="modal fade" id="EditModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelEdit"--%>
<%--     aria-hidden="true">--%>
<%--  <div class="modal-dialog" role="document">--%>
<%--    <div class="modal-content">--%>
<%--      <div class="modal-header">--%>
<%--        <h5 class="modal-title" id="exampleModalLabelEdit">Edit Record</h5>--%>
<%--        <button class="close" type="button" data-dismiss="modal" aria-label="Close">--%>
<%--          <span aria-hidden="true">×</span>--%>
<%--        </button>--%>
<%--      </div>--%>
<%--      <div class="modal-body">--%>
<%--        <form action="${pageContext.request.contextPath}/patient-edit" method="post">--%>
<%--          <!-- Text Fields -->--%>
<%--          <div class="form-group">--%>
<%--            <label for="field5edit">Id:</label>--%>
<%--            <input type="text" class="form-control" id="field5edit" name="idedit" required>--%>
<%--          </div>--%>
<%--          <div class="form-group">--%>
<%--            <label for="field1edit">Name:</label>--%>
<%--            <input type="text" class="form-control" id="field1edit" name="nameedit" required>--%>
<%--          </div>--%>
<%--          <div class="form-group">--%>
<%--            <label for="field4edit">Address:</label>--%>
<%--            <input type="text" class="form-control" id="field4edit" name="addressedit" required>--%>
<%--          </div>--%>
<%--          <div class="form-group">--%>
<%--            <label for="field6edit">Telephone:</label>--%>
<%--            <input type="text" class="form-control" id="field6edit" name="telephoneedit" required oninput="validateInput(this)">--%>
<%--          </div>--%>

<%--          <!-- Submit Button -->--%>
<%--          <div class="modal-footer">--%>
<%--            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>--%>
<%--            <button class="btn btn-primary" id="confirmEdit" type="submit">Update</button>--%>
<%--          </div>--%>
<%--          <script>--%>
<%--            $(document).ready(function() {--%>
<%--              // Disable the "Id" input field for editing--%>
<%--              $('#field5edit').prop('readonly', true);--%>
<%--            });--%>
<%--            function validateInput(inputElement) {--%>
<%--              // Remove any non-numeric characters--%>
<%--              inputElement.value = inputElement.value.replace(/[^0-9]/g, '');--%>
<%--            }--%>
<%--          </script>--%>
<%--        </form>--%>

<%--      </div>--%>

<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>

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

<%--<!-- Page level plugins -->--%>
<%--<script src="CSS/vendor/datatables/jquery.dataTables.min.js"></script>--%>
<%--<script src="CSS/vendor/datatables/dataTables.bootstrap4.min.js"></script>--%>

<%--<!-- Page level custom scripts -->--%>
<%--<script src="js/demo/datatables-demo.js"></script>--%>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Get the user's email from the session storage
        var sessionEmail = '<%= session.getAttribute("email") %>'; // Use "email" instead of "userEmail"

        // Get the "Add New User" link
        var addNewUserLink = document.querySelector('a[href="AddNewUser.jsp"]');

        if (sessionEmail !== "admin@admin") {
            // If the session email is not "admin@admin," disable the link
            addNewUserLink.classList.add("disabled");
            addNewUserLink.addEventListener("click", function (e) {
                e.preventDefault(); // Prevent the link from navigating
                alert("You are not authorized to access this page.");
            });
        }
    });
</script>


</body>

</html>
