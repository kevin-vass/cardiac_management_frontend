package com.example.frontend_components;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the user's session
        HttpSession session = request.getSession(false);

        // Check if a session exists
        if (session != null) {
            // Invalidate (log out) the session
            session.invalidate();
        }

        // Redirect the user to the login page or any other page as needed
        response.sendRedirect("Login.jsp");
    }

}
