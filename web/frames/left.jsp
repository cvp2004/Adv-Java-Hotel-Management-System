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
    </head>
    <body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="">
        <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:100%">

            <h3 class="w3-bar-item"  style="text-align: center"><u>Links</u></h3>


            <div class="w3-dropdown-hover">
                <button class="w3-button w3-bar-item w3-round w3-padding-small" style="text-align: center">Booking</button>

                <div class="w3-dropdown-content w3-bar-block w3-border w3-round w3-padding-small">
                    <a href="http://localhost:7070/HotelManagementSystem/booking_management/insert/insert.jsp" target="frame_right" 
                       class="w3-button w3-bar-item w3-button w3-round w3-padding-small" style="text-align: center">New Booking</a>
                    <a href="http://localhost:7070/HotelManagementSystem/booking_management/showrecords.jsp" target="frame_right" 
                       class="w3-button w3-bar-item w3-button w3-round w3-padding-small" style="text-align: center">View Current Bookings</a>
                    <a href="http://localhost:7070/HotelManagementSystem/booking_management/archive/showarchiverecords.jsp" target="frame_right" class="w3-button w3-bar-item w3-button w3-round w3-padding-small" style="text-align: center">Booking Archive</a>
                </div>
            </div>

<!--            <div class="w3-dropdown-hover">
                <button class="w3-button w3-bar-item w3-round w3-padding-small" style="text-align: center">Billing</button>

                <div class="w3-dropdown-content w3-bar-block w3-border w3-round w3-padding-small">
                    <a href="http://localhost:7070/HotelManagementSystem/billing_management/insert/insert.jsp" target="frame_right" 
                       class="w3-button w3-bar-item w3-button w3-round w3-padding-small" style="text-align: center">New Bill</a>
                    <a href="http://localhost:7070/HotelManagementSystem/billing_management/showrecords.jsp" target="frame_right" 
                       class="w3-button w3-bar-item w3-button w3-round w3-padding-small" style="text-align: center">View Billing Details</a>
                </div>
            </div>-->

            <a href="http://localhost:7070/HotelManagementSystem/room_management/roomstatus.jsp" target="frame_right" style="text-align: center"
               class="w3-bar-item w3-button w3-round w3-padding-small" style="text-align: center">Room Status</a>


            <a href="http://localhost:7070/HotelManagementSystem/customer_management/customerdetails.jsp" target="frame_right" style="text-align: center"
               class="w3-bar-item w3-button w3-round w3-padding-small" style="text-align: center">Customer Details</a>


            <div class="w3-dropdown-hover">
                <button class="w3-button w3-bar-item w3-round w3-padding-small" style="text-align: center">Employee</button>

                <div class="w3-dropdown-content w3-bar-block w3-border w3-round w3-padding-small">
                    <a href="http://localhost:7070/HotelManagementSystem/emp_management/insert/insert.jsp" target="frame_right" 
                       class="w3-button w3-bar-item w3-button w3-round w3-padding-small" style="text-align: center">Register Employee</a>
                    <a href="http://localhost:7070/HotelManagementSystem/emp_management/showrecords.jsp" target="frame_right" 
                       class="w3-button w3-bar-item w3-button w3-round w3-padding-small" style="text-align: center">View Employee Details</a>
                </div>
            </div>

            <a href="http://localhost:7070/HotelManagementSystem/user_management/logout/logoutprocess.jsp" target="_top" style="text-align: center"
               class="w3-bar-item w3-button w3-round w3-padding-small" style="text-align: center">Log Out</a>

        </div>
    </body>
</html>