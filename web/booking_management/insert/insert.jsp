<html>
    <head>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <style>
            table {
                border-collapse: collapse;
            }
            td {
                text-align:left;
                padding:5px;
                font-size: 14
            }
            .bold {
                text-transform: capitalize;
                font-size: 18;
                font-style: bold;
                font-weight: 500;
                .gfg {
                    border-collapse:separate;
                    border-spacing:0 5px;
                }
            </style>
            <script type="text/javascript">
                window.history.forward();
                function noBack()
                {
                    window.history.forward();
                }
            </script>
        </head>
        <body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="">
        <center>
            <h2 style="color: crimson"><u><b>NEW BOOKING</b></u></h2>
                <form action="http://localhost:7070/HotelManagementSystem/booking_management/insert/insertprocess.jsp" method="post">
                    <br/>
                    <br/>
                    <div>
                        <table>
                            <tr>
                                <td colspan="2" class="bold"><b><u>Customer Details</u></b></td>
                            </tr>
                            <tr>
                                <td>Customer Name</td>
                                <td><input type="text" name="txt_cname" style="width: 100%" autocomplete="off"/></td>
                            </tr>
                            <tr>
                                <td>Phone Number</td>
                                <td><input type="text" name="txt_phno"  style="width: 100%" autocomplete="off"/></td>
                            </tr>
                            <tr>
                                <td>Email Id</td>
                                <td><input type="text" name="txt_email" style="width: 100%"/></td>
                            </tr>   
                            <tr>
                                <td colspan="2" class="bold"><b><u>Room Details</u></b></td>
                            </tr>
                            <tr>
                                <td>Room Id</td>
                                <td><input type="text" name="txt_roomid" style="width: 100%"/></td>
                            </tr>
                            <tr>
                                <td>Expected Check-In Date</td>
                                <td><input type="date" name="txt_chkin_date" style="width: 100%"/></td>
                            </tr>
                            <tr>
                                <td>Expected Check-Out Date</td>
                                <td><input type="date" name="txt_chkout_date" style="width: 100%"/></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" name="btn_submit" value="SUBMIT" style="width: 100%"/></td>
                            </tr>
                        </table>
                    </div>
                </form>
            </center>
        </body>
    </html>
