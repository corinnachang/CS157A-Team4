package Servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import Function.AdminLogin;
import Model.Admin;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

	private AdminLogin adminLogin;

	public void init() {
		adminLogin = new AdminLogin(); // initiate
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// convert user input into String
		int adminID =  Integer.parseInt(request.getParameter("adminID"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");

		// enter user input into new user
		Admin admin = new Admin();
		admin.setId(adminID);
		admin.setFirstName(firstName);
		admin.setLastName(lastName);

		try {
			adminLogin.validate(admin); 

			
			String destPage = "adminLogin.jsp";
            
            if (adminLogin.isSuccess()) {
                HttpSession session = request.getSession();
                session.setAttribute("adminID", admin.getId());
                session.setAttribute("firstName", admin.getFirstName());
                session.setAttribute("lastName", admin.getLastName());
                destPage = "adminAccount.jsp";
            }
            else {
                String message = "Invalid credentials. Please try again.";
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