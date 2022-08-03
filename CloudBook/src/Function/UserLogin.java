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
		String selectSql = "SELECT * FROM customer WHERE username='" + user.getUsername() + "' AND password='" + user.getPassword() + "'";
		//System.out.println(selectSql);
		
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(selectSql);
		
		//String pwd = "";
		if(rs.next())
        {
            user.setFirstName(rs.getString("first_name"));
            user.setLastName(rs.getString("last_name"));
            int addressID = rs.getInt("address_id");
            
            String querySqlAddress = "SELECT address FROM address WHERE address_id=" + addressID + ";";
    		//System.out.println(querySqlAddress);
    		
    		
    		ResultSet rsAddress = statement.executeQuery(querySqlAddress);
    		
    		
    		while(rsAddress.next())
    		{
    		    
    			user.setAddress(rsAddress.getString("address"));
    		}		
    		
    		
            success = true;
            
            rsAddress.close();
            
        }
		
		rs.close();
		statement.close();
		
		// Close connection
		connection.close();
		
	}
	
	public Boolean isSuccess() { return success; }
	
}
