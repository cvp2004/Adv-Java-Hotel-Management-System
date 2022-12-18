<%@page import="java.sql.ResultSet"%>
<html>
    <head>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.rtl.min.css" 
              integrity="sha384-7mQhpDl5nRA5nY9lr8F1st2NbIly/8WqhjTp+0oFxEA/QUuvlbF6M1KXezGBh3Nb" crossorigin="anonymous">
        <script type="text/javascript">
            window.history.forward();
            function noBack()
            {
                window.history.forward();
            }
        </script>
    </head>
    <body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="" class="p-3 m-0 border-0 bd-example">

    <center>
        <br/>
        <h2 style="color: crimson"><u><b>ROOM STATUS</b></u></h2>

        <table class="w3-table-all">

            <tr>
                <td><b>ROOM ID</b></td>
                <td><b>ROOM NUMBER</b></td>
                <td><b>STATUS</b></td>
                <td><b>VIEW DETAILS</b></td>
            </tr>

            <%

                ResultSet rs = pkgbean.Room.getRoomStatus();

                while (rs.next()) {

                    String roomid = rs.getString("room_id");
                    String roomno = rs.getString("room_no");
                    String status = rs.getString("status");

            %>

            <tr>
                <td><%=roomid%></td>
                <td><%=roomno%></td>
                <%
                
                        if(status.equalsIgnoreCase("AVAILABLE")) {
                    
                %>

                <td style="color: green"><%=status%></td>

                <%
                    } else if( status.equalsIgnoreCase("OCCUPIED")) {

                %>

                <td style="color: red"><%=status%></td>

                <%

                    }

                %>
                <td>
                    
                    <%
                        if(status.equalsIgnoreCase("OCCUPIED")) {
                    %>
                    
                            <a href="http://localhost:7070/HotelManagementSystem/room_management/roomdetails.jsp?txt_roomid=<%=roomid%>" target="frame_right" style="color: blue">View Details</a>
                            
                    <%
                        }
                    %>
                </td>
            </tr>

            <%

                }
                rs.close();
                pkgbean.Room.disconnect();
            %>

        </table>

    </center>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>
