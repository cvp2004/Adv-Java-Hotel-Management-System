<html>
    <body>
        <%
            String ename = request.getParameter("txt_ename");
            String pass = request.getParameter("txt_pass");
        %>

        <jsp:useBean id="x" class="pkgbean.Employee" scope="page">
            <jsp:setProperty name="x" property="empname" value="<%=ename%>"/>
            <jsp:setProperty name="x" property="password" value="<%=pass%>"/>
        </jsp:useBean>

        <%

            try {
            
                boolean res = x.insert();
                
                if(res) {
                
        %>

        <div style="font-family: calibri;font-size: 20px;">
            <center>
                <br/>
                <font face='calibri' size='5pt' color='green'><u>Record Inserted !!</u></font><br/><br/>
                <table>
                    <tr>
                        <td><b>Employee ID</b></td>
                        <td><input type="text" value="<jsp:getProperty name="x" property="empid"/>" style="width: 100%" readonly/></td>
                    </tr>
                    <br/>
                    <tr>
                        <td><b>Employee Name</b></td>
                        <td><input type="text" value="<jsp:getProperty name="x" property="empname"/>" style="width: 100%" readonly/></td>
                    </tr>
                    <br/>
                    <br/>
                </table>
                <br/>
            </center>
        </div>

        <%
                
        } else {

        %>

        <div style="font-family: calibri;font-size: 20px;">
            <center>
                <font face='calibri' size='5pt' color='red'><u>Record Not Inserted !!</u></font><br/><br/>
            </center>
        </div>

        <%

        }
                
            
    } catch (Exception ex) {
        out.println(ex);
    }

        %>

    </body>
</html>
