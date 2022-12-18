<html>
    <head>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <style>
            table {
                border-collapse: collapse;
            }
            td {
                text-align:left;
                padding:5px
            }
            .bold {
                text-transform: capitalize;
                font-size: 16pt;
                font-weight: 500;
                .gfg {
                    border-collapse:separate;
                    border-spacing:0 5px;
                }
            </style>
        </head>
        <body>

            <%

                int bookingid = Integer.parseInt(request.getParameter("booking_id"));
            %>
            <jsp:useBean id="x" class="pkgbean.Booking" scope="page">
                <jsp:setProperty name="x" property="bookingid" value="<%=bookingid%>"/>
            </jsp:useBean>
            <%
                x.getBookingDetails();

                int roomid = x.getRoomid();
                int customerid = x.getCustomerid();
                String checkindate = x.getCheckindate();
                String checkoutdate = x.getCheckoutdate();
            %>

            <div>
                <center>
                    <h2 style="color: crimson"><u><b>ROOM DETAILS</b></u></h2>
                        <form action="#" method="post">
                            <table class = "gfg">
                                <tr>
                                    <td class="bold" style="font-family: sans-serif">Room ID</td>
                                    <td><input type="text" name="txt_rid" value="<%=bookingid%>" style="width: 100%" autocomplete="off"/></td>
                                </tr>
                                <tr>
                                    <td class="bold" style="font-family: sans-serif">Room Number</td>
                                    <td><input type="text" name="txt_rno" value="<%=roomid%>" style="width: 100%" autocomplete="off"/></td>
                                </tr>
                                <tr>
                                    <td class="bold" style="font-family: sans-serif">Current Booking ID</td>
                                    <td><input type="text" name="txt_cbid" value="<%=customerid%>" style="width: 100%" autocomplete="off"/></td>
                                </tr>
                                <tr>
                                    <td class="bold" style="font-family: sans-serif">Expected Check-In Date</td>
                                    <td><input type="text" name="txt_cname" value="<%=checkindate%>" style="width: 100%" autocomplete="off"/></td>
                                </tr>
                                <tr>
                                    <td class="bold" style="font-family: sans-serif">Expected Check-Out Date</td>
                                    <td><input type="text" name="checkoutdate" value="<%=checkoutdate%>" style="width: 100%" autocomplete="off"/></td>
                                </tr>
                            </table>
                        </form>
                    </center>
                </div>
            </body>
        </html>