package com.property.servlet;

import com.property.ejb.UserFacade;
import com.property.model.User;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    
    @EJB
    private UserFacade userEJB;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if user is already logged in
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            if ("admin".equals(user.getRole())) {
                response.sendRedirect("admin-dashboard.jsp");
            } else {
                response.sendRedirect("customer-dashboard.jsp");
            }
            return;
        }
        
        // Forward to login page
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        // Validate input
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty() || role == null || role.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Email, password, and role are required.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        
        // Authenticate  response);
        User user = userEJB.authenticate(email, password);
        
        if (user == null || !user.getRole().equals(role)) {
            request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        
        // Create session
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        
        // Redirect to appropriate dashboard
        if ("admin".equals(user.getRole())) {
            response.sendRedirect("admin-dashboard.jsp");
        } else {
            response.sendRedirect("customer-dashboard.jsp");
        }
           
        }
        
    
}
