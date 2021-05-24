import java.sql.*;

public class Main {
	
	public static void main(String [] args) {
		Hospital hospital = new Hospital();
		try{
			
			hospital.start();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}
}