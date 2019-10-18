
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DTHServlet
 */
@WebServlet("/DTHServlet")
public class DTHServlet extends HttpServlet {
	static Connection conn;
	static PreparedStatement ps;
	String driverName="oracle.jdbc.driver.OracleDriver";
	String DB_URL="jdbc:oracle:thin:@localhost:1521:xe";
	String DB_USER="system";
	String DB_PASS="12345";
	ResultSet rs;
	String query="insert into stb values(?,?,?,?,?,?,?,?,?,?,?)";
	String query1="select * from stb where stb_id=?";
	String query2="select * from stb";
	String query3="delete from stb where stb_id=?";
	CRUD_SetTopBoxDet ml=new CRUD_SetTopBoxDet();
	CRUD_ManageChannel l = new CRUD_ManageChannel();
	
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
   		try {
			
			PrintWriter out=response.getWriter();
			String hidden1=request.getParameter("register");
			
			//Insertion operation
			if(hidden1.equals("create"))
			{
				int id=Integer.parseInt(request.getParameter("id"));
				String type=request.getParameter("type");
				float length=Float.parseFloat(request.getParameter("length"));
				float breadth=Float.parseFloat(request.getParameter("breadth"));
				float width=Float.parseFloat(request.getParameter("width"));
				float price=Float.parseFloat(request.getParameter("price"));
				float icharge=Float.parseFloat(request.getParameter("icharge"));
				float ucharge=Float.parseFloat(request.getParameter("ucharge"));
				float discount=Float.parseFloat(request.getParameter("discount"));
				String btype=request.getParameter("btype");
				float refund=Float.parseFloat(request.getParameter("deposit"));
				String languages="";
				String lang[]=request.getParameterValues("lang");
				for(int i=0;i<lang.length;i++){
				    languages+=lang[i]+" ";
				    
				}
				ml.addFeatures(languages);
				if(ml.create(id,type,length,breadth,width,price,icharge,ucharge,discount,btype,refund))
				{	
					
					//String  p= "C:\\Users\\user\\Downloads\\csv_sample.csv";
					String  q= "C:\\Users\\punreddy420\\Documents\\a.csv";
					String[] csvLine = ml.readCSVFile(q);
					System.out.println(csvLine);
					ml.addSTBinventory(csvLine);
					//request.getRequestDispatcher("Adminhomepage.jsp").include(request, response);
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Account Successfully created');");
					out.println("location='Adminhomepage.jsp';");
					out.println("</script>");
					
				}
					else
					out.println("Not successfully created");
				
			}
			//Selecting by boxid
			else if(hidden1.equals("select"))
			{
				int id=Integer.parseInt(request.getParameter("id"));
				rs = ml.read(id);
				request.getRequestDispatcher("Adminhomepage.jsp").include(request, response);
				out.println("<br><br><br><center>Below are the setupbox details for id - "+id+"</center>");
				while(rs.next())
				{
					
					int id1=rs.getInt(1);
					out.print("<div align=\"center\"><table border=\"1\"><tr><td>Setupbox id</td><td>"+rs.getInt(1)+"</td></tr>");
					out.print("<tr><td>Setupbox Type</td><td>"+rs.getString(2)+"</td></tr>");
					out.print("<tr><td>Price</td><td>"+rs.getDouble(3)+"</td></tr>");
					out.print("<tr><td>Installation charge</td><td>"+rs.getDouble(4)+"</td></tr>");
					out.print("<tr><td>Upgradation Charge</td><td>"+rs.getDouble(5)+"</td></tr>");
					out.print("<tr><td>Discount</td><td>"+rs.getDouble(6)+"</td></tr>");
					out.print("<tr><td>Billing Type</td><td>"+rs.getString(7)+"</td></tr>");
					out.print("<tr><td>Refund</td><td>"+rs.getDouble(8)+"</td></tr>");
					out.print("<tr><td>Length</td><td>"+rs.getDouble(9)+"</td></tr>");
					out.print("<tr><td>Breadth</td><td>"+rs.getDouble(10)+"</td></tr>");
					out.print("<tr><td>Height</td><td>"+rs.getDouble(11)+"</td></tr></table></div>");
					
					
				}
				
				out.print("<div align=\"center\"><form action=\"DTHServlet\" method=\"get\"><input type=\"submit\" value=\"delete\"><input type=\"hidden\" name=\"delete\"value="+id+"><input type=\"hidden\" name=\"register\"value=\"delete\"></div>");
				
			}
			//Basic selection
			else if(hidden1.equals("select1"))
			{
				rs = ml.readall();
				RequestDispatcher rd = request.getRequestDispatcher("readSetupbox.jsp");
				
				rd.include(request, response);
				out.println("<br><div align=\\\"center\\\"><table border=\\\"1\\\">");
				out.println("<th>Setupbox id</th><th>Setupbox Type</th><th>Price</th><th>Installation Charge</th><th>Upgradation Charge</th><th>Discount</th><th>Billing Type</th><th>Refund</th><th>Length</th><th>Breadth</th><th>Height</th>");
				while(rs.next())
				{
					
					out.print("<tr><td>"+rs.getInt(1)+"</td>");
					out.print("<td>"+rs.getString(2)+"</td>");
					out.print("<td>"+rs.getDouble(3)+"</td>");
					out.print("<td>"+rs.getDouble(4)+"</td>");
					out.print("<td>"+rs.getDouble(5)+"</td>");
					out.print("<td>"+rs.getDouble(6)+"</td>");
					out.print("<td>"+rs.getString(7)+"</td>");
					out.print("<td>"+rs.getDouble(8)+"</td>");
					out.print("<td>"+rs.getDouble(9)+"</td>");
					out.print("<td>"+rs.getDouble(10)+"</td>");
					out.print("<td>"+rs.getDouble(11)+"</td></tr>");
					
					
				}
				out.print("</table><br></div>");
			}
			//Delete setupbox operation
			else if(hidden1.equals("delete"))
			{
				int deleteid=Integer.parseInt(request.getParameter("delete"));
				if(ml.delete(deleteid))
				{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Setup box Deleted successfully');");
					out.println("location='Adminhomepage.jsp';");
					out.println("</script>");
				}
					else
					out.print("Requested delete operation is not done.");
			//	RequestDispatcher rd = request.getRequestDispatcher("readSetupbox.jsp");
				//rd.forward(request, response);
				
				
			}else if(hidden1.contentEquals("update")) {
				//int updateid=Integer.parseInt(request.getParameter("id"));
				int id=Integer.parseInt(request.getParameter("id"));
				String type=request.getParameter("stype");
				float price=Float.parseFloat(request.getParameter("price"));
				float icharge=Float.parseFloat(request.getParameter("icharge"));
				float ucharge=Float.parseFloat(request.getParameter("ucharge"));
				float discount=Float.parseFloat(request.getParameter("discount"));
				String btype=request.getParameter("btype");
				float refund=Float.parseFloat(request.getParameter("deposit"));
				float length=Float.parseFloat(request.getParameter("length"));
				float breadth=Float.parseFloat(request.getParameter("breadth"));
				float width=Float.parseFloat(request.getParameter("width"));
				if(ml.update(type,id,length,breadth,width,price,icharge,ucharge,discount,btype,refund))
					{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Setup box Updated successfully');");
					out.println("location='updateSetUpBox.jsp';");
					out.println("</script>");
					}
				else
					out.println("Not successfully updated");
				
	}
			
			
			else if (hidden1.equals("create_channel")) {
				int stb_id = Integer.parseInt(request.getParameter("stbID"));
				int ch_id = Integer.parseInt(request.getParameter("cID"));
				String cName = request.getParameter("cName");
				String cBand = request.getParameter("cBand");
				double vFrequency = Double.parseDouble(request.getParameter("vFrequency"));
				double aFrequency = Double.parseDouble(request.getParameter("aFrequency"));
				String cCtype = request.getParameter("cCtype");
				String ctType = request.getParameter ("ctType");
				double cCharge = Double.parseDouble(request.getParameter("cCharge"));

				if (l.create(stb_id, ch_id, cName, cBand, vFrequency, aFrequency, cCtype, ctType, cCharge))
				{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Setup box Updated successfully');");
					out.println("location='addChannel.jsp';");
					out.println("</script>");
				}
					else
					out.println("Not successfully created");
				RequestDispatcher rd = request.getRequestDispatcher("channelManagement.jsp");
				rd.include(request, response);

			}else if(hidden1.equals("readall_channel")){
				rs = l.readall();
				RequestDispatcher rd = request.getRequestDispatcher("Adminhomepage.jsp");
				rd.include(request, response);
				out.println("<br><br><br><br><div align=\"center\"><table border=\\\"1\\\">");
				out.println(
						"<th>Setupbox id</th><th>Channel ID</th><th>Chaneel Name</th><th>Channel Band</th><th>Video Frequency</th><th>Audio Frequency</th><th>Channel Charge Type</th><th>Channel Transmission Type</th><th>Channel Charge</th>");
				while (rs.next()) {

					out.print("<tr><td>" + rs.getInt(1) + "</td>");
					out.print("<td>" + rs.getInt(2) + "</td>");
					out.print("<td>" + rs.getString(3) + "</td>");
					out.print("<td>" + rs.getString(4) + "</td>");
					out.print("<td>" + rs.getDouble(5) + "</td>");
					out.print("<td>" + rs.getDouble(6) + "</td>");
					out.print("<td>" + rs.getString(7) + "</td>");
					out.print("<td>" + rs.getString(8) + "</td>");
					out.print("<td>" + rs.getDouble(9) + "</td></tr>");
				}
				out.print("</table><br></div>");
				
			}else if(hidden1.equals("read_channel")) {
				int id = Integer.parseInt(request.getParameter("readId"));
				rs = l.read(id);
				RequestDispatcher rd = request.getRequestDispatcher("Adminhomepage.jsp");

				rd.include(request, response);
				out.println("<br><br><br><br><center>Below are the setupbox details for id - " + id + "</center>");
				while (rs.next()) {

					int id1 = rs.getInt(1);
					out.print("<div align=\"center\"><table border=\"1\"><tr><td>Setupbox id</td><td>" + rs.getInt(1)
							+ "</td></tr>");
					out.print("<tr><td>Channel Id</td><td>" + rs.getInt(2) + "</td></tr>");
					out.print("<tr><td>Channel Name</td><td>" + rs.getString(3) + "</td></tr>");
					out.print("<tr><td>Channel Band</td><td>" + rs.getString(4) + "</td></tr>");
					out.print("<tr><td>Video Frequency</td><td>" + rs.getDouble(5) + "</td></tr>");
					out.print("<tr><td>Audio Frequency</td><td>" + rs.getDouble(6) + "</td></tr>");
					out.print("<tr><td>Channel Charge Type</td><td>" + rs.getString(7) + "</td></tr>");
					out.print("<tr><td>Channel Transmission Type</td><td>" + rs.getString(8) + "</td></tr>");
					out.print("<tr><td>Channel Charge</td><td>" + rs.getDouble(9) + "</td></tr></table></div>");

				}
	
			}else if(hidden1.equals("delete_channel")) {
				int deleteid = Integer.parseInt(request.getParameter("deleteId"));
				RequestDispatcher rd = request.getRequestDispatcher("Adminhomepage.jsp");
				rd.include(request, response);
				if (l.delete(deleteid))
					out.print("Requested delete operation done.");
				else
					out.print("Requested delete operation is not done.");
				

			}else if(hidden1.equals("update_channel")) {
				int stb_id = Integer.parseInt(request.getParameter("stb_id"));
				int ch_id = Integer.parseInt(request.getParameter("ch_id"));
				String cName = request.getParameter("ch_name");
				String cBand = request.getParameter("ch_band");
				double vFrequency = Double.parseDouble(request.getParameter("vFreq"));
				double aFrequency = Double.parseDouble(request.getParameter("aFreq"));
				String cCtype = request.getParameter("ccType");
				String ctType = request.getParameter ("ctType");
				double cCharge = Double.parseDouble(request.getParameter("ccharge"));

				if (l.update(stb_id, ch_id, cName, cBand, vFrequency, aFrequency, cCtype, ctType, cCharge))
				{
					
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Channel Updated successfully');");
					out.println("location='updateChannel.jsp';");
					out.println("</script>");
				}
					else
					out.println("Not successfully updated");
				RequestDispatcher rd = request.getRequestDispatcher("channelManagement.jsp");
				rd.include(request, response);

			}
			
			else if(hidden1.contentEquals("createChannelPackage")) {
				
				int packageId = Integer.parseInt(request.getParameter("packageId"));
				int channelId = 1;
				String packageName = request.getParameter("packageName");
				String packageCategory = request.getParameter("packageCategory");
				String packageType = request.getParameter("packageType");
				String packageTransmission = request.getParameter("packageTransmission");
				double packageCost = Double.parseDouble(request.getParameter("packageCost"));
				String packageStartDate = request.getParameter("packageStartDate");
				String packageEndDate = request.getParameter("packageEndDate");
				String packageAccess = request.getParameter("packageAccess");
				
				if(ml.createPackage(packageId, channelId, packageName, packageCategory, packageType, packageTransmission, packageCost, packageStartDate, packageEndDate, packageAccess)) {
					{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Created package successfully');");
						out.println("location='Adminhomepage.jsp';");
						out.println("</script>");
					}
				} else {
					    out.println("Something is wrong while creating package");
				}
			}else if(hidden1.contentEquals("readAllChannelPackage")) {
				//int pkgId = Integer.parseInt(request.getParameter("packageId"));
				
				rs = ml.readaLLPackage();
				RequestDispatcher rd = request.getRequestDispatcher("Adminhomepage.jsp");
				rd.include(request, response);
				
					out.println("<br><br><br><br><center>Below are the Package details</center></br> ");
					
					out.println("<br><div align=\"center\"><table border=\"1\">");
					out.println("<th>Package id</th><th>Channel Id</th><th>Package Name</th><th>Category</th><th>Package Type</th><th>Package Transmission </th><th>Package Cost</th><th>Start Date</th><th>End Date</th><th>Package Access Type</th>");
					while(rs.next())
					{
						
						out.print("<tr><td>"+rs.getInt(1)+"</td>");
						out.print("<td>"+rs.getInt(2)+"</td>");
						out.print("<td>"+rs.getString(3)+"</td>");
						out.print("<td>"+rs.getString(4)+"</td>");
						out.print("<td>"+rs.getString(5)+"</td>");
						out.print("<td>"+rs.getString(6)+"</td>");
						out.print("<td>"+rs.getDouble(7)+"</td>");
						out.print("<td>"+rs.getString(8)+"</td>");
						out.print("<td>"+rs.getString(9)+"</td>");
						out.print("<td>"+rs.getString(10)+"</td>");
						
						
						
					}
					out.print("</div>");
				
//				while(rs.next()) {
//					out.print("<div align=\"center\"><table border=\"1\"><tr><td>Package Id id</td><td>"+rs.getInt(1)+"</td></tr>");
//					out.print("<tr><td>Channel Id</td><td>"+rs.getInt(2)+"</td></tr>");
//					out.print("<tr><td>Package Name</td><td>"+rs.getString(3)+"</td></tr>");
//					out.print("<tr><td>Category </td><td>"+rs.getString(4)+"</td></tr>");
//					out.print("<tr><td>Package Type </td><td>"+rs.getString(5)+"</td></tr>");
//					out.print("<tr><td>Package Transmission </td><td>"+rs.getString(6)+"</td></tr>");
//					out.print("<tr><td>Package Cost</td><td>"+rs.getDouble(7)+"</td></tr>");
//					out.print("<tr><td>Start Date</td><td>"+rs.getString(8)+"</td></tr>");
//					out.print("<tr><td>End Date</td><td>"+rs.getString(9)+"</td></tr>");
//					out.print("<tr><td>Package Access Type</td><td>"+rs.getString(10)+"</td></tr>");
//	
//				}
				
				
			} else if(hidden1.contentEquals("readPackage")) {
				int pkgId = Integer.parseInt(request.getParameter("packageId"));
				rs = ml.readPackage(pkgId);
				RequestDispatcher rd = request.getRequestDispatcher("readPackage.jsp");
				rd.include(request, response);
				
				out.println("<center>Required Package detail </center>");
				
				out.println("<br><div align=\"center\"><table border=\"1\">");
				out.println("<th>Package id</th><th>Channel Id</th><th>Package Name</th><th>Category</th><th>Package Type</th><th>Package Transmission </th><th>Package Cost</th><th>Start Date</th><th>End Date</th><th>Package Access Type</th>");
				while(rs.next())
				{
					
					out.print("<tr><td>"+rs.getInt(1)+"</td>");
					out.print("<td>"+rs.getInt(2)+"</td>");
					out.print("<td>"+rs.getString(3)+"</td>");
					out.print("<td>"+rs.getString(4)+"</td>");
					out.print("<td>"+rs.getString(5)+"</td>");
					out.print("<td>"+rs.getString(6)+"</td>");
					out.print("<td>"+rs.getDouble(7)+"</td>");
					out.print("<td>"+rs.getString(8)+"</td>");
					out.print("<td>"+rs.getString(9)+"</td>");
					out.print("<td>"+rs.getString(10)+"</td>");
					
					
					
				}
				
//				while(rs.next()) {
//					int id1=rs.getInt(1);
//					out.print("<div align=\"center\"><table border=\"1\"><tr><td>Package Id id</td><td>"+rs.getInt(1)+"</td></tr>");
//					out.print("<tr><td>Channel Id</td><td>"+rs.getInt(2)+"</td></tr>");
//					out.print("<tr><td>Package Name</td><td>"+rs.getString(3)+"</td></tr>");
//					out.print("<tr><td>Category </td><td>"+rs.getString(4)+"</td></tr>");
//					out.print("<tr><td>Package Type </td><td>"+rs.getString(5)+"</td></tr>");
//					out.print("<tr><td>Package Transmission </td><td>"+rs.getString(6)+"</td></tr>");
//					out.print("<tr><td>Package Cost</td><td>"+rs.getDouble(7)+"</td></tr>");
//					out.print("<tr><td>Start Date Charge</td><td>"+rs.getString(8)+"</td></tr>");
//					out.print("<tr><td>End Date</td><td>"+rs.getString(9)+"</td></tr>");
//					out.print("<tr><td>Package Access Type</td><td>"+rs.getString(10)+"</td></tr>");
//	
//				}
			} else if(hidden1.contentEquals("deletePackage")) {
				int pkgId = Integer.parseInt(request.getParameter("packageId"));
				if(ml.deletePackage(pkgId)) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Deleted package successfully');");
					out.println("location='Adminhomepage.jsp';");
					out.println("</script>");
				} else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Please enter a right ID.');");
					out.println("location='deletePackage.jsp';");
					out.println("</script>");
				}
				
			} else if(hidden1.contentEquals("updatePackage")) {
				int pkg_id = Integer.parseInt(request.getParameter("pkg_id"));
				int ch_id = Integer.parseInt(request.getParameter("ch_id"));
				String pkg_name = request.getParameter("pkg_name");
				String pkg_category = request.getParameter("pkg_category");
				String pkg_type = request.getParameter("pkg_type");
				String pkg_trans = request.getParameter("pkg_trans");
				double pkg_cost = Double.parseDouble(request.getParameter("pkg_cost"));
				String pkg_stDate = request.getParameter("pkg_stDate");
				String pkg_endDate = request.getParameter("pkg_endDate");
				String pkg_access = request.getParameter("pkg_access");
				
				if(ml.updatePackage(pkg_id, ch_id, pkg_name, pkg_category, pkg_type, pkg_trans, pkg_cost, pkg_stDate, pkg_endDate, pkg_access)) {
					{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Updated package successfully');");
						out.println("location='Adminhomepage.jsp';");
						out.println("</script>");
					}
				}else {
					out.print("Something went wrong!");
				}
				
				RequestDispatcher rd = request.getRequestDispatcher("packageManagement.jsp");
				rd.include(request, response);
				
			}
			else if(hidden1.equals("login")) {
				String uname = request.getParameter("username");
				String pwd = request.getParameter("password");
				String type = request.getParameter("Role");
				System.out.println(type);
				if(type.contentEquals("Admin") || type.contentEquals("Operator")) {
				if(ml.validateLogin(uname, pwd)) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Loggedin successfully');");
					out.println("location='Adminhomepage.jsp';");
					out.println("</script>");
				}else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Your credentials are wrong');");
					out.println("location='login.jsp';");
					out.println("</script>");
				}
				}
				}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}


}
