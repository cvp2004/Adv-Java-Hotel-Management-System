<html>
    <%
        session.removeAttribute("empid");
        session.removeAttribute("empname");
        
        response.sendRedirect("http://localhost:7070/HotelManagementSystem/user_management/login/loginpage.jsp");
    %>
</hmtl>