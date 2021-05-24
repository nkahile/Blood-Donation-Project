import java.sql.Connection;
import java.sql.SQLException;
import java.util.Scanner;



public class Hospital extends SQLConnection {
	public String querySelection;
	Scanner scanner  = new Scanner(System.in);
	
	
	
	public void newDonationIndividual() throws SQLException {
		System.out.println("Add a student donor (1)");
		System.out.println("Add a teacher donor (2)");
		
		int selection = scanner.nextInt();
		if (selection == 1) {
			System.out.println("Enter Student First Name");
			String firstName = this.scanner.next();
			
			System.out.println("Enter Student Last Name");
			String lastName = this.scanner.next();
			
			System.out.println("Enter Student Grade (9th, 10th, 11th, 12th)");
			String grade = this.scanner.next();
			
			System.out.println("Enter Student Age");
			int age = this.scanner.nextInt();
			
			System.out.println("Enter School Code");
			int schoolCode = this.scanner.nextInt();
			
			try{
				
				Connection conn = getConnection();
		        Hospital.runQuery(conn, "INSERT INTO Student_Donor VALUES('"+firstName+"', '"+lastName+"'"
		        		+ ", '"+grade+"', '"+age+"', '"+schoolCode+"')");
				
			} catch (Exception e) {
				
				//e.printStackTrace();	
			}
		}
	}
	
	
	
	public void start() throws SQLException {
		Connection conn = getConnection();

		while (true)
		{
			 System.out.println("Show Donated Students (1)");
		     System.out.println("Show Donated Teachers(2)");
		     System.out.println("Show Student on file(3)");
		     System.out.println("Add New Donation(4)");
		     System.out.println("Exit(5)");
		     
		   int selection = scanner.nextInt();

		   switch(selection){
		        case 1:
		           Hospital.runQuery(conn, "EXEC Donated_Students;");
		           System.out.println("   ");
		           break;
		           
		        case 2:
			       Hospital.runQuery(conn, "EXEC Donated_Teachers;");
		           System.out.println("   ");
		           break;
		           
		        case 3:
		        	Hospital.runQuery(conn, "SELECT *FROM Student_Donor;");
		        	System.out.println("   ");
		        	break;
		           
		        case 4:
		           this.newDonationIndividual();
		           System.out.println("Inserted");
		           break;
		           
		        case 5:
		           System.exit(0);
		           
		        default:
		        	 System.out.println("Invalid Entry");
		        	   
		      }
		 }
	}
}
