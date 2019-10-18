
<!DOCTYPE html>
<html>
<head><h1 align = "center">
<style>

button-group :hover{
font-size:350;
}
</style>
ADMIN HOME PAGE
</h1>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Page title -->
    <title>DTH | Admin Home Page</title>
    <!-- Vendor styles -->
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.css" />
    <link rel="stylesheet" href="vendor/metisMenu/dist/metisMenu.css" />
    <link rel="stylesheet" href="vendor/animate.css/animate.css" />
    <link rel="stylesheet" href="vendor/bootstrap/dist/css/bootstrap.css" />

    <!-- App styles -->
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
    <link rel="stylesheet" href="styles/style.css">

</head>


<!-- Header -->
<div id="header">
    <div class="color-line">
    </div>
    <div id="logo" class="light-version">  
    </div>
 

<div class="row">
        <div class="hpanel">
            <div class="panel-body float-e-margins">
                <p>
                    Select action to perform from the drop down menu.
                </p>

                <div class="btn-group">
                    <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle">Setup box Management<span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <li><a href="create.jsp">Create Setup Box</a></li>
                        <li><a href="updateSetUpBox.jsp" class="font-bold">Update Setup Box</a></li>
                        <li><a href="readSetupbox.jsp">View Set up box</a></li>
                         <li><a href="delete_stb.jsp">Delete Setup box</a></li>

                    </ul>
                </div>
                <div class="btn-group">
                    <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle">Channel Management <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <li><a href="addChannel.jsp">Add Channel</a></li>
                        <li><a href="updateChannel.jsp" class="font-bold">Update Channel</a></li>
                        <li><a href="readSelectedChannel.jsp">View Channel</a></li>
                         <li><a href="deleteChannel.jsp">Delete Channel</a></li>
                      
                    </ul>
                </div>
                <div class="btn-group">
                    <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle">Channel Package Management <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <li><a href="package.jsp">Create Package</a></li>
                        <li><a href="updatePackage.jsp" class="font-bold">Update Package</a></li>
                        <li><a href="readPackage.jsp">View Package</a></li>
                         <li><a href="deletePackage.jsp">Delete Package</a></li>
                    </ul>
                </div>
                
                 
           </div>
         </div>
        </div>
     </div>
   </div>
</div>

<!-- Vendor scripts -->
<script src="vendor/jquery/dist/jquery.min.js"></script>
<script src="vendor/jquery-ui/jquery-ui.min.js"></script>
<script src="vendor/slimScroll/jquery.slimscroll.min.js"></script>
<script src="vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="vendor/metisMenu/dist/metisMenu.min.js"></script>
<script src="vendor/iCheck/icheck.min.js"></script>
<script src="vendor/sparkline/index.js"></script>

<!-- App scripts -->
<script src="scripts/homer.js"></script>

</body>
</html>