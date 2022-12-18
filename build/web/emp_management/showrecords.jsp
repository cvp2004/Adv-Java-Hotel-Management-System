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
        <h2 style="color: crimson"><u><b>EMPLOYEE RECORDS</b></u></h2>

        <table class="w3-table-all">

            <tr>
                <td><b>EMPLOYEE ID</b></td>
                <td><b>EMPLOYEE NAME</b></td>
                <td><b>UPDATE</b></td>
                <td><b>DELETE</b></td>
            </tr>

            <%

                ResultSet rs = pkgbean.Employee.showRecords();

                while (rs.next()) {

                    String empno = rs.getString(1);
                    String ename = rs.getString(2);

            %>

            <tr>
                <td><%=empno%></td>
                <td><%=ename%></td>
                <td><a href="http://localhost:7070/HotelManagementSystem/emp_management/update/update.jsp?txt_empno=<%=empno%>" target="frame_right" style="color: blue">Update</a></td>
                <td><a href="http://localhost:7070/HotelManagementSystem/emp_management/delete/delete.jsp?txt_empno=<%=empno%>" target="frame_right" style="color: blue">Delete</a></td>
            </tr>

            <%

                }
                rs.close();
                pkgbean.Employee.disconnect();
            %>

        </table>

    </center>
</body>
</html>
