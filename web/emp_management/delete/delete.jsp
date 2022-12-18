<%@ page import="java.sql.*"%>

<html>
    <body>
        <%!
            int txt_empid = 0, result;
            String txt_ename = "", txt_pass = "";
        %>

        <%
                txt_empid = Integer.parseInt(request.getParameter("txt_empno"));
    
                try {
        
                    ResultSet rs = pkgbean.Employee.getEmployeeDetails(txt_empid);
            
                    if(rs.next()) {
                        txt_ename = rs.getString("employee_name");
                        txt_pass = rs.getString("password");
                    }
        
                    }
                    catch(Exception ex) {
                        out.println(ex);
                    }

        %>

        <jsp:useBean id="x" class="pkgbean.Employee" scope="page">
            <jsp:setProperty name="x" property="empid" value="<%=txt_empid%>"/>
            <jsp:setProperty name="x" property="empname" value="<%=txt_ename%>"/>
            <jsp:setProperty name="x" property="password" value="<%=txt_pass%>"/>
        </jsp:useBean>


    <center>
        <br/>
        <form action="deleteprocessbean.jsp" method="post">
            <h2><font size="5pt" color="crimson"><u><b>DELETE RECORD</b></u></font></h2>
            <br/>
            <table>
                <tr>
                    <td>Employee ID</td>
                    <td><input type="text" readonly name="txt_empno" value='<jsp:getProperty name="x" property="empid"/>' readonly/></td>
                </tr>
                <tr>
                    <td>Employee Name</td>
                    <td><input type="text" name="txt_ename" value='<jsp:getProperty name="x" property="empname"/>' readonly/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="txt_job" value='<jsp:getProperty name="x" property="password"/>' readonly/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Delete" name="btn_delete" style='width: 100%'/></td>
                </tr>    
            </table>
        </form>
    </center>

</body>
</html>