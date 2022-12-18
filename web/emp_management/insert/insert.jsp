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
                font-size: 16;
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
            <br/>
            <h2 style="color: crimson"><u><b>REGISTER A NEW EMPLOYEE</b></u></h2>
                <form action="http://localhost:7070/HotelManagementSystem/emp_management/insert/insertprocess.jsp" method="post">
                    <table>
                        <tr>
                            <td><b>Employee Name</b></td>
                            <td><input type="text" name="txt_ename" style="width: 100%" autocomplete="off"/></td>
                        </tr>
                        <br/>
                        <tr>
                            <td><b>Password</b></td>
                            <td><input type="password" name="txt_pass" style="width: 100%" autocomplete="off"/></td>
                        </tr>
                        <br/>
                        <tr>
                            <td></td>
                            <td><input type="submit" name="btn_insert" value="REGISTER" style="width: 100%"/></td>
                        </tr>
                        <br/> 
                    </table>
                </form>
            </center>
        </body>
    </html>
