package com.example.frontend_components;


import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet(name = "PatientEditServlet", value = "/patient-edit")
public class PatientEditServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        // Extract the category details from the form submission
        String patient_id = request.getParameter("idedit");
        String name = request.getParameter("nameedit");
        String address = request.getParameter("addressedit");
        Integer telephone = Integer.valueOf(request.getParameter("telephoneedit"));


        // Check if both fields are not empty
        if (name == null) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script>alert('All fields are required');</script>");
            out.println("<script>window.location.href='PatientInfo.jsp';</script>");
            out.println("</body></html>");
            out.close();
            return;
        }

        // Create a JSON object containing the category details
        JsonObject patientJson = new JsonObject();
        patientJson.addProperty("patient_id", patient_id);
        patientJson.addProperty("name", name);
        patientJson.addProperty("address", address);
        patientJson.addProperty("telephone", telephone);


        // Send a POST request to the backend resource file
        URL url = new URL("http://localhost:8080/BackendComponents_war_exploded/api/patient/update/" + patient_id);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("PUT");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setDoOutput(true);

        OutputStream os = connection.getOutputStream();
        os.write(patientJson.toString().getBytes());
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
            out.println("<script>window.location.href='PatientInfo.jsp';</script>"); // stay on the same page
            out.println("</body></html>");
            out.close();
        }

        if (responseCode == HttpURLConnection.HTTP_OK) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script>alert('Patient update successful!');</script>");
            out.println("<script>window.location.href='PatientInfo.jsp';</script>");
            out.println("</body></html>");
            out.close();
        } else {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script>alert('Error updating patient');</script>");
            out.println("<script>window.location.href='PatientInfo.jsp';</script>");
            out.println("</body></html>");
            out.close();
        }
    }

}