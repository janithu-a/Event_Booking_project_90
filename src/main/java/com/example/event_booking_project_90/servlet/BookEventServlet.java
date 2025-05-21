package com.example.event_booking_project_90.servlet;

import com.example.event_booking_project_90.model.Photography;
import com.example.event_booking_project_90.util.PhotoEventFileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BookEventServlet")
public class BookEventServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String eventId = request.getParameter("eventId");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String participantsStr = request.getParameter("participants");
        String specialRequirements = request.getParameter("specialRequirements");

        try {
            // Here you would typically save the booking to a database
            // For now, we'll just redirect back to the event details with a success parameter

            // Validate the event exists
            Photography event = PhotoEventFileHandler.getEventById(eventId);

            if (event != null) {
                // Redirect to event details with a success parameter
                response.sendRedirect("eventDetails.jsp?eventId=" + eventId + "&booked=true");
            } else {
                response.sendRedirect("index.jsp?error=eventNotFound");
            }
        } catch (Exception e) {
            getServletContext().log("Error in BookEventServlet", e);
            response.sendRedirect("error.jsp?errorType=booking&message=" + e.getMessage());
        }
    }
}
