import java.sql.*;


public class JDBC {
    private static String driveInfor = "oracle.jdbc.driver.OracleDriver";
    private static String username = "system";
    private static String password = "12345";
    private static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static Connection con;

    public static Connection getConnection() {
        try {
            Class.forName(driveInfor);
    		System.out.println("driver succesfully registered");
    		
            try {
            	con = DriverManager.getConnection(url, username, password);
        	    System.out.println("connection established successfully");
            } catch (SQLException ex) {
                // log an exception. fro example:
                System.out.println("Failed to create the database connection."); 
            }
        } catch (ClassNotFoundException ex) {
            // log an exception. for example:
            System.out.println("Driver not found."); 
        }
        return con;
    }
}