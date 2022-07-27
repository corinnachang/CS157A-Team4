package Function;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import Model.Admin;

public class AdminLogin {
	
	private Boolean success = false; 

	public void validate(Admin admin) throws Exception {
		// Connection to MySql
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudbook?serverTimezone=UTC", "root", "root");
		
		
		String selectSql = "SELECT * FROM admin WHERE admin_id='" + admin.getId() + "' AND first_name='" + admin.getFirstName() 
			+ "' AND last_name='" + admin.getLastName() + "'";
		
		
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(selectSql);
		
		//String pwd = "";
		if(rs.next())
        {
            success = true;
        }
		
		rs.close();
		statement.close();
		
		// Close connection
		connection.close();
		
	}
	
	public Boolean isSuccess() { return success; }
	
}
