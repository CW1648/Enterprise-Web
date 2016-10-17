<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="no-js">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="ESWD Coursework">
  <meta name="author" content="Ryserg Tung">
  <!--<link rel="icon" href="../../favicon.ico">-->
  <title>University Portal</title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this website -->
  <link href="css/font-awesome.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">

  <!-- Custom fonts for this website -->
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">

<!--  <style>
    body {
      overflow: hidden;
    }
    /* Preloader */

    #preloader {
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background-color: black;
      /* change if the mask should have another color then white */
      z-index: 99;
      /* makes sure it stays on top */
    }

    #status {
      width: 150px;
      height: 150px;
      position: absolute;
      left: 50%;
      /* centers the loading animation horizontally one the screen */
      top: 50%;
      /* centers the loading animation vertically one the screen */
      background-image: url('images/logo1.png');
      /* path to your loading animation */
      background-repeat: no-repeat;
      background-position: center;
      background-size: 150px;
      margin: -60px 0 0 -60px;
      /* is width and height divided by two */
      -webkit-animation: spin 2s linear infinite;
      -moz-animation: spin 2s linear infinite;
      animation: spin 2s linear infinite;
    }

    @-moz-keyframes spin {
      100% {
        -moz-transform: rotate(360deg);
      }
    }

    @-webkit-keyframes spin {
      100% {
        -webkit-transform: rotate(360deg);
      }
    }

    @keyframes spin {
      100% {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }
  </style>-->
</head>

<body>
  <!-- Preloader -->
  <div id="preloader">
    <div id="status">&nbsp;</div>
  </div>

  <div class="login-container">
    <div class="wrapper">
      <div class="row loginRow">
        <img src="images/logo.png" alt="" />
        <h3>Login</h3>
         <form class="form-horizontal" id="ContactForm" method="post" action="cmr_users">
          <div class="form-group">
           <input type="text" class="form-control" id="userName" name="txtUserName" placeholder="User name"
                                                           >

          </div>
          <div class="form-group">
             <input type="password" class="form-control" id="pwd" name="txtPassword" placeholder="Password"
                                    >
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox"> Remember me
            </label>
          </div>
          <button class="btn btn-default" id="contactbtn" name="act" value="btnLogin">Login</button>
                                                    <c:if test="${!empty(msg)}" >
                                                        <p style="color:red;">${msg}</p>
                                                    </c:if>
          <a href="#">Forget password?</a>
        </form>
      </div>
    </div>
  </div>


  <!-- Bootstrap core JavaScript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="js/jquery-3.1.0.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <!-- Preloader -->
  <script type="text/javascript">
    //<![CDATA[
    $(window).on('load', function() { // makes sure the whole site is loaded
        $('#status').fadeOut(); // will first fade out the loading animation
        $('#preloader').delay(500).fadeOut('slow'); // will fade out the white DIV that covers the website.
        $('body').delay(350).css({
          'overflow': 'visible'
        });
      })
      //]]>
  </script>
</body>

</html>