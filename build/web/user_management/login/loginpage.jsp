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
        </head>
        <body>

            <div>
                <center>
                    <br/><br/><h2 style="color: crimson;
                                  font-family: sans-serif"><u><b>LOGIN PAGE</b></u></h2><br/><br/>
                                  <form action="loginprocess.jsp" method="post">
                                      <table class = "gfg">
                                          <tr>
                                              <td class="bold" style="font-family: sans-serif"><b>Employee ID</b></td>
                                              <td><input type="number" name="txt_eid" min="1" max="10" style="width: 100%;
                                                  font-family: sans-serif"  height="48" autocomplete="off"/></td>
                                          </tr>
                                          <tr>
                                              <td class="bold" style="font-family: sans-serif;
                                              text-align:right"><b>Password</b></td>
                                              <td style="height:50px;"><input type="password" name="txt_pass" style="width: 100%;
                                                  font-family: sans-serif"  height="48" autocomplete="off"/></td>
                                          </tr>
                                          <tr>
                                              <td></td>
                                              <td><input type="submit" name="btn_login" value="LOGIN" style="width: 100%;
                                                  font-family: sans-serif;
                                                  font-weight: 500;
                                                  font-size: 14"/></td>
                                          </tr>
                                      </table>
                                  </form>
                    </center>

                </div>

            </body>
        </html>
        