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
<fieldset style="width:500px;height:260px">
<form action="updatePackageForm.jsp" method="get">
<table>
<h4>To Update channel packages, Enter the Package ID</h4>
<tr>
<td>Package Id </td>
<td><input type="text" name="updatePackageId"></td>
</tr>
<tr>
<td></td>
<td><input type="submit"></td>

</tr>
</table>

</form>
</fieldset>
</div>
</body>
</html>
</html>