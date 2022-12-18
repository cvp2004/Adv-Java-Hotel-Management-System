<html>
    <head>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    </head>
    <body>

        <%
            int eid = Integer.parseInt(request.getParameter("txt_eid"));
            String pass = request.getParameter("txt_pass");
        %>

        <jsp:useBean id="emp" class="pkgbean.Employee" scope="page">
            <jsp:setProperty name="emp" property="empid" value="<%=eid%>"/>
            <jsp:setProperty name="emp" property="password" value="<%=pass%>"/>
        </jsp:useBean>

        <%
            
            boolean isEmployee = emp.checkEmpDetails();
            
            if(isEmployee) {
            
                session .setAttribute("empid", eid);
                session.setAttribute("empname", emp.getEmpname());
                
                response.sendRedirect("http://localhost:7070/HotelManagementSystem/hms.jsp");
            } else {
                out.println("<h2><font color='red'>!! Invalid Login Credentials !!</font></h2>");
            }

        %>

    </body>
</html>
