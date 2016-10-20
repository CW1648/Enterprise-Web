<%-- 
    Document   : MC_viewAllCon
    Created on : Oct 20, 2016, 7:39:56 PM
    Author     : BUIVUHUECHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FPT Greenwich | Marketing Coordinator</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- fullCalendar 2.2.5-->
  <link rel="stylesheet" href="plugins/fullcalendar/fullcalendar.min.css">
  <link rel="stylesheet" href="plugins/fullcalendar/fullcalendar.print.css" media="print">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <div class="wrapper">

      <header class="main-header">
          <!-- Logo -->
          <a href="MC_index.html" class="logo">
              <!-- mini logo for sidebar mini 50x50 pixels -->
              <span class="logo-mini"><b>F</b>GR</span>
              <!-- logo for regular state and mobile devices -->
              <span class="logo-lg"><b>FPT</b> Greenwich</span>
          </a>
          <!-- Header Navbar: style can be found in header.less -->
          <nav class="navbar navbar-static-top">
              <!-- Sidebar toggle button-->
              <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                  <span class="sr-only">Toggle navigation</span>
              </a>

              <div class="navbar-custom-menu">
                  <ul class="nav navbar-nav">
                      <!-- User Account: style can be found in dropdown.less -->
                      <li class="dropdown user user-menu">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                              <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                              <span class="hidden-xs">Ryserg Tung</span>
                          </a>
                          <ul class="dropdown-menu">
                              <!-- User image -->
                              <li class="user-header">
                                  <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                  <p>
                                      Ryserg Tung
                                      <br />
                                      <span>Marketing Coordinator</span>
                                  </p>
                              </li>
                              <!-- Menu Footer-->
                              <li class="user-footer">
                                  <div class="pull-left">
                                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                                  </div>
                                  <div class="pull-right">
                                      <a href="#" class="btn btn-default btn-flat">Sign out</a>
                                  </div>
                              </li>
                          </ul>
                      </li>
                  </ul>
              </div>
          </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
          <!-- sidebar: style can be found in sidebar.less -->
          <section class="sidebar">
              <!-- Sidebar user panel -->
              <div class="user-panel">
                  <div class="pull-left image">
                      <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                  </div>
                  <div class="pull-left info">
                      <p>Ryserg Tung</p>
                      <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                  </div>
              </div>
              <!-- search form -->
              <form action="#" method="get" class="sidebar-form">
                  <div class="input-group">
                      <input type="text" name="q" class="form-control" placeholder="Search...">
                      <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
                  </div>
              </form>
              <!-- /.search form -->
              <!-- sidebar menu: : style can be found in sidebar.less -->
              <ul class="sidebar-menu">
                  <li class="header">MAIN NAVIGATION</li>
                  <li class="treeview">
                      <a href="#">
                          <i class="fa fa-laptop"></i>
                          <span>Faculties</span>
                          <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                      </a>
                      <ul class="treeview-menu">
                          <li><a href="MC_viewAllFaculties.html"><i class="fa fa-circle-o"></i> View All Faculties</a></li>
                      </ul>
                  </li>
              </ul>
          </section>
          <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>Dashboard<small>Control panel</small></h1>
          <ol class="breadcrumb">
            <li><a href="MC_index.html"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="MC_viewAllFaculties.html"><i class="fa fa-laptop"></i> Faculties</a></li>
            <li class="active">View Contributions</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-md-3">
              <a href="MC_viewAllFaculties.html" class="btn btn-primary btn-block margin-bottom">Back to View All Faculties</a>

              <div class="box box-solid">
                <div class="box-header with-border">
                  <h3 class="box-title">Folders</h3>

                  <div class="box-tools">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                  </div>
                </div>
                <div class="box-body no-padding">
                  <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="#"><i class="fa fa-inbox"></i> Inbox</a></li>
                  </ul>
                </div>
                <!-- /.box-body -->
              </div>
              <!-- /. box -->
            </div>
            <!-- /.col -->
            <div class="col-md-9">
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Inbox</h3>

                  <div class="box-tools pull-right">
                    <div class="has-feedback">
                      <input type="text" class="form-control input-sm" placeholder="Search Mail">
                      <span class="glyphicon glyphicon-search form-control-feedback"></span>
                    </div>
                  </div>
                  <!-- /.box-tools -->
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                  <div class="mailbox-controls">
                    <!-- Check all button -->
                    <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i>
                    </button>
                    <div class="btn-group">
                      <button type="button" class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
                    </div>
                    <!-- /.btn-group -->
                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                    <div class="pull-right">
                      1-50/200
                      <div class="btn-group">
                        <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                        <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
                      </div>
                      <!-- /.btn-group -->
                    </div>
                    <!-- /.pull-right -->
                  </div>
                  <div class="table-responsive mailbox-messages">
                    <table class="table table-hover table-striped">
                      <tbody>
                        <tr>
                          <td>
                            <input type="checkbox">
                          </td>
                          <td class="mailbox-name"><a href="MC_viewCon.html">Ryserg Tung</a></td>
                          <td class="mailbox-subject">Contribution's Title
                          </td>
                          <td class="mailbox-attachment"></td>
                          <td class="mailbox-date">09/23/2016</td>
                          <td class="mailbox-status">Approved</td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox">
                          </td>
                          <td class="mailbox-name"><a href="MC_viewCon.html">Ryserg Tung</a></td>
                          <td class="mailbox-subject">Contribution's Title
                          </td>
                          <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                          <td class="mailbox-date">09/23/2016</td>
                          <td class="mailbox-status">Approved</td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox">
                          </td>
                          <td class="mailbox-name"><a href="MC_viewCon.html">Ryserg Tung</a></td>
                          <td class="mailbox-subject">Contribution's Title
                          </td>
                          <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                          <td class="mailbox-date">09/23/2016</td>
                          <td class="mailbox-status">Approved</td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox">
                          </td>
                          <td class="mailbox-name"><a href="MC_viewCon.html">Ryserg Tung</a></td>
                          <td class="mailbox-subject">Contribution's Title
                          </td>
                          <td class="mailbox-attachment"></td>
                          <td class="mailbox-date">09/23/2016</td>
                          <td class="mailbox-status">Approved</td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox">
                          </td>
                          <td class="mailbox-name"><a href="MC_viewCon.html">Ryserg Tung</a></td>
                          <td class="mailbox-subject">Contribution's Title
                          </td>
                          <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                          <td class="mailbox-date">09/23/2016</td>
                          <td class="mailbox-status">Approved</td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox">
                          </td>
                          <td class="mailbox-name"><a href="MC_viewCon.html">Ryserg Tung</a></td>
                          <td class="mailbox-subject">Contribution's Title
                          </td>
                          <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                          <td class="mailbox-date">09/23/2016</td>
                          <td class="mailbox-status">Approved</td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox">
                          </td>
                          <td class="mailbox-name"><a href="MC_viewCon.html">Ryserg Tung</a></td>
                          <td class="mailbox-subject">Contribution's Title
                          </td>
                          <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                          <td class="mailbox-date">09/23/2016</td>
                          <td class="mailbox-status">Approved</td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox">
                          </td>

                          <td class="mailbox-name"><a href="MC_viewCon.html">Ryserg Tung</a></td>
                          <td class="mailbox-subject">Contribution's Title
                          </td>
                          <td class="mailbox-attachment"></td>
                          <td class="mailbox-date">09/23/2016</td>
                          <td class="mailbox-status">Approved</td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox">
                          </td>

                          <td class="mailbox-name"><a href="MC_viewCon.html">Ryserg Tung</a></td>
                          <td class="mailbox-subject">Contribution's Title
                          </td>
                          <td class="mailbox-attachment"></td>
                          <td class="mailbox-date">09/23/2016</td>
                          <td class="mailbox-status">Approved</td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox">
                          </td>

                          <td class="mailbox-name"><a href="MC_viewCon.html">Ryserg Tung</a></td>
                          <td class="mailbox-subject">Contribution's Title
                          </td>
                          <td class="mailbox-attachment"></td>
                          <td class="mailbox-date">09/23/2016</td>
                          <td class="mailbox-status">Approved</td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox">
                          </td>

                          <td class="mailbox-name"><a href="MC_viewCon.html">Ryserg Tung</a></td>
                          <td class="mailbox-subject">Contribution's Title
                          </td>
                          <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                          <td class="mailbox-date">09/23/2016</td>
                          <td class="mailbox-status">Approved</td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox">
                          </td>

                          <td class="mailbox-name"><a href="MC_viewCon.html">Ryserg Tung</a></td>
                          <td class="mailbox-subject">Contribution's Title
                          </td>
                          <td class="mailbox-attachment"></td>
                          <td class="mailbox-date">09/23/2016</td>
                          <td class="mailbox-status">Approved</td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox">
                          </td>

                          <td class="mailbox-name"><a href="MC_viewCon.html">Ryserg Tung</a></td>
                          <td class="mailbox-subject">Contribution's Title
                          </td>
                          <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                          <td class="mailbox-date">09/23/2016</td>
                          <td class="mailbox-status">Approved</td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox">
                          </td>

                          <td class="mailbox-name"><a href="MC_viewCon.html">Ryserg Tung</a></td>
                          <td class="mailbox-subject">Contribution's Title
                          </td>
                          <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                          <td class="mailbox-date">09/23/2016</td>
                          <td class="mailbox-status">Approved</td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox">
                          </td>

                          <td class="mailbox-name"><a href="MC_viewCon.html">Ryserg Tung</a></td>
                          <td class="mailbox-subject">Contribution's Title
                          </td>
                          <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                          <td class="mailbox-date">09/23/2016</td>
                          <td class="mailbox-status">Approved</td>
                        </tr>
                      </tbody>
                    </table>
                    <!-- /.table -->
                  </div>
                  <!-- /.mail-box-messages -->
                </div>
                <!-- /.box-body -->
              </div>
              <!-- /. box -->
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </section>
        <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.3.6
        </div>
        <strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
      </footer>

      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
          <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
          <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
          <!-- Home tab content -->
          <div class="tab-pane" id="control-sidebar-home-tab">
            <h3 class="control-sidebar-heading">Recent Activity</h3>
            <ul class="control-sidebar-menu">
              <li>
                <a href="javascript:void(0)">
                  <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                    <p>Will be 23 on April 24th</p>
                  </div>
                </a>
              </li>
              <li>
                <a href="javascript:void(0)">
                  <i class="menu-icon fa fa-user bg-yellow"></i>

                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                    <p>New phone +1(800)555-1234</p>
                  </div>
                </a>
              </li>
              <li>
                <a href="javascript:void(0)">
                  <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                    <p>nora@example.com</p>
                  </div>
                </a>
              </li>
              <li>
                <a href="javascript:void(0)">
                  <i class="menu-icon fa fa-file-code-o bg-green"></i>

                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                    <p>Execution time 5 seconds</p>
                  </div>
                </a>
              </li>
            </ul>
            <!-- /.control-sidebar-menu -->

            <h3 class="control-sidebar-heading">Tasks Progress</h3>
            <ul class="control-sidebar-menu">
              <li>
                <a href="javascript:void(0)">
                  <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="label label-danger pull-right">70%</span>
              </h4>

                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                  </div>
                </a>
              </li>
              <li>
                <a href="javascript:void(0)">
                  <h4 class="control-sidebar-subheading">
                Update Resume
                <span class="label label-success pull-right">95%</span>
              </h4>

                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                  </div>
                </a>
              </li>
              <li>
                <a href="javascript:void(0)">
                  <h4 class="control-sidebar-subheading">
                Laravel Integration
                <span class="label label-warning pull-right">50%</span>
              </h4>

                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                  </div>
                </a>
              </li>
              <li>
                <a href="javascript:void(0)">
                  <h4 class="control-sidebar-subheading">
                Back End Framework
                <span class="label label-primary pull-right">68%</span>
              </h4>

                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                  </div>
                </a>
              </li>
            </ul>
            <!-- /.control-sidebar-menu -->

          </div>
          <!-- /.tab-pane -->
          <!-- Stats tab content -->
          <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
          <!-- /.tab-pane -->
          <!-- Settings tab content -->
          <div class="tab-pane" id="control-sidebar-settings-tab">
            <form method="post">
              <h3 class="control-sidebar-heading">General Settings</h3>

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Report panel usage
                  <input type="checkbox" class="pull-right" checked>
                </label>

                <p>
                  Some information about this general settings option
                </p>
              </div>
              <!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Allow mail redirect
                  <input type="checkbox" class="pull-right" checked>
                </label>

                <p>
                  Other sets of options are available
                </p>
              </div>
              <!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Expose author name in posts
                  <input type="checkbox" class="pull-right" checked>
                </label>

                <p>
                  Allow the user to show his name in blog posts
                </p>
              </div>
              <!-- /.form-group -->

              <h3 class="control-sidebar-heading">Chat Settings</h3>

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Show me as online
                  <input type="checkbox" class="pull-right" checked>
                </label>
              </div>
              <!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Turn off notifications
                  <input type="checkbox" class="pull-right">
                </label>
              </div>
              <!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Delete chat history
                  <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                </label>
              </div>
              <!-- /.form-group -->
            </form>
          </div>
          <!-- /.tab-pane -->
        </div>
      </aside>
      <!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
    </div>
    <!-- ./wrapper -->

    <!-- jQuery 2.2.3 -->
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- Slimscroll -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="plugins/fastclick/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js"></script>
    <!-- iCheck -->
    <script src="plugins/iCheck/icheck.min.js"></script>
    <!-- Page Script -->
    <script>
      $(function() {
        //Enable iCheck plugin for checkboxes
        //iCheck for checkbox and radio inputs
        $('.mailbox-messages input[type="checkbox"]').iCheck({
          checkboxClass: 'icheckbox_flat-blue',
          radioClass: 'iradio_flat-blue'
        });

        //Enable check and uncheck all functionality
        $(".checkbox-toggle").click(function() {
          var clicks = $(this).data('clicks');
          if (clicks) {
            //Uncheck all checkboxes
            $(".mailbox-messages input[type='checkbox']").iCheck("uncheck");
            $(".fa", this).removeClass("fa-check-square-o").addClass('fa-square-o');
          } else {
            //Check all checkboxes
            $(".mailbox-messages input[type='checkbox']").iCheck("check");
            $(".fa", this).removeClass("fa-square-o").addClass('fa-check-square-o');
          }
          $(this).data("clicks", !clicks);
        });

        //Handle starring for glyphicon and font awesome
        $(".mailbox-star").click(function(e) {
          e.preventDefault();
          //detect type
          var $this = $(this).find("a > i");
          var glyph = $this.hasClass("glyphicon");
          var fa = $this.hasClass("fa");

          //Switch states
          if (glyph) {
            $this.toggleClass("glyphicon-star");
            $this.toggleClass("glyphicon-star-empty");
          }

          if (fa) {
            $this.toggleClass("fa-star");
            $this.toggleClass("fa-star-o");
          }
        });
      });
    </script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js"></script>
</body>

</html>
