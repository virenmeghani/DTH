<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add channel</title>
<script type="text/javascript">
function checker(){
	var stbID = document.forms["inpForm"]["stbID"];               
    var cID = document.forms["inpForm"]["cID"];    
    var cName = document.forms["inpForm"]["cName"];  
    var cBand =  document.forms["inpForm"]["cBand"];  
    var vFrequency = document.forms["inpForm"]["vFrequency"];  
    var aFrequency = document.forms["inpForm"]["aFrequency"]; 
    var cCtype =  document.forms["inpForm"]["cCtype"];  
    var ctType = document.forms["inpForm"]["ctType"];  
    var cCharge = document.forms["inpForm"]["cCharge"]; 
    
    
    if (stbID.value == "" || cID.value == "" || cName.value == "" || cBand.value == ""
		|| vFrequency.value == "" || aFrequency.value == "" 
		|| cCtype.value == "" || ctType.value == ""|| cCharge.value == ""){
	window.alert("Blank fields not accepted"); 
    return false;
	}
    
    var str_patt = new RegExp("[A-z]");
    
    if ( (str_patt.test(stbID.value)==true) || (str_patt.test(cID.value)==true ) 
    		|| (str_patt.test(vFrequency.value)==true ) || (str_patt.test(aFrequency.value)==true )
    		|| (str_patt.test(cCharge.value)==true ) ){
        window.alert("String not accepted in the field"); 
        return false;
    }
}
</script>
</head>
<body>
<jsp:include page="Adminhomepage.jsp" />
<br><br><br>
<div align="center">`
<form action="DTHServlet" method="get" onSubmit="return checker()" name="inpForm">
<fieldset style="width:700px;height:550px">
<table>
<h2>Add Channel</h2>
<tr>
<td>
Set top Box ID
</td>
<td>
<input type ="text" name="stbID">
</td>
</tr>
<tr>
<td>
Channel ID
</td>
<td>
<input type ="text" name="cID">
</td>
</tr>
<tr>
<td>
Channel Name
</td>
<td>
<input type ="text" name="cName">
</td>
</tr>
<tr>
<td>
Channel Band
</td>
<td>
<input type ="text" name="cBand">
</td>
</tr>
<tr>
<td>
Video Carrier Frequency
</td>
<td>
<input type ="text" name="vFrequency">
</td>
</tr>
<tr>
<td>
Audio Carrier Frequencey
</td>
<td>
<input type ="text" name="aFrequency">
</td>
</tr>
<tr>
<td>
Channel Charge Type
</td>
<td>
<input type ="text" name="cCtype">
</td>
</tr>
<tr>
<td>
Channel Transmission Type
</td>
<td>
<input type ="text" name="ctType">
</td>
</tr>
<tr>
<td>
Channel charge
</td>
<td>
<input type ="text" name="cCharge">
</td>
</tr>
<td></td>
<td>
<input type ="submit" name="submit">
<input type="hidden" name="register" value="create_channel">
<input type ="reset" name="reset">
</td>
</tr>
<tr>
<td></td>
<td>
</td>

</table>
</fieldset>
</form>
</div>
</body>
</body>
</html>