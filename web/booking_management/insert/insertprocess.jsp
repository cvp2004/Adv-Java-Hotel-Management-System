<%@page import="pkgbean.Room"%>
<%@page import="pkgbean.Booking"%>
<%@page import="pkgbean.Customer"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<html>
    <body>
        <%
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            
            int roomid = Integer.parseInt(request.getParameter("txt_roomid"));
            String checkindate = request.getParameter("txt_chkin_date");
            String checkoutdate = request.getParameter("txt_chkout_date");
            
            String cname = request.getParameter("txt_cname");
            String phno = request.getParameter("txt_phno");
            String emailid = request.getParameter("txt_email");
            
            Customer c = new Customer();
            c.setCustname(cname);
            c.setPhoneno(phno);
            c.setEmailid(emailid);
        
            boolean b1 = c.insert();
            
            int cid = c.getCustid();
        
            Booking b = new Booking();
            b.setCustomerid(cid);
            b.setRoomid(roomid);
            b.setCheckindate(checkindate);
            b.setCheckoutdate(checkoutdate);
            
            boolean b2 = b.insert();
            
            Room  r = new Room();
            r.setRoomid(roomid);
            r.getRoomDetails();
            r.updateStatus("OCCUPIED");
            r.setCurrentbookingid(Booking.getLatestBookingId());

            boolean res = b1 && b2;
            if(res) {

        %>

        <div style="font-family: calibri;font-size: 20px;">
            <center>
                <br/>
                <font face='calibri' size='5pt' color='green'><u>Booking Confirmed !!</u></font><br/><br/>
                <br/>
                <br/>
                <table>
                    <tr>
                        <td>Booking Id</td>
                        <td><input type="text" value="<%=b.getBookingid()%>" style="width: 100%" readonly/></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="bold"><b><u>Customer Details</u></b></td>
                    </tr>
                    <tr>
                        <td>Customer ID</td>
                        <td><input type="text" value="<%=c.getCustid()%>" style="width: 100%" autocomplete="off" readonly/></td>
                    </tr>
                    <tr>
                        <td>Customer Name</td>
                        <td><input type="text" value="<%=c.getCustname()%>" style="width: 100%" autocomplete="off" readonly/></td>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <td><input type="text" value="<%=c.getPhoneno()%>"  style="width: 100%" autocomplete="off" readonly/></td>
                    </tr>
                    <tr>
                        <td>Email Id</td>
                        <td><input type="text" value="<%=c.getEmailid()%>" style="width: 100%" readonly/></td>
                    </tr>   
                    <tr>
                        <td colspan="2" class="bold"><b><u>Room Details</u></b></td>
                    </tr>
                    <tr>
                        <td>Room Id</td>
                        <td><input type="text" value="<%=b.getRoomid()%>" style="width: 100%" readonly/></td>
                    </tr>
                    <tr>
                        <td>Expected Check-In Date</td>
                        <td><input type="text" value="<%=b.getCheckindate()%>" style="width: 100%" readonly/></td>
                    </tr>
                    <tr>
                        <td>Expected Check-Out Date</td>
                        <td><input type="text" value="<%=b.getCheckoutdate()%>" style="width: 100%" readonly/></td>
                    </tr>
                </table>
                <br/>
            </center>
        </div>

        <%
                
        } else {

        %>

        <div style="font-family: calibri;font-size: 20px;">
            <center>
                <font face='calibri' size='5pt' color='red'><u>Booking not Confirmed !!</u></font><br/><br/>
            </center>
        </div>

        <%

        }
        %>

    </body>
</html>
