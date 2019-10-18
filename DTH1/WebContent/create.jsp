 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function checker(){
	var id = document.forms["inpForm"]["id"];               
    var length = document.forms["inpForm"]["length"];    
    var breadth = document.forms["inpForm"]["breadth"];  
    var width =  document.forms["inpForm"]["width"];  
    var price = document.forms["inpForm"]["price"];  
    var icharge = document.forms["inpForm"]["icharge"]; 
    var ucharge =  document.forms["inpForm"]["ucharge"];  
    var discount = document.forms["inpForm"]["discount"];  
    var deposit = document.forms["inpForm"]["deposit"]; 
    var str_patt = new RegExp("[A-z]");
    if (id.value == "" || length.value == "" || breadth.value == "" || width.value == ""
		|| price.value == "" || icharge.value == "" 
		|| ucharge.value == "" || discount.value == ""|| deposit.value == ""){
	window.alert("Blank fields not accepted"); 
    return false;
	}
    
    

    

    if (  str_patt.test(id.value)==true){
        window.alert("Check id type"); 
        return false;
    }

    if ( str_patt.test(length.value)==true){
        window.alert("Check length type"); 
        return false;
    }

    if (  str_patt.test(breadth.value)==true){
        window.alert("Check breadth type"); 
        return false;
    }

    if (  str_patt.test(width.value)==true){
        window.alert("Check length type"); 
        return false;
    }

    if (  str_patt.test(price.value)==true){
        window.alert("Check price type"); 
        return false;
    }

    if (str_patt.test(icharge.value)==true){
        window.alert("Check icharge type"); 
        return false;
    }

    if (  str_patt.test(ucharge.value)==true){
        window.alert("Check iucharge type"); 
        return false;
    }

    if ( str_patt.test(discount.value)==true){
        window.alert("Check discount type"); 
        return false;
    }

    if (  str_patt.test(deposit.value)==true){
        window.alert("Check deposit type"); 
        return false;
    }
    
    
    
      
}
</script>
</head>
<body> 
<jsp:include page="Adminhomepage.jsp" />
<br><br><br><br>
<div align="center">
<form action="DTHServlet" method="get" onSubmit="return checker()" name="inpForm">
<fieldset style="width:700px;height:800px">
<table>
<h3>Register Setup box</h3>

<tr>
<td>Setup boxtype</td>
<td><select name="type">
<option value="Standard">Standard</option>
<option value="HD">HD</option>
<option value="HD+">HD+</option>
<option value="IPTV">IPTV</option>
</select>
</tr>
<tr>
<td>
Setup box id
</td>
<td>
<input type ="text" name="id">
</td>
</tr>
<tr><td>
Setupbox features:</td>


<td>
<input type="checkbox" name="lang" value="Multilingual channel" />Multilingual channel<br>
<input type="checkbox" name="lang" value="guide" />guide<br>
<input type="checkbox" name="lang" value="genre wise"/ >genre wise<br>
<input type="checkbox" name="lang" value="channel guide"/>channel guide<br>
<input type="checkbox" name="lang" value=" live recording"/>live recording<br>
<input type="checkbox" name="lang" value="recording"/ >scheduled recording<br>
<input type="checkbox" name="lang" value="pause"/>pause and play<br>
<input type="checkbox" name="lang" value=" rewind"/>rewind/forward</td>
</tr>
<tr>
<td>
Length
</td>
<td>
<input type ="text" name="length">
</td>
</tr>
<tr>
<td>
Breadth
</td>
<td>
<input type ="text" name="breadth">
</td>
</tr>
<tr>
<td>
Width
</td>
<td>
<input type ="text" name="width">
</td>
</tr>
<tr>
<td>
Price
</td>
<td>
<input type ="text" name="price">
</td>
</tr>
<tr>
<td>
Installation charges
</td>
<td>
<input type ="text" name="icharge">
</td>
</tr>
<tr>
<td>
Upgradation charge
</td>
<td>
<input type ="text" name="ucharge">
</td>
</tr>
<tr>
<td>
Discount
</td>
<td>
<input type ="text" name="discount">
</td>
</tr>
<tr>
<td>Billing Type</td>
<td><select name="btype">
<option value="Post">Post-Paid</option>
<option value="Pre">Pre-Paid</option>
</select>
</tr>
<tr>
<td>
Refund deposit
</td>
<td>
<input type ="text" name="deposit">
</td>
</tr>
<tr><br></tr>
<tr>
<td>
Upload Inventory
</td>
<td>
 <br>
 Select a file: <input type="file" name="myFile"><br><br>
</td>
</tr>

<tr>
<td></td>
<td>
<input type ="submit" name="submit">
<input type="hidden" name="register" value="create">
<input type ="reset" name="reset">
</td>

</table>
</fieldset>
</form>
</div>
</body>
</html>