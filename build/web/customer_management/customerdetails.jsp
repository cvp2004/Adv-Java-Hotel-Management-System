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
        <h2 style="color: crimson"><u><b>CUSTOMER DETAILS</b></u></h2>

        <table class="w3-table-all">

            <tr>
                <td><b>CUSTOMER ID</b></td>
                <td><b>CUSTOMER NAME</b></td>
                <td><b>EMAIL</b></td>
                <td><b>PHONE NO.</b></td>
            </tr>

            <%

                ResultSet rs = pkgbean.Customer.showRecords();

                while (rs.next()) {

                    String cid = rs.getString("customer_id");
                    String cname = rs.getString("customer_name");
                    String email = rs.getString("email_id");
                    String phno = rs.getString("phone_no");

            %>

            <tr>
                <td><%=cid%></td>
                <td><%=cname%></td>
                <td><%=email%></td>
                <td><%=phno%></td>
            </tr>
            <%
                }
                rs.close();
                pkgbean.Customer.disconnect();
            %>

        </table>

    </center>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>
