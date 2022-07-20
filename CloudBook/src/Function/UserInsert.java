package Function;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import Model.User;

//basically the given example
//inserts user into database
public class UserInsert {

	public void registerUser (User user) throws Exception {
		// Connection to MySql
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudbook?serverTimezone=UTC", "root", "root");
		
		
		String insertSqlAddress = "INSERT INTO address (address) "
		          + "VALUES ('" + user.getAddress() + "')";
		System.out.println(insertSqlAddress);
				
		String querySqlAddress = "SELECT address_id FROM address WHERE address='" + user.getAddress() + "'";
		System.out.println(querySqlAddress);
		
		Statement statement = connection.createStatement();
		statement.execute(insertSqlAddress);
		ResultSet rsAddress_id = statement.executeQuery(querySqlAddress);
		
		
		int address_id = 0;
		while(rsAddress_id.next())
		{
		    
			address_id = rsAddress_id.getInt("address_id");
		}		
		
		// Insert row
		String insertSql = "INSERT INTO customer (first_name, last_name, username, `password`, address_id) "
		          + "VALUES ('" + user.getFirstName()
		          + "', '" + user.getLastName() 
		          + "', '" + user.getUsername()
		          + "', '" + user.getPassword() 
		          + "', " + address_id + ");";
		System.out.println(insertSql);
		
		statement.execute(insertSql);
		
		// Query 
		
		/*
		 * String querySql = "SELECT * FROM customer"; Statement
		 * st=connection.createStatement(); ResultSet rs=st.executeQuery(querySql);
		 * while(rs.next()) { // rs.getString(1); //or rs.getString("column name"); int
		 * userID = rs.getInt("customer_id"); //user_id is automatically set to
		 * increment String firstName = rs.getString("first_name"); String lastName =
		 * rs.getString("last_name"); String username = rs.getString("username"); String
		 * password = rs.getString("password"); int user_address_id =
		 * rs.getInt("address_id");
		 * 
		 * String querySqlGetAddress = "SELECT address_id FROM address WHERE address='"
		 * + user_address_id + "'"; ResultSet
		 * rsAddress=st.executeQuery(querySqlGetAddress);
		 * 
		 * System.out.println(userID); System.out.println(firstName);
		 * System.out.println(lastName); System.out.println(username);
		 * System.out.println(password); System.out.println(rsAddress);
		 * rsAddress.close(); }
		 */
		
		// Close connection
		statement.close();
		//rs.close();
		connection.close();

	}

}
