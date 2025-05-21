package com.example.event_booking_project_90.IT24100093.Controllers;

import com.example.event_booking_project_90.IT24100093.Models.Payment;
import com.example.event_booking_project_90.IT24100093.Models.PaymentRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/viewPayments")
public class ViewPaymentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>All Payments</title>");
        out.println("<style>");
        out.println("body {");
        out.println("    font-family: Arial, sans-serif;");
        out.println("    background: black;");
        out.println("    display: flex;");
        out.println("    justify-content: center;");
        out.println("    align-items: center;");
        out.println("    min-height: 100vh;");
        out.println("    margin: 0;");
        out.println("    padding: 20px;");
        out.println("}");
        out.println(".container {");
        out.println("    background: white;");
        out.println("    padding: 30px;");
        out.println("    border-radius: 10px;");
        out.println("    box-shadow: 0 0 15px rgba(0,0,0,0.2);");
        out.println("    max-width: 800px;");
        out.println("    width: 90%;");
        out.println("}");
        out.println("h1 {");
        out.println("    color: #333;");
        out.println("    margin-bottom: 20px;");
        out.println("    text-align: center;");
        out.println("}");
        out.println("table {");
        out.println("    width: 100%;");
        out.println("    border-collapse: collapse;");
        out.println("    margin-top: 20px;");
        out.println("}");
        out.println("th, td {");
        out.println("    padding: 12px;");
        out.println("    text-align: left;");
        out.println("    border-bottom: 1px solid #ddd;");
        out.println("}");
        out.println("th {");
        out.println("    background-color: #f2f2f2;");
        out.println("    color: #333;");
        out.println("}");
        out.println("tr:hover {");
        out.println("    background-color: #f5f5f5;");
        out.println("}");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='container'>");
        out.println("<h1>All Payments</h1>");
        out.println("<table>");
        out.println("<tr><th>Name</th><th>Card</th><th>Amount</th></tr>");

        PaymentRepository repository = new PaymentRepository();
        List<Payment> payments = repository.getAllPayments();

        if (payments.isEmpty()) {
            out.println("<tr><td colspan='3'>No payment records found.</td></tr>");
        } else {
            for (Payment payment : payments) {
                out.println("<tr>");
                out.println("<td>" + payment.getName() + "</td>");
                out.println("<td>" + payment.getMaskedCardNumber() + "</td>");
                out.println("<td>" + (payment.getAmount() != null ? payment.getAmount() : "null") + "</td>");
                out.println("</tr>");
            }
        }

        out.println("</table>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }
}