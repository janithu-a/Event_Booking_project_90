package com.example.event_booking_project_90.servlet;

import com.example.event_booking_project_90.model.Booking;
import com.example.event_booking_project_90.util.BookingManagement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
