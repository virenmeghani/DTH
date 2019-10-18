<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "oracle.jdbc.driver.OracleDriver";
String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";
String username = "system";
String pass = "12345";

try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
PreparedStatement statement = null;
ResultSet resultSet = null;
%>
<html>
<head>
<script type="text/javascript">
function checker(){
	var id = document.forms["inpForm"]["id"];               
    var stype = document.forms["inpForm"]["stype"];    
    var price = document.forms["inpForm"]["price"];  
    var icharge =  document.forms["inpForm"]["icharge"];  
    var ucharge = document.forms["inpForm"]["ucharge"];  
    var discount = document.forms["inpForm"]["discount"]; 
    var btype =  document.forms["inpForm"]["btype"];  
    var deposit = document.forms["inpForm"]["deposit"];  
    var length = document.forms["inpForm"]["length"]; 
    var breadth = document.forms["inpForm"]["breadth"];  
    var width = document.forms["inpForm"]["width"];
    
    
    if (id.value == "" || stype.value == "" || price.value == "" || icharge.value == ""
    	|| ucharge.value == "" || deposit.value == "" || discount.value == "" || btype.value == "" 
		|| length.value == "" || breadth.value == ""|| width.value == ""){
	window.alert("Blank fields not accepted"); 
    return false;
	}
    
    var str_patt = new RegExp("[A-z]");
    
    if ( (str_patt.test(id.value)==true) || (str_patt.test(price.value)==true ) 
    		|| (str_patt.test(icharge.value)==true ) || (str_patt.test(ucharge.value)==true )
    		|| (str_patt.test(discount.value)==true || (str_patt.test(deposit.value)==true) ||
    		(str_patt.test(length.value)==true ) || (str_patt.test(breadth.value)==true ) || 
    		(str_patt.test(width.value)==true )		) ){
        window.alert("String not accepted in the field"); 
        return false;
    }
}
</script>
</head>
<body>
<h3 align="center">Update below</h3>
<div align="center">
<table border="1">

<%
try{
connection = DriverManager.getConnection(connectionUrl, username, pass);
String sql ="select * from stb where stb_id="+id+"";
statement=connection.prepareStatement(sql);

resultSet = statement.executeQuery();
while(resultSet.next()){
%>
<jsp:include page="Adminhomepage.jsp" />
<br><br><br><br>
<form action="DTHServlet" method="get" onSubmit="return checker()" name="inpForm">

<tr>
<td>
ID</td><td><input type="text" name="id" value="<%=resultSet.getInt(1) %>"></td></tr>
<tr><td>Type</td><td><input type="text" name="stype" value="<%=resultSet.getString(2) %>"></td></tr>
<tr><td>Price</td><td><input type="text" name="price" value="<%=resultSet.getDouble(3) %>"></td></tr>
<tr><td>Installation Charge</td><td><input type="text" name="icharge" value="<%=resultSet.getDouble(4) %>"></td></tr>
<tr><td>Upgradation Charge</td><td><input type="text" name="ucharge" value="<%=resultSet.getDouble(5) %>"></td></tr>
<tr><td>Discount number</td><td><input type="text" name="discount" value="<%=resultSet.getDouble(6) %>"></td></tr>
<tr><td>Billing type</td><td><input type="text" name="btype" value="<%=resultSet.getString(7) %>"></td></tr>
<tr><td>Deposit</td><td><input type="text" name="deposit" value="<%=resultSet.getDouble(8) %>"></td></tr>
<tr><td>Length</td><td><input type="text" name="length" value="<%=resultSet.getDouble(9) %>"></td></tr>
<tr><td>Breadth</td><td><input type="text" name="breadth" value="<%=resultSet.getDouble(10) %>"></td></tr>
<tr><td>Width</td><td><input type="text" name="width" value="<%=resultSet.getDouble(11) %>"></td></tr>
<input type="hidden" name="register" value="update" >
<td></td>
<td><input type="submit" value="Update">
</td>
</form></div>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>