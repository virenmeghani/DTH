import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CRUD_ManageChannel {
	public static Connection con = null;
	public static PreparedStatement pst = null;
	public static ResultSet rs = null;

	
	public boolean create(int STB_ID,int  CH_ID,String CH_NAME,String CH_BAND,double CH_VC_FREQUENCY,double CH_AC_FREQUENCY, String CH_CHARGE_TYPE, String CH_TRANS_TYPE, double CH_CHARGE) throws ClassNotFoundException, SQLException{
		con = JDBC.getConnection();
		
		
		String query = "insert into MANAGE_CHANNELS values(?,?,?,?,?,?,?,?,?)";
		//System.out.println(query);
		pst = con.prepareStatement(query);
		pst.setInt(1, STB_ID);
		pst.setInt(2, CH_ID);
		pst.setString(3, CH_NAME);
		pst.setString(4, CH_BAND);
		pst.setDouble(5, CH_VC_FREQUENCY);
		pst.setDouble(6, CH_AC_FREQUENCY);
		pst.setString(7, CH_CHARGE_TYPE);
		pst.setString(8, CH_TRANS_TYPE);
		pst.setDouble(9, CH_CHARGE);

		int i= pst.executeUpdate();
		if(i>0)
			return true;
		return false;
		

	}
	
	public ResultSet read(int idGiven) throws ClassNotFoundException, SQLException{
		con = JDBC.getConnection();
		String query ="select * from MANAGE_CHANNELS where CH_ID= ?";
		pst = con.prepareStatement(query);
		pst.setInt(1,idGiven);
		rs = pst.executeQuery();
		return rs;
	}
	
	public ResultSet readall() throws ClassNotFoundException, SQLException{
		con = JDBC.getConnection();
		String query ="select * from MANAGE_CHANNELS";
		pst = con.prepareStatement(query);
		rs = pst.executeQuery();
		return rs;
	}
	
	
	public boolean delete(int idGiven) throws ClassNotFoundException, SQLException{
		con = JDBC.getConnection();
		String query = "delete from MANAGE_CHANNELS where CH_ID=?";
		pst = con.prepareStatement(query);
		pst.setInt(1,idGiven);
		int i = pst.executeUpdate();
		if(i>0)
			return true;
		else
			return false;
	}

	public boolean update(int stb_id, int ch_id, String cName, String cBand, double vFrequency, double aFrequency,
			String cCtype, String ctType, double cCharge) throws ClassNotFoundException, SQLException{
		// TODO Auto-generated method stub
		con = JDBC.getConnection();
		String query = "update MANAGE_CHANNELS set STB_ID=?,CH_ID=?,CH_NAME=?,CH_BAND=?,CH_VC_FREQUENCY=?,CH_AC_FREQUENCY=?,CH_CHARGE_TYPE=?,CH_TRANS_TYPE=?,CH_CHARGE=? where CH_ID="+ch_id+"";
		pst = con.prepareStatement(query);
		pst.setInt(1, stb_id);
		pst.setInt(2, ch_id);
		pst.setString(3, cName);
		pst.setString(4, cBand);
		pst.setDouble(5, vFrequency);
		pst.setDouble(6, aFrequency);
		pst.setString(7, cCtype);
		pst.setString(8, ctType);
		pst.setDouble(9, cCharge);
		int i= pst.executeUpdate();
		if(i>0)
			return true;
		return false;
	}
	
	

}
