<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("updateId");
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
	var stb_id = document.forms["inpForm"]["stb_id"];               
    var ch_id = document.forms["inpForm"]["ch_id"];    
    var ch_name = document.forms["inpForm"]["ch_name"];  
    var ch_band =  document.forms["inpForm"]["ch_band"];  
    var vFreq = document.forms["inpForm"]["vFreq"];  
    var aFreq = document.forms["inpForm"]["aFreq"]; 
    var ccType =  document.forms["inpForm"]["ccType"];  
    var ctType = document.forms["inpForm"]["ctType"];  
    var ccharge = document.forms["inpForm"]["ccharge"]; 
  
     
    if (stb_id.value == "" || ch_id.value == "" || ch_name.value == "" || ch_band.value == ""
    	|| vFreq.value == "" || aFreq.value == "" || ccType.value == "" || ctType.value == "" 
		|| ccharge.value == "" ){
	window.alert("Blank fields not accepted"); 
    return false;
	}
    
    var str_patt = new RegExp("[A-z]");
    
    if ( (str_patt.test(stb_id.value)==true) || (str_patt.test(ch_id.value)==true ) 
    		|| (str_patt.test(vFreq.value)==true ) || (str_patt.test(aFreq.value)==true )
    		|| (str_patt.test(ccharge.value)==true) ){
        window.alert("String not accepted in the field"); 
        return false;
    }
}
</script>
</head>
<body>
<div align="center">
<table border="1">

<%
try{
connection = DriverManager.getConnection(connectionUrl, username, pass);
String sql ="select * from MANAGE_CHANNELS where CH_ID="+id+"";
statement=connection.prepareStatement(sql);

resultSet = statement.executeQuery();
while(resultSet.next()){
%>
<jsp:include page="Adminhomepage.jsp" />
<br><br><br><br>
<h4>Update Channel</h4>

<form align="center"action="DTHServlet" method="get" onSubmit="return checker()" name="inpForm">
<tr>
<td>
Set Top Box ID</td><td><input type="text" name="stb_id" value="<%=resultSet.getInt(1) %>"></td></tr>
<tr><td>Channel Id</td><td><input type="text" name="ch_id" value="<%=resultSet.getInt(2) %>"></td></tr>
<tr><td>Channel Name</td><td><input type="text" name="ch_name" value="<%=resultSet.getString(3) %>"></td></tr>
<tr><td>Channel Band</td><td><input type="text" name="ch_band" value="<%=resultSet.getString(4) %>"></td></tr>
<tr><td>Video Frequency</td><td><input type="text" name="vFreq" value="<%=resultSet.getDouble(5) %>"></td></tr>
<tr><td>Audio Frequency</td><td><input type="text" name="aFreq" value="<%=resultSet.getDouble(6) %>"></td></tr>
<tr><td>Channel Charge Type</td><td><input type="text" name="ccType" value="<%=resultSet.getString(7) %>"></td></tr>
<tr><td>Channel Transmission Type</td><td><input type="text" name="ctType" value="<%=resultSet.getString(8) %>"></td></tr>
<tr><td>Channel Charge</td><td><input type="text" name="ccharge" value="<%=resultSet.getDouble(9) %>"></td></tr>

<input type="hidden" name="register" value="update_channel">
<td></td>
<td><input type="submit" value="update"></td>
</tr>
</form>
</div>
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