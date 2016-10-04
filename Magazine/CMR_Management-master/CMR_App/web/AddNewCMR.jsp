<%-- 
    Document   : AddNewCMR
    Created on : 10-Mar-2016, 08:16:38
    Author     : Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta charset="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <title>Add New CMR</title>
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

        <!--end of header -->
        <!--main content-->

        <form action="cmr" method="post">
            <div class="container">
                <div class="card">
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">Course Monitoring Report</div>
                            <div class="panel-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <tr class="active"></tr>
                                        <tr class="success">
                                            <td class="active">Academic Session</td>
                                            <td><input type="text" class="form-control" name="txtAcademicSession" placeholder="CMR Name" value="Academic Session Test"
                                                       required data-validation-required-message="Please Enter Academic Session"/></td>
                                        </tr>
                                        <tr class="success">
                                            <td class="success">Course Code + tittle</td>
                                            <td><input type="text" class="form-control" name="txtCourse_id" placeholder="comp_[Course_Number]" value="comp_1661"
                                                       required data-validation-required-message="Please enter CourseID"/></td>
                                        </tr>
                                        <tr class="success">
                                            <td class="success">Course Leader</td>
                                            <td><input type="text" class="form-control" name="txtCl_id" placeholder="cl001" value="cl001"
                                                       required data-validation-required-message="Please enter Course Leader Name"/></td>
                                        </tr>
                                        <tr class="success">
                                            <td class="success">Student Count</td>
                                            <td><input type="text" class="form-control" name="txtStudentCount" placeholder="25" value="25"
                                                       required data-validation-required-message="Please enter Student count Number"/></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">Statistical Data</div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <tr>
                                            <td class="success"></td>
                                            <td class="success">Cw1</td>
                                            <td class="success">CW2</td>
                                            <td class="success">Exam</td>
                                            <td class="success">Overall</td>
                                        </tr>
                                        <tr>
                                            <td class="success">Mean</td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txtMeanCW1" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txtMeanCW2" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txtMeanExam" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txtMeanOverall" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="success">Median</td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txtMedianCW1" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txtMedianCW2" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txtMedianExam" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txtMedianOverall" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="success">Standard Deviation</td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txtSDCW1" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txtSDCW2" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txtSDExam" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txtSDOverall" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="container">
                <div class="row">
                    <div class="container">
                        <div class="panel panel-default">
                            <div class="panel-heading">Grade Distribution</div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <tr>
                                            <td class="success"></td>
                                            <td class="success">0-39</td>
                                            <td class="success">40-69</td>
                                            <td class="success">70-89</td>
                                            <td class="success">90+</td>
                                        </tr>
                                        <tr>
                                            <td class="success">CW1</td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txt0_39CW1" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txt0_39CW2" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txt0_39Exam" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txt0_39Overall" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="success">CW2</td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txt40_69CW1" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txt40_69CW2" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txt40_69Exam" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txt40_69Overall" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="success">EX</td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txt70_89CW1" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txt70_89CW2" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txt70_89Exam" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txt70_89Overall" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="success">Overral</td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txt90_CW1" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txt90_CW2" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txt90_Exam" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                            <td class="success">
                                                <input type="text" class="form-control" name="txt90_Overall" placeholder="12" value="12"
                                                       required data-validation-required-message="Please enter Number"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button name="act" value="btnAddCMR" class="btn btn-primary" id="contactbtn">Submit</button>
                <c:if test="${!empty(msgBlue)}" >
                    <p style="color:blue;">${msgBlue}</p>
                </c:if>
                <c:if test="${!empty(msgR)}" >
                    <p style="color:red;">${msgR}</p>
                </c:if>
            </div>
        </form>
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
        <script src="js/jqBootstrapValidation.js"></script>
    </body>
</html>
