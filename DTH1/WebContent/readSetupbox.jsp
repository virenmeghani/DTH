<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View || Set up box</title>
<script type="text/javascript">
function checker(){
	var id = document.forms["inpForm"]["id"];       
	if (id.value == ""){
		window.alert("Blank fields not accepted"); 
	    return false;
	}
	var str_patt = new RegExp("[A-z]");
    
    if ( str_patt.test(id.value)==true){
    	window.alert("String not accepted in the field"); 
        return false;
    }
	
}
</script>
</head>
<body>
<jsp:include page="Adminhomepage.jsp" />
<br><br><br>
<div align="center">
<h3>View setup box detsails</h3>
<fieldset style="width:500px;height:260px">
<form action="DTHServlet" method="get" onSubmit="return checker()" name="inpForm">
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
