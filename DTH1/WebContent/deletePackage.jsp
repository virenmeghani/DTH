<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Package </title>
</head>
<body>
<jsp:include page="Adminhomepage.jsp" />
<br><br><br><br>
<div align="center">

<form action="DTHServlet" method="get">
<table>
<h4> Enter the package id you want to delete</h4>
<tr>
<td> Package Id</td>
<td> <input type="text" name="packageId"></td>
</tr>

<tr>
<td></td>
<td> <input type="submit"></td>
</tr>

<tr>
<td></td>
<td> <input type="hidden" name="register" value="deletePackage"></td>
</tr>

</table>
</form>

</body>
</html>