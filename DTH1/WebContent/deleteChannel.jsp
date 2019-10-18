<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function checker(){
	var deleteId = document.forms["inpForm"]["deleteId"];       
	if (deleteId.value == ""){
		window.alert("Blank fields not accepted"); 
	    return false;
	}
	var str_patt = new RegExp("[A-z]");
    
    if ( str_patt.test(deleteId.value)==true){
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

<fieldset style="width:500px;height:260px">
<form action="DTHServlet" method="get" onSubmit="return checker()" name="inpForm">
<table>
<h4>Delete Channel</h4>
<tr>
<td>Enter id </td>
<td><input type="text" name="deleteId"></td>
</tr>
<tr>
<td></td>
<td><input type="submit"></td>
<input type="hidden" name="register" value="delete_channel">
</tr>
</table>

</form>
</fieldset>
</div>
</body>
</html>