package com.example.event_booking_project_90.IT24100435.Controllers;

import com.example.event_booking_project_90.IT24100435.Models.Booking;
import com.example.event_booking_project_90.IT24100435.Models.BookingManagement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Queue;

@WebServlet("/viewBookings")
public class ViewBookingsServlet extends HttpServlet {
    private BookingManagement bookingManagement;

    @Override
    public void init() {
        bookingManagement = new BookingManagement(getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Queue<Booking> bookings = bookingManagement.getAllBookings();
        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("viewBookings.jsp").forward(request, response);
    }
}
