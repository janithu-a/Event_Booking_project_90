package com.example.event_booking_project_90.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class UpdateBookingServlet extends HttpServlet {
    private final String filePath = "Booking.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idToUpdate = request.getParameter("id");
        String newName = request.getParameter("name");
        String newDate = request.getParameter("date");

        List<String> updatedBookings = new ArrayList<>();

        BufferedReader reader = new BufferedReader(new FileReader(filePath));
        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts.length > 0 && parts[0].equals(idToUpdate)) {
                updatedBookings.add(idToUpdate + "," + newName + "," + newDate);
            } else {
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



