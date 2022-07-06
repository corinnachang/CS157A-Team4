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
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/books?serverTimezone=UTC", "root", "root");
		
		// Insert row
		String insertSql = "INSERT INTO user (first_name, last_name, username, password, email) "
				          + "VALUES ('" + user.getFirstName()
				          + "', '" + user.getLastName() 
				          + "', '" + user.getUsername()
				          + "', '" + user.getPassword() 
				          + "', '" + user.getEmail() + "')";
		Statement statement = connection.createStatement();
		statement.execute(insertSql);
		
		// Query 
		
		String querySql = "SELECT * FROM user";
		Statement st=connection.createStatement();
		ResultSet rs=st.executeQuery(querySql);
		while(rs.next())
		{
		    // rs.getString(1); //or rs.getString("column name");
			int userID = rs.getInt("user_id"); //user_id is automatically set to increment
			String firstName = rs.getString("first_name");
			String lastName = rs.getString("last_name");
			String username = rs.getString("username");
			String password = rs.getString("password");
			String email = rs.getString("email");
            
			System.out.println(userID);
            System.out.println(firstName);
            System.out.println(lastName);
            System.out.println(username);
            System.out.println(password);
            System.out.println(email);
		}
		
		// Close connection
		statement.close();
		rs.close();
		connection.close();

	}

}
