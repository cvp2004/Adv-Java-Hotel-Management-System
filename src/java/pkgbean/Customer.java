package pkgbean;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Customer implements Serializable {

    private int custid;
    private String custname;
    private String phoneno;
    private String emailid;

    private static Connection con;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public Customer() {
    }

    public int getCustid() {
        return custid;
    }

    public void setCustid(int custid) {
        this.custid = custid;
    }

    public String getCustname() {
        return custname;
    }

    public void setCustname(String custname) {
        this.custname = custname.trim().toUpperCase();
    }

    public String getPhoneno() {
        return phoneno;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno.trim();
    }

    public String getEmailid() {
        return emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid.trim();
    }

    public static void connect() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3307/hoteldb", "root", "Cvp_2004");
    }

    public static void disconnect() throws Exception {
        if (!con.isClosed()) {
            con.close();
        }
        if (!ps.isClosed()) {
            ps.close();
        }
        if (!rs.isClosed()) {
            rs.close();
        }
    }

    public static ResultSet showRecords() throws Exception {

        String sql = "select customer_id, customer_name, phone_no, email_id from customer";

        connect();

        ps = con.prepareStatement(sql);

        rs = ps.executeQuery();

        ResultSet rs1 = rs;

        return rs1;

    }

    public boolean insert() throws Exception {

        String sql = "insert into customer (customer_name, phone_no, email_id) values (?, ?, ?);";

        connect();

        ps = con.prepareStatement(sql);
        ps.setString(1, this.custname);
        ps.setString(2, this.phoneno);
        ps.setString(3, this.emailid);

        int res = ps.executeUpdate();

        if (res == 1) {

            sql = "select customer_id from customer where customer_name=?";

            ps = con.prepareStatement(sql);
            ps.setString(1, this.custname);
            rs = ps.executeQuery();

            if (rs.next()) {
                this.setCustid(rs.getInt("customer_id"));
            }

            disconnect();
            return (true);
        } else {
            disconnect();
            return (false);
        }
    }

}
