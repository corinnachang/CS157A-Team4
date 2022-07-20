package Function;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import Model.User;

public class UserLogin {
	
	private Boolean success = false; 

	public void validate(User user) throws Exception {
		// Connection to MySql
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudbook?serverTimezone=UTC", "root", "root");
		
		// Read row
		String selectSql = "SELECT password FROM customer WHERE username='" + user.getUsername() + "'";
		//System.out.println(selectSql);
		
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(selectSql);
		
		//String pwd = "";
		while(rs.next())
        {
            String pwd = rs.getString(1);
            if(pwd.equals(user.getPassword()))
            	success = true;
            
        }
		
		rs.close();
		statement.close();
		
		// Close connection
		connection.close();
		
	}
	
	public Boolean isSuccess() {
		return success;
	}

}
