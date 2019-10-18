<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View || Set up box</title>
</head>
<body>
<jsp:include page="Adminhomepage.jsp" />
<br><br><br>
<div align="center">
<h3>Delete setup box </h3>
<fieldset style="width:500px;height:260px">
<form action="DTHServlet" method="get">
<table>

<tr>
<td>Enter id </td>
<td><input type="text" name="id"></td>
</tr>
<tr>
<td></td>
<td><input type="submit"></td> 
</tr>
</table>
<input type="hidden" name="register" value="select">
</form>
<h3>OR</h3>
<form action="DTHServlet" method="get">
<input type="submit" value="Show all details"/>
<input type="hidden" name="register" value="select1">
<table>

<br>
</form>
</fieldset>
</div>
</body>
</html>
