<%@ page import="java.io.*,java.util.*" %>
<%
    String filePath = application.getRealPath("/") + "Booking.txt";
    String id       = request.getParameter("id");
    // Handle form submit
    if (id != null && "POST".equalsIgnoreCase(request.getMethod())) {
        String event        = request.getParameter("event");
        String type         = request.getParameter("type");
        String date         = request.getParameter("date");
        String location     = request.getParameter("location");
        String photographer = request.getParameter("photographer");
        List<String> lines = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts[0].equals(id)) {
                    line = id + "," + event + "," + type + "," + date + "," + location + "," + photographer;
                }
                lines.add(line);
            }
        }
        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath))) {
            for (String l : lines) writer.println(l);
        }
        response.sendRedirect("viewBookings.jsp");
        return;
    }
    // Pre-fill
    String[] booking = null;
    try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts[0].equals(id)) { booking = parts; break; }
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Booking</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-black text-white font-sans">
<div class="min-h-screen flex items-center justify-center p-6">
    <div class="bg-gray-800 p-8 rounded-2xl shadow-lg w-full max-w-md">
        <h2 class="text-2xl font-bold mb-6 text-center">Update Booking</h2>
        <form method="post" action="update.jsp?id=<%=id%>">
            <div class="mb-4">
                <label for="event" class="block text-sm font-medium mb-1">Event Name</label>
                <input id="event" name="event" type="text"
                       value="<%=booking[1]%>"
                       class="w-full px-3 py-2 rounded-lg bg-gray-700 border border-gray-600 focus:outline-none focus:border-blue-500"/>
            </div>
            <div class="mb-4">
                <label for="type" class="block text-sm font-medium mb-1">Type</label>
                <input id="type" name="type" type="text"
                       value="<%=booking[2]%>"
                       class="w-full px-3 py-2 rounded-lg bg-gray-700 border border-gray-600 focus:outline-none focus:border-blue-500"/>
            </div>
            <div class="mb-4">
                <label for="date" class="block text-sm font-medium mb-1">Date</label>
                <input id="date" name="date" type="date"
                       value="<%=booking[3]%>"
                       class="w-full px-3 py-2 rounded-lg bg-gray-700 border border-gray-600 focus:outline-none focus:border-blue-500"/>
            </div>
            <div class="mb-4">
                <label for="location" class="block text-sm font-medium mb-1">Location</label>
                <input id="location" name="location" type="text"
                       value="<%=booking[4]%>"
                       class="w-full px-3 py-2 rounded-lg bg-gray-700 border border-gray-600 focus:outline-none focus:border-blue-500"/>
            </div>
            <div class="mb-6">
                <label for="photographer" class="block text-sm font-medium mb-1">Photographer</label>
                <input id="photographer" name="photographer" type="text"
                       value="<%=booking[5]%>"
                       class="w-full px-3 py-2 rounded-lg bg-gray-700 border border-gray-600 focus:outline-none focus:border-blue-500"/>
            </div>
            <div class="flex justify-between">
                <button type="submit"
                        class="bg-blue-600 hover:bg-blue-700 px-4 py-2 rounded-lg">
                    Update
                </button>
                <a href="viewBookings.jsp"
                   class="bg-gray-600 hover:bg-gray-700 px-4 py-2 rounded-lg">
                    Cancel
                </a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
