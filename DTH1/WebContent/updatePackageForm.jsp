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
String pkgId = request.getParameter("updatePackageId");
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
<body>
<div align="center">

<table>

<%
try{
connection = DriverManager.getConnection(connectionUrl, username, pass);
String sql ="select * from MANAGE_CHANNEL_PACKAGES where CH_PACKAGE_ID="+pkgId+"";
statement=connection.prepareStatement(sql);

resultSet = statement.executeQuery();
while(resultSet.next()){
%>

<jsp:include page="Adminhomepage.jsp" />
<br><br><br><br>
<h4>Update Package here</h4>
<form action="DTHServlet" method="get">
<tr><td>Package ID</td><td><input type="text" name="pkg_id" value="<%=resultSet.getInt(1) %>"></td></tr>
<tr><td>Channel Id</td><td><input type="text" name="ch_id" value="<%=resultSet.getInt(2) %>"></td></tr>
<tr><td>Package Name</td><td><input type="text" name="pkg_name" value="<%=resultSet.getString(3) %>"></td></tr>
<tr><td>Package Category</td><td><input type="text" name="pkg_category" value="<%=resultSet.getString(4) %>"></td></tr>
<tr><td>Package Type</td><td><input type="text" name="pkg_type" value="<%=resultSet.getString(5) %>"></td></tr>
<tr><td>Package transmission</td><td><input type="text" name="pkg_trans" value="<%=resultSet.getString(6) %>"></td></tr>
<tr><td>Package cost</td><td><input type="text" name="pkg_cost" value="<%=resultSet.getDouble(7) %>"></td></tr>
<tr><td>Package Start Date</td><td><input type="text" name="pkg_stDate" value="<%=resultSet.getString(8) %>"></td></tr>
<tr><td>Package End Date</td><td><input type="text" name="pkg_endDate" value="<%=resultSet.getString(9) %>"></td></tr>
<tr><td>Package Accessibility</td><td><input type="text" name="pkg_access" value="<%=resultSet.getString(10) %>"></td></tr>


<input type="hidden" name="register" value="updatePackage">
<td></td>
<td><input type="submit" value="update"></td>
</tr>
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>
</body>
</html>