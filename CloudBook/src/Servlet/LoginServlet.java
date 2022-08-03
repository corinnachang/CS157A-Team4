package Servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import Function.UserLogin;
import Model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private UserLogin userLogin;

	public void init() {
		userLogin = new UserLogin(); // initiate
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// convert user input into String
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// enter user input into new user
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);


		try {
			userLogin.validate(user); 

			
			String destPage = "login.jsp";
            
            if (userLogin.isSuccess()) {
                HttpSession session = request.getSession();
                session.setAttribute("firstName", user.getFirstName());
                session.setAttribute("lastName", user.getLastName());
                session.setAttribute("username", user.getUsername());
                session.setAttribute("password", user.getPassword());
                session.setAttribute("address", user.getAddress());
                destPage = "userAccount.jsp";
            }
            else {
                String message = "Invalid email or password. Please try again.";
                request.setAttribute("message", message);
            	//destPage = "fail.jsp";
            }
             
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// redirect to success.jsp to indicate successfully user added
		//response.sendRedirect("success.jsp");
		
	}
}