package com.example.event_booking_project_90.IT24100435.Controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

public class DeleteBookingServlet extends HttpServlet {
    private final String filePath = "Booking.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idToDelete = request.getParameter("id");
        List<String> updatedBookings = new ArrayList<>();

        BufferedReader reader = new BufferedReader(new FileReader(filePath));
        String line;
        while ((line = reader.readLine()) != null) {
            if (!line.startsWith(idToDelete + ",")) {
                updatedBookings.add(line);
            }
        }
        reader.close();

        BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, false));
        for (String booking : updatedBookings) {
            writer.write(booking);
            writer.newLine();
        }
        writer.close();

        response.sendRedirect("viewBookings.jsp");
    }
}



