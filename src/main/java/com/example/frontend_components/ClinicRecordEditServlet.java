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

@WebServlet(name = "ClinicRecordEditServlet", value = "/clinic-edit")
public class ClinicRecordEditServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        // Extract the category details from the form submission
        String clinicId = request.getParameter("cid");
        String patientId = request.getParameter("pid");
        String age = request.getParameter("age");
        String sex = request.getParameter("sex");
        String painType = request.getParameter("pain_type");
        Double restingBp = Double.valueOf(request.getParameter("resting_bp"));
        Double cholesterol = Double.valueOf(request.getParameter("cholesterol"));
        String fastingBs = request.getParameter("fasting_bs");
        String restingEcg = request.getParameter("resting_ecg");
        Double maxHr = Double.valueOf(request.getParameter("max_hr"));
        String exerciseAngina = request.getParameter("exercise_angina");
        Double oldPeak = Double.valueOf(request.getParameter("oldpeak"));
        String stSlope = request.getParameter("st_slope");

        // Check if both fields are not empty
        if (patientId == null) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script>alert('All fields are required');</script>");
            out.println("<script>window.location.href='ViewClinicData.jsp';</script>");
            out.println("</body></html>");
            out.close();
            return;
        }

        // Create a JSON object containing the category details
        JsonObject clinicDataJson = new JsonObject();
        clinicDataJson.addProperty("clinic_id", clinicId);
        clinicDataJson.addProperty("patient_id", patientId);
        clinicDataJson.addProperty("age", age);
        clinicDataJson.addProperty("sex", sex);
        clinicDataJson.addProperty("chest_pain", painType);
        clinicDataJson.addProperty("resting_bp", restingBp);
        clinicDataJson.addProperty("cholesterol", cholesterol);
        clinicDataJson.addProperty("fasting_bs", fastingBs);
        clinicDataJson.addProperty("resting_ecg", restingEcg);
        clinicDataJson.addProperty("max_hr", maxHr);
        clinicDataJson.addProperty("exercise_angina", exerciseAngina);
        clinicDataJson.addProperty("old_peak", oldPeak);
        clinicDataJson.addProperty("st_slope", stSlope);


        // Send a POST request to the backend resource file
        URL url = new URL("http://localhost:8080/BackendComponents_war_exploded/api/clinic/update/" + clinicId);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("PUT");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setDoOutput(true);

        OutputStream os = connection.getOutputStream();
        os.write(clinicDataJson.toString().getBytes());
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
            out.println("<script>window.location.href='ViewClinicData.jsp';</script>"); // stay on the same page
            out.println("</body></html>");
            out.close();
        }

        if (responseCode == HttpURLConnection.HTTP_OK) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script>alert('Clinic record update successful!');</script>");
            out.println("<script>window.location.href='ViewClinicData.jsp';</script>");
            out.println("</body></html>");
            out.close();
        } else {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script>alert('Error updating clinic record');</script>");
            out.println("<script>window.location.href='ViewClinicData.jsp';</script>");
            out.println("</body></html>");
            out.close();
        }
    }

}