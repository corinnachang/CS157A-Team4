package Servlet;
// Connects tomcat/newUser.jsp to UserInser.java

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import Function.UserInsert;
import Model.User;


@WebServlet("/register")
public class UserServlet extends HttpServlet {
    
	private UserInsert userInsert; //represent the new user just created

    
	public void init() {
    	userInsert = new UserInsert(); //initiate userInsert
    }

    
	// process post request and redirect to appropriate page
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	
    	//convert user input into String
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String address = request.getParameter("address");

        //enter user input into new user
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setUsername(username);
        user.setPassword(password);
        user.setAddress(address);

        try {
        	userInsert.registerUser(user); //register user
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        //redirect to success.jsp to indicate successfully user added
        //response.sendRedirect("success.jsp");
        RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
        dispatcher.forward(request, response);
    }
}