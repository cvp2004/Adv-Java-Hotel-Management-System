package pkgbean;

import java.io.Serializable;
import java.sql.*;

public class Employee implements Serializable {

    private int empid;
    private String empname;
    private String password;

    private static Connection con;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public Employee() {
    }

    public int getEmpid() {
        return empid;
    }

    public void setEmpid(int empid) {
        this.empid = empid;
    }

    public String getEmpname() {
        return empname;
    }

    public void setEmpname(String empname) {
        this.empname = empname.toUpperCase().trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public boolean checkEmpDetails() throws Exception {

        String sql = "select employee_name, password from employee where employee_id=?";

        String temp_pass = "";

        connect();

        ps = con.prepareStatement(sql);
        ps.setInt(1, empid);

        rs = ps.executeQuery();

        if (rs.next()) {
            this.setEmpname(rs.getString("employee_name"));
            temp_pass = rs.getString("password");
        }

        disconnect();

        if (temp_pass.equals(this.getPassword())) {
            return (true);
        } else {
            return (false);
        }
    }

    public boolean insert() throws Exception {

        String sql = "insert into employee (employee_id, employee_name, password) values (?, ?, ?)";

        connect();

        ps = con.prepareStatement(sql);
        ps.setInt(1, this.empid);
        ps.setString(2, this.empname);
        ps.setString(3, this.password);

        int res = ps.executeUpdate();

        sql = "select employee_id from employee where employee_name=?";

        ps = con.prepareStatement(sql);
        ps.setString(1, this.empname);
        rs = ps.executeQuery();

        if (rs.next()) {
            this.setEmpid(rs.getInt("employee_id"));
        }

        disconnect();

        if (res == 1) {
            return (true);
        } else {
            return (false);
        }

    }

    public static ResultSet showRecords() throws Exception {

        String sql = "select employee_id, employee_name, password from employee";

        connect();

        ps = con.prepareStatement(sql);

        rs = ps.executeQuery();

        ResultSet rs1 = rs;

        return rs1;

    }

    public static ResultSet getEmployeeDetails(int temp_empid) throws Exception {

        String sql = "select employee_name, password from employee where employee_id=?";

        connect();

        ps = con.prepareStatement(sql);
        ps.setInt(1, temp_empid);

        rs = ps.executeQuery();

        return (rs);

    }

    public boolean updateEmployeeDetails() throws Exception {
        String sql = "update employee set employee_name=?, password=? where employee_id=?";

        connect();

        ps = con.prepareStatement(sql);
        ps.setString(1, this.empname);
        ps.setString(2, this.password);
        ps.setInt(3, this.empid);

        int res = ps.executeUpdate();

        if (res == 1) {
            return (true);
        } else {
            return (false);
        }
    }

    public boolean deleteEmployee() throws Exception {

        String sql = "delete from employee where employee_id=?";

        connect();

        ps = con.prepareStatement(sql);
        ps.setInt(1, this.empid);

        int res = ps.executeUpdate();

        if (res == 1) {
            return (true);
        } else {
            return (false);
        }

    }

}
