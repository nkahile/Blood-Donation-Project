import java.sql.*;
import java.util.Scanner;

public class SQLConnection {
	
	public static Connection getConnection() throws SQLException {
		
		// configure this information
		String databaseName = "FINAL52"; 
		String user = "52Kah52";
		String password = "CSCI44300-Tesbiq7";
		
		String url = "jdbc:sqlserver://IN-CSCI-MSSQL2.ADS.IU.EDU\\SQL2019DEV:11433;database=" + databaseName + ";";
		
		Connection connection = null;
		
		System.out.println("url: " + url);

		try {
			// mssql-jdbc-... jar file on the classpath for the connection to work.
			
			String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
			Class.forName(driver).getDeclaredConstructor().newInstance();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Status : Disconnected.");

		}
		
		connection = DriverManager.getConnection(url, user, password);
		System.out.println("Status : Connected.");

		return connection;
		
	}
	
	// runs a select statement and print all the results to the console.
	public static void runQuery(Connection conn, String query) throws SQLException {
		//query = "SELECT *FROM Student_Donated_Info;";
		PreparedStatement readStatement = conn.prepareStatement(query);
		ResultSet resultSet = readStatement.executeQuery();
		
		//print results
		ResultSetMetaData rsmd = resultSet.getMetaData();
		int columnsNumber = rsmd.getColumnCount();
		while (resultSet.next()) {
			for (int i = 1; i <= columnsNumber; i++) {
				if (i > 1) System.out.print(", ");
				String columnValue = resultSet.getString(i);
				System.out.print(rsmd.getColumnName(i) + " " + columnValue);
			}
			System.out.println("");
		}
	}	
}
