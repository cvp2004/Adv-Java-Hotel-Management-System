<%@page import="java.sql.ResultSet"%>

<html>
    <head>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script type="text/javascript">
            window.history.forward();
            function noBack()
            {
                window.history.forward();
            }
        </script>
        <style>
            a:link {
                color: blue;
                text-decoration: underline;
            }

            /* visited link */
            a:visited {
                color: purple;
                text-decoration: underline;
            }

            /* mouse over link */
            a:hover {
                color: green;
                text-decoration: none;
            }

            /* selected link */
            a:active {
                color: blue;
                text-decoration: none;
            }
        </style>
    </head>
    <body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="">
    <center>
        <br/>
        <h2 style="color: crimson"><u><b>ARCHIVE BOOKING DETAILS</b></u></h2>

        <table class="w3-table-all">

            <tr>
                <td><b>BOOKING ID</b></td>
                <td><b>ROOM ID</b></td>
                <td><b>VIEW BOOKING DETAILS</b></td>
                <td><b>VIEW CUSTOMER DETAILS</b></td>
            </tr>

            <%

                ResultSet rs = pkgbean.Booking.getArchive();

                while (rs.next()) {

                    String booking_id = rs.getString(1);
                    String room_id = rs.getString(2);

            %>

            <tr>
                <td><%=booking_id%></td>
                <td><%=room_id%></td>
                <td><a href="http://localhost:7070/HotelManagementSystem/booking_management/bookingdetails.jsp?booking_id=<%=booking_id%>" target="frame_right" style="color: blue">View Details</a></td>
                <td><a href="http://localhost:7070/HotelManagementSystem/booking_management/checkout/checkoutprocess.jsp?booking_id=<%=booking_id%>" target="frame_right" style="color: blue">View Details</a></td>
            </tr>

            <%

                }
                rs.close();
                pkgbean.Booking.disconnect();
            %>

        </table>

    </center>
</body>
</html>
