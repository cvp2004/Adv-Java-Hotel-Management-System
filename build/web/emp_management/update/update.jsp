<%@ page import="java.sql.*"%>

<html>
    <body>
        <%!
            int txt_empno = 0, result;
            String txt_ename = "", txt_pass;
        %>

        <%
                txt_empno = Integer.parseInt(request.getParameter("txt_empno"));
    
                try {
        
                    ResultSet rs = pkgbean.Employee.getEmployeeDetails(txt_empno);
            
                    if(rs.next()) {
                        txt_ename = rs.getString("employee_name");
                        txt_pass = rs.getString("password");
                    }
        
                    }
                    catch(Exception ex) {
                        out.println(ex);
                    }

        %>

    <center>
        <br/>
        <form action="updateprocessbean.jsp" method="post">
            <h2><font size="5pt" color="crimson"><u><b>UPDATE RECORD</b></u></font></h2>
            <br/>
            <table>
                <tr>
                    <td>Employee ID</td>
                    <td><input type="text" name="txt_empno" value='<%=txt_empno%>' readonly/></td>
                </tr>
                <tr>
                    <td>Employee Name</td>
                    <td><input type="text" name="txt_ename" value='<%=txt_ename%>'/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="txt_pass" value='<%=txt_pass%>'/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="UPDATE" name="btn_update" style='width: 100%'/></td>
                </tr>    
            </table>
        </form>
    </center>        

</body>
</html>
