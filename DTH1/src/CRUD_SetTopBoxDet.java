import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CRUD_SetTopBoxDet {
	public static Connection con = null;
	public static PreparedStatement pst = null;
	public static ResultSet rs = null;

	public boolean create(int id,String type,double length,double breadth,double width,double price, double installationCharges, double upgradeCharge, double discount, String billingType, double refundableDeposit) throws ClassNotFoundException, SQLException{
		con = JDBC.getConnection();
		
		
		String query = "insert into STB values(?,?,?,?,?,?,?,?,?,?,?)";
		//System.out.println(query);
		pst = con.prepareStatement(query);
		pst.setInt(1, id);
		pst.setString(2, type);
		pst.setDouble(3, price);
		pst.setDouble(4, installationCharges);
		pst.setDouble(5, upgradeCharge);
		pst.setDouble(6, discount);
		pst.setString(7, billingType);
		pst.setDouble(8, refundableDeposit);
		pst.setDouble(9, length);
		pst.setDouble(10, breadth);
		pst.setDouble(11, width);
		int i= pst.executeUpdate();
		if(i>0)
			return true;
		return false;
		

	}
	
	public ResultSet read(int idGiven) throws ClassNotFoundException, SQLException{
		con = JDBC.getConnection();
		String query ="select * from STB where STB_ID= ?";
		pst = con.prepareStatement(query);
		pst.setInt(1,idGiven);
		rs = pst.executeQuery();
		return rs;
	}
	
	public ResultSet readall() throws ClassNotFoundException, SQLException{
		con = JDBC.getConnection();
		String query ="select * from STB";
		pst = con.prepareStatement(query);
		rs = pst.executeQuery();
		return rs;
	}
	
	
	public boolean delete(int idGiven) throws ClassNotFoundException, SQLException{
		con = JDBC.getConnection();
		String query = "delete from STB where STB_ID=?";
		pst = con.prepareStatement(query);
		pst.setInt(1,idGiven);
		int i = pst.executeUpdate();
		if(i>0)
			return true;
		else
			return false;
	}

	public boolean update(String type,int id,double length,double breadth,double width,double price, double installationCharges, double upgradeCharge, double discount, String billingType, double refundableDeposit) throws ClassNotFoundException, SQLException{
		con = JDBC.getConnection();
		
		
		String query = "update STB set stb_type=?,STB_PRICE=?,STB_INSTALLATION_CHARGE=?,STB_UPGRADATION_CHARGE=?,STB_DISCOUNT=?,STB_BILLING_TYPE=?,STB_REFUNDABLE_DEPOSITS=?,STB_LENGTH=?,STB_BREADTH=?,STB_HEIGHT=? where stb_id="+id+"";
		//System.out.println(query);
		pst = con.prepareStatement(query);
		pst.setString(1, type);
		pst.setDouble(2, price);
		pst.setDouble(3, installationCharges);
		pst.setDouble(4, upgradeCharge);
		pst.setDouble(5, discount);
		pst.setString(6, billingType);
		pst.setDouble(7, refundableDeposit);
		pst.setDouble(8, length);
		pst.setDouble(9, breadth);
		pst.setDouble(10, width);
		int i= pst.executeUpdate();
		if(i>0)
			return true;
		return false;
		 
		// TODO Auto-generated method stub
		
	}
	
public String[] readCSVFile(String pathToFile) throws IOException {
		
		BufferedReader csvReader = new BufferedReader(new FileReader(pathToFile));
		String row;
		String[] dataV=null;
		while ((row = csvReader.readLine()) != null) {
			dataV = row.split(",");
		}	
		csvReader.close();		
		if(dataV != null)
			return dataV;
		return null;
	}

public int addSTBinventory(String[] csvLine) {
	
   
   
   try{
	   con = JDBC.getConnection();
	      
	      
	      String query1 = "insert into STB_INVENTORY values(?,?,?,?,?,?,?,?)";
	      pst = con.prepareStatement(query1);
	      
	      pst.setInt(1, Integer.parseInt(csvLine[0]));
	      pst.setInt(2, Integer.parseInt(csvLine[1]));
	      pst.setString(3, csvLine[2]);
	      pst.setInt(4, Integer.parseInt(csvLine[3]));
	      pst.setInt(5, Integer.parseInt(csvLine[4]));
	      pst.setInt(6, Integer.parseInt(csvLine[5]));
	      pst.setInt(7, Integer.parseInt(csvLine[6]));
	      pst.setInt(8, Integer.parseInt(csvLine[7]));
	      
	  
	      int i = pst.executeUpdate();
	      System.out.println(i+ " rows inserted");
	      return i;
	      
   }catch(Exception e) {
	   e.printStackTrace();
   }
   return -1;
}

public void addFeatures(String languages) throws SQLException {
	// TODO Auto-generated method stub
	int num=10;
	con = JDBC.getConnection();
	String query1="insert into languages values(?,?)";
	pst = con.prepareStatement(query1);
	pst.setInt(1, num);
	pst.setString(2, languages);
	int i=pst.executeUpdate();
	
}
public boolean createPackage(int packageId, int channelId, String packageName, String category ,String packageType, String transmission, double cost, String startDate, String endDate , String defaultPacakage) throws SQLException {		
	
	con = JDBC.getConnection();
	String query = "insert into MANAGE_CHANNEL_PACKAGES values(?,?,?,?,?,?,?,?,?,?)";
	pst = con.prepareStatement(query);
	pst.setInt(1, packageId);
	pst.setInt(2, channelId);
	pst.setString(3, packageName);
	pst.setString(4, category);
	pst.setString(5, packageType);
	pst.setString(6, transmission);
	pst.setDouble(7, cost);
	pst.setString(8, startDate);
	pst.setString(9, endDate);
	pst.setString(10, defaultPacakage);
	int i= pst.executeUpdate();
	if(i>0)
		return true;
	return false;

} 


public boolean deletePackage(int packageId) throws SQLException {
	con = JDBC.getConnection();
	String query = "delete from MANAGE_CHANNEL_PACKAGES where CH_PACKAGE_ID=?";
	pst = con.prepareStatement(query);
	pst.setInt(1,packageId);
	int i = pst.executeUpdate();
	if(i>0)
		return true;
	else
		return false;
	
}

public ResultSet readPackage(int packageId) throws SQLException {
	con = JDBC.getConnection();
	String query ="select * from MANAGE_CHANNEL_PACKAGES where CH_PACKAGE_ID= ?";
	pst = con.prepareStatement(query);
	pst.setInt(1, packageId);
	rs = pst.executeQuery();
	return rs;
}

public boolean updatePackage(int packageId, int channelId, String packageName, String category ,String packageType, String transmission, double cost, String startDate, String endDate , String defaultPacakage) throws SQLException {
	con = JDBC.getConnection();
	String query = "update MANAGE_CHANNEL_PACKAGES set CH_PACKAGE_ID=?,CH_ID=?,CH_PACKAGE_NAME=?,CH_PACKAGE_CATEGORY=?,CH_PACKAGE_CHARGING_TYPE=?,CH_PACKAGE_TRANS_TYPE=?,PACKAGE_COST=?,PACKAGE_AVAILABLE_TO_DATE=?,PACKAGE_AVAILABLE_FROM_DATE=?,PACKAGE_DEFAULT=? where CH_PACKAGE_ID="+packageId+"";
	pst = con.prepareStatement(query);
	pst.setInt(1, packageId);
	pst.setInt(2, channelId);
	pst.setString(3, packageName);
	pst.setString(4, category);
	pst.setString(5, packageType);
	pst.setString(6, transmission);
	pst.setDouble(7, cost);
	pst.setString(8, startDate);
	pst.setString(9, endDate);
	pst.setString(10, defaultPacakage);

	int i= pst.executeUpdate();
	if(i>0)
		return true;
	return false;
	
	
}

public ResultSet readaLLPackage() throws SQLException {
	con = JDBC.getConnection();
	String query ="select * from MANAGE_CHANNEL_PACKAGES";
	pst = con.prepareStatement(query);
	//pst.setInt(1, packageId);
	rs = pst.executeQuery();
	return rs;
}

public boolean createChannel(int channelId,String channelName, String category) throws SQLException {
	String query = "insert into CHANNEL values(?,?,?)";
	
	pst = con.prepareStatement(query);
	pst.setInt(1, channelId);
	pst.setString(2, channelName);
	pst.setString(3, category);


	int i= pst.executeUpdate();
	if(i>0)
		return true;
	return false;

}//login function
public boolean validateLogin(String uname,String pwd) throws SQLException {
con = JDBC.getConnection();
String query = "select * from login where username=? and password=?";
pst = con.prepareStatement(query);
pst.setString(1, uname);
pst.setString(2, pwd);
rs =pst.executeQuery();
if(rs.next()) {
return true;
}
return false;
}
}
	
	
	
	
	
