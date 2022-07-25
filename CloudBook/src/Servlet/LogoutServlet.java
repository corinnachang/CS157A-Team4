package Servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;



@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("user");
             
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
            
        }

		// redirect to success.jsp to indicate successfully user added
		//response.sendRedirect("success.jsp");
		
	}
}