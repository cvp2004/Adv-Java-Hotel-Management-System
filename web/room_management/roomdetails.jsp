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

                int rid = Integer.parseInt(request.getParameter("txt_roomid"));
            %>
            <jsp:useBean id="x" class="pkgbean.Room" scope="page">
                <jsp:setProperty name="x" property="roomid" value="<%=rid%>"/>
            </jsp:useBean>
            <%
                x.getRoomDetails();
            
                String rno = x.getRoomno();
                
                int cbid = 112;
                cbid = x.getCurrentbookingid();
                int c = x.getCapacity();
                String s = x.getStatus();
                int r = x.getRate();
            %>

            <div>
                <center>
                    <h2 style="color: crimson"><u><b>ROOM DETAILS</b></u></h2>
                        <form action="#" method="post">
                            <table class = "gfg">
                                <tr>
                                    <td class="bold" style="font-family: sans-serif">Room ID</td>
                                    <td><input type="text" name="txt_rid" value="<%=rid%>" style="width: 100%" autocomplete="off"/></td>
                                </tr>
                                <tr>
                                    <td class="bold" style="font-family: sans-serif">Room Number</td>
                                    <td><input type="text" name="txt_rno" value="<%=rno%>" style="width: 100%" autocomplete="off"/></td>
                                </tr>
                                <tr>
                                    <td class="bold" style="font-family: sans-serif">Current Booking ID</td>
                                    <td><input type="text" name="txt_cbid" value="<%=cbid%>" style="width: 100%" autocomplete="off"/></td>
                                </tr>
                                <tr>
                                    <td class="bold" style="font-family: sans-serif">Capacity</td>
                                    <td><input type="text" name="txt_cname" value="<%=c%>" style="width: 100%" autocomplete="off"/></td>
                                </tr>
                                <tr>
                                    <td class="bold" style="font-family: sans-serif">Rate</td>
                                    <td><input type="text" name="txt_cbid" value="<%=r%>" style="width: 100%" autocomplete="off"/></td>
                                </tr>
                                <tr>
                                    <td class="bold" style="font-family: sans-serif">Status</td>
                                    <td><input type="text" name="txt_cname" value="<%=s%>" style="width: 100%" autocomplete="off"/></td>
                                </tr>
                            </table>
                        </form>
                    </center>
                </div>
            </body>
        </html>