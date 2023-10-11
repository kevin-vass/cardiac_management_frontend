package com.example.frontend_components;

import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Extract the email and password from the form submission
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Check if email and password fields are not empty
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script>alert('Please enter both email and password');</script>");
            out.println("<script>window.location.href='Login.jsp';</script>");
            out.println("</body></html>");
            out.close();
            return;
        }

        // Create a JSON object containing the email and password
        JsonObject customerJson = new JsonObject();
        customerJson.addProperty("email", email);
        customerJson.addProperty("password", password);

        // Send a POST request to the backend resource file
        URL url = new URL("http://localhost:8080/BackendComponents_war_exploded/api/login");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setDoOutput(true);

        OutputStream os = connection.getOutputStream();
        os.write(customerJson.toString().getBytes());
        os.flush();

        // Read the response from the backend resource file
        int responseCode = connection.getResponseCode();
        String responseBody = "";
        InputStream inputStream = connection.getInputStream();
        if (inputStream != null) {
            BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
            String line;
            while ((line = br.readLine()) != null) {
                responseBody += line;
            }
            br.close();
        }

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (responseCode == HttpURLConnection.HTTP_OK) {
            // Success
            HttpSession session = request.getSession(true);
            session.setAttribute("email", email); // set session attribute
            session.setMaxInactiveInterval(30 * 60);
            out.println("<html><body>");
            out.println("<script>alert('Login Successful');</script>"); // alert message
            response.sendRedirect("Dashboard.jsp?loginSuccess=true"); // redirect to admin page
            out.println("</body></html>");

        } else if (responseCode == HttpURLConnection.HTTP_UNAUTHORIZED) {
            // Unauthorized (401)
            // Handle authentication failure (e.g., incorrect email/password)
            // Display an error message and stay on the login page
            out.println("<html><body>");
            out.println("<script>alert('Login Failed: Incorrect email or password');</script>");
            response.sendRedirect("Login.jsp?loginSuccess=false&errorMessage=" + URLEncoder.encode("Invalid email or password", "UTF-8"));
            out.println("</body></html>");
        } else {
            // Other errors
            out.println("<html><body>");
            out.println("<h1>Login Failed</h1>");
            out.println("<p>" + responseBody + "</p>");
            out.println("</body></html>");
            // Other errors
            response.sendRedirect("Login.jsp?errorMessage=" + URLEncoder.encode(responseBody, "UTF-8"));

        }
        out.close();
    }
}
