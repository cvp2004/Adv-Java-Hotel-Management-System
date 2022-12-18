<html>
    <body>
        <%!
            int txt_empno = 0, result;
            String txt_ename = "", txt_pass = "";
        %>

        <%

            txt_empno = Integer.parseInt(request.getParameter("txt_empno"));
            txt_ename = request.getParameter("txt_ename");
            txt_pass = request.getParameter("txt_pass");

        %>

        <jsp:useBean id="x" class="pkgbean.Employee" scope="page">
            <jsp:setProperty name="x" property="empid" value="<%=txt_empno%>"/>
            <jsp:setProperty name="x" property="empname" value="<%=txt_ename%>"/>
            <jsp:setProperty name="x" property="password" value="<%=txt_pass%>"/>
        </jsp:useBean>

        <%

            try {
                boolean result;
                result = x.updateEmployeeDetails();
                
                if(result) {
                
        %>

        <div style="font-family: calibri;font-size: 20px;">
            <center>
                <br/>
                <font face='calibri' size='5pt' color='green'><u>Record Updated !!</u></font><br/><br/>
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
                    <tr>
                        <td><b>Password</b></td>
                        <td><input type="text" value="<jsp:getProperty name="x" property="password"/>" style="width: 100%" readonly/></td>
                    </tr>
                    <br/>
                </table>
                <br/>
            </center>
        </div>

        <%
                }else {
                    
        %>

        <div style="font-family: calibri;font-size: 20px;">
            <center>
                <font face='calibri' size='5pt' color='red'><u>Record Not Updated !!</u></font><br/><br/>
            </center>
        </div>

        <%
                }
            
            } catch(Exception ex) {
                out.println(ex);
            }

        %>
    </body>
</html>
