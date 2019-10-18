<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<jsp:include page="Adminhomepage.jsp" />
<br><br><br><br>
<div align="center">
<form action="DTHServlet" method="get">
<table>
<h4> To view the package details choose one of the option mentioned below</h4>
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
<td> <input type="hidden" name="register" value="readPackage"></td>
</tr>

</table>
</form>

<h4> OR </h4>
<form action="DTHServlet" method="get">
<fieldset style="width:700px;height:200px">
<table>

<input type ="submit" value="Show all packages">
<input type="hidden" name="register" value="readAllChannelPackage">
</td>
</tr>


</form>
</div>
</body>
</html>