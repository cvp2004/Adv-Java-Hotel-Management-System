<html>
    <body>
        <%!
            int booking_id = 0;
        %>

        <%

            booking_id = Integer.parseInt(request.getParameter("booking_id"));

        %>

        <jsp:useBean id="x" class="pkgbean.Booking" scope="page">
            <jsp:setProperty name="x" property="bookingid" value="<%=booking_id%>"/>
        </jsp:useBean>

        <%

            try {
                boolean result;
                result = x.checkout();
                
                if(result) {
                
                
                
        %>

        <div style="font-family: calibri;font-size: 20px;">
            <center>
                <br/>
                <font face='calibri' size='5pt' color='green'><u>Customer Successfully Checked-Out !!</u></font><br/><br/>
                <br/>
            </center>
        </div>

        <%
                } else {
                    
        %>

        <div style="font-family: calibri;font-size: 20px;">
            <center>
                <font face='calibri' size='5pt' color='red'><u>Checked-Out Failed!!</u></font><br/><br/>
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
