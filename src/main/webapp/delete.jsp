<%@ page import="java.io.*,java.util.*" %>
<%
    String filePath = application.getRealPath("/") + "Booking.txt";
    String id = request.getParameter("id");
    if (id != null) {
        List<String> lines = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.split(",")[0].equals(id)) {
                    lines.add(line);
                }
            }
        }
        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath))) {
            for (String l : lines) writer.println(l);
        }
    }
    response.sendRedirect("viewBookings.jsp");
%>