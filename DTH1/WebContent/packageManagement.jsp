<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Channel Management</title>
</head>
<body> 
<div align="center">

<fieldset style="width:700px;height:250px">
<table>
<h2>Manage Channels</h2>
<a href="package.jsp">Create new package</a><br>
<a href="updatePackage.jsp">Update Channel Packages</a><br>
<a href="deletePackage.jsp"> Delete Packages</a><br>
<a href="readPackage.jsp">View Packages</a><br>

<form action="DTHServlet" method="get">
<input type="submit" value="Show all details"/>
<input type="hidden" name="register" value="readall_channel">
</form>
</table>
</fieldset>
</div>
</body>
</html>