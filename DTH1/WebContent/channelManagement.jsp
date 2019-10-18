<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<br><br><br>
<title>Channel Management</title>
</head>
<body> 
<div align="center">

<fieldset style="width:700px;height:250px">
<table>
<h2>Manage Channels</h2>
<a href="addChannel.jsp">add new channel</a><br>
<a href="updateChannel.jsp">Update channel details</a><br>
<a href="deleteChannel.jsp"> Delete channel</a><br>
<a href="readSelectedChannel.jsp">View Selected channel</a><br>

<form action="DTHServlet" method="get">
<input type="submit" value="Show all details"/>
<input type="hidden" name="register" value="readall_channel">
</form>
</table>
</fieldset>
</div>
</body>
</html>