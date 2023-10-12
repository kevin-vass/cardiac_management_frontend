package com.example.frontend_components;

import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet(name = "PatientRegistrationServlet", value = "/patient-registration")
public class PatientRegistrationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        // Extract the category details from the form submission
        String patientName = request.getParameter("name");
        String address = request.getParameter("address");
        Integer phone = Integer.valueOf(request.getParameter("contact"));
        String birthdate = request.getParameter("birthdate");
        String gender = request.getParameter("gender");

        // Check if both fields are not empty
        if (patientName == null) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script>alert('All fields are required');</script>");
            out.println("<script>window.location.href='Admin/AdminAddCategoryAndView.jsp';</script>");
            out.println("</body></html>");
            out.close();
            return;
        }

        // Create a JSON object containing the category details
        JsonObject categoryJson = new JsonObject();
        categoryJson.addProperty("name", patientName);
        categoryJson.addProperty("address", address);
        categoryJson.addProperty("telephone", phone);
        categoryJson.addProperty("birthdate", birthdate);
        categoryJson.addProperty("gender", gender);

        String userName = null;
        HttpSession usersession = request.getSession(false);
        userName = usersession.getAttribute("email").toString();
        categoryJson.addProperty("crated_by", userName);

        // Send a POST request to the backend resource file
        URL url = new URL("http://localhost:8080/BackendComponents_war_exploded/api/patient");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setDoOutput(true);

        OutputStream os = connection.getOutputStream();
        os.write(categoryJson.toString().getBytes());
        os.flush();
        // os.close();

        int responseCode = connection.getResponseCode();
        String responseBody = "";
        if (responseCode == HttpURLConnection.HTTP_OK) {
            // Success
            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line;
            while ((line = br.readLine()) != null) {
                responseBody += line;
            }
            br.close();
        } else {
            // Error
            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
            String line;
            while ((line = br.readLine()) != null) {
                responseBody += line;
            }
            br.close();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script>alert('Failed: " + responseBody + "');</script>"); // alert message with error code
            out.println("<script>window.location.href='AddNewPatient.jsp';</script>"); // stay on the same page
            out.println("</body></html>");
            out.close();
        }

        if (responseCode == HttpURLConnection.HTTP_OK) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script>alert('Patient registration successful!');</script>");
            out.println("<script>window.location.href='AddNewPatient.jsp';</script>");
            out.println("</body></html>");
            out.close();
        } else {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script>alert('Error registering Patient');</script>");
            out.println("<script>window.location.href='AddNewPatient.jsp';</script>");
            out.println("</body></html>");
            out.close();
        }
    }

}
