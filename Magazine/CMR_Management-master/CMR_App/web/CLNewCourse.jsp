<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta charset="viewport" content="width=device-width, initial-scale=1.0">
        <title>Course Leader</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <!--header -->
        <nav class="navbar navbar-inverse navbar-static-top " role="navigation">
            <div class="container-fluid">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-EV-navbar-collapse-1">

                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <div class="navbar-header navbar-inverse">
                    <a class="navbar-brand" href="index.html">Group5</a>
                </div>

                <div class="collapse navbar-collapse navbar-right" id="bs-EV-navbar-collapse-1">

                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="index.html">
                                <span class="glyphicon glyphicon-home" style="color:white;"></span>
                                Home</a>
                        </li>

                        <li>
                            <a href="#">School</a>
                        </li>
                        <li>
                            <a href="#">Services</a>
                        </li>
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> ${cmrUsers.getUserName()}</a></li>
                        <li><a href="index.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--end ofheader -->
        <!--main content-->
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="col-md-8">
                        <h3>Interaction Design</h3>
                        <h5>Start time: 01-01-2016</h5>
                        <h5>End time: 01-03-2016</h5>
                        <h5>Course leader: John</h5>
                        <a href="AddNewCMR.jsp">
                            <button type="button" class="btn btn-default" id="contactbtn">>> Go</button>
                        </a>                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="col-md-8">
                        <h3>Database Engineering</h3>
                        <h5>Start time: 01-01-2016</h5>
                        <h5>End time: 01-03-2016</h5>
                        <h5>Course leader: John</h5>
                        <a href="AddNewCMR.jsp">
                            <button type="button" class="btn btn-default" id="contactbtn">>> Go</button>
                        </a>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="col-md-8">
                        <h3>Enterprise Web Software Development</h3>
                        <h5>Start time: 01-01-2016</h5>
                        <h5>End time: 01-03-2016</h5>
                        <h5>Course leader: John</h5>
                        <a href="AddNewCMR.jsp">
                            <button type="button" class="btn btn-default" id="contactbtn">>> Go</button>
                        </a>                    </div>
                </div>
            </div>
        </div>
        <!--end of main content-->
        <!--footer-->
        <footer class="site-footer">
            <div class="container">

                <div class="bottom-footer">
                    <div class="col-md-5">&copy Copyright of Group 5</div>
                </div>
            </div>
        </footer>
        <!--end of footer-->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
