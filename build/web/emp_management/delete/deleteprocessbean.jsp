<html>
    <body>
        <%!
            int txt_empid = 0, result;
        %>

        <%

            txt_empid = Integer.parseInt(request.getParameter("txt_empno"));

        %>

        <jsp:useBean id="x" class="pkgbean.Employee" scope="page">
            <jsp:setProperty name="x" property="empid" value="<%=txt_empid%>"/>
        </jsp:useBean>

        <%

            try {
                boolean result;
                result = x.deleteEmployee();
                
                if(result) {
                
        %>

        <div style="font-family: calibri;font-size: 20px;">
            <center>
                <br/>
                <font face='calibri' size='5pt' color='green'><u>Record Deleted !!</u></font><br/><br/>

                <br/>
            </center>
        </div>

        <%
                } else {
                    
        %>

        <div style="font-family: calibri;font-size: 20px;">
            <center>
                <font face='calibri' size='5pt' color='red'><u>Record Not Deleted !!</u></font><br/><br/>
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
