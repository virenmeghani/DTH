<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Channel Packages</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>
</head>

<body>
<jsp:include page="Adminhomepage.jsp" />
<br><br><br><br>
<div align="center">
<form action="DTHServlet" method="get">
<fieldset style="width:700px;height:550px">
<table>
<h4> Create Package </h4>

<tr>
<td>
Provide Package Id
</td>
<td>
<input type="text" name="packageId">
</td>
</tr>




<tr>
<td>
Provide Package Name
</td>
<td>
<input type="text" name="packageName">
</td>
</tr>

<tr>
<td>
Define Category
</td>
<td>
<input type="text" name="packageCategory">
</td>
</tr>

<tr>
<td>
Define Type(paid or FTA)
</td>
<td>
<input type="text" name="packageType">
</td>
</tr>

<tr>
<td>
Define Transmission
</td>
<td>
<input type="text" name="packageTransmission">
</td>
</tr>

<tr>
<td>
Package cost
</td>
<td>
<input type="text" name="packageCost">
</td>
</tr>

<tr>
<td>
Package Start Date
</td>
<td>
<input type="text" name="packageStartDate">
</td>
</tr>

<tr>
<td>
Package end Date
</td>
<td>
<input type="text" name="packageEndDate">
</td>
</tr>

<tr>
<td>
Paid or unpaid
</td>
<td>
<input type="text" name="packageAccess">
</td>
</tr>

<tr>
<td></td>
<td>
<input type ="submit" name="submit">
<input type="hidden" name="register" value="createChannelPackage">
<input type ="reset" name="resetChannelPackage">
</td>
</tr>

<tr>
<td></td>
<td>
<a href = "updatePackage.jsp"> Update Channel Package</a>
</td>
</tr>

<tr>
<td></td>
<td>
<a href = "deletePackage.jsp"> Delete Package</a>
</td>
</tr>

<tr>
<td></td>
<td>
<a href = "readPackage.jsp"> View all available Package</a>
</td>
</tr>





</table>

</fieldset>

</form>
</div>

</body>
</html>