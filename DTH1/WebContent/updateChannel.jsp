<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function checker(){
	var updateId = document.forms["inpForm"]["updateId"];       
	if (updateId.value == ""){
		window.alert("Blank fields not accepted"); 
	    return false;
	}
	var str_patt = new RegExp("[A-z]");
    
    if ( str_patt.test(updateId.value)==true){
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
<h4>Update Channel</h4>
<fieldset style="width:500px;height:260px">
<form action="updatedForm.jsp" method="get" onSubmit="return checker()" name="inpForm">
<table>

<tr>
<td>Enter id </td>
<td><input type="text" name="updateId"></td>
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