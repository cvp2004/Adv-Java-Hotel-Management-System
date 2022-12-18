package pkgbean;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Booking implements Serializable {

    private int bookingid;
    private int roomid;
    private int customerid;
    private String checkindate;
    private String checkoutdate;

    private static Connection con;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public Booking() {
    }

    public int getBookingid() {
        return bookingid;
    }

    public void setBookingid(int bookingid) {
        this.bookingid = bookingid;
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
    }

    public String getCheckindate() {
        return checkindate;
    }

    public void setCheckindate(String checkindate) {
        this.checkindate = checkindate;
    }

    public String getCheckoutdate() {
        return checkoutdate;
    }

    public void setCheckoutdate(String checkoutdate) {
        this.checkoutdate = checkoutdate;
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

        String sql = "select booking_id, room_id from booking order by booking_id asc";

        connect();

        ps = con.prepareStatement(sql);

        rs = ps.executeQuery();

        ResultSet rs1 = rs;

        return rs1;

    }

    public boolean insert() throws Exception {

        String sql = "insert into booking (room_id, customer_id, expected_checkin_date, expected_checkout_date) values (?,?,?,?);";

        connect();

        ps = con.prepareStatement(sql);
        ps.setInt(1, this.roomid);
        ps.setInt(2, this.customerid);
        ps.setString(3, String.valueOf(this.checkindate));
        ps.setString(4, String.valueOf(this.checkoutdate));

        int res = ps.executeUpdate();

        if (res == 1) {

            sql = "select max(booking_id) as current_bid from booking";

            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                this.setBookingid(rs.getInt("current_bid"));
            }

            disconnect();
            return (true);
        } else {
            disconnect();
            return (false);
        }

    }

    public void updateRoomstatus() throws Exception {

        String sql = "update room_status set status='OCCUPIED' where room_id=?";

        connect();

        ps = con.prepareStatement(sql);
        ps.setInt(1, this.roomid);

        int res = ps.executeUpdate();

    }

    public void getBookingDetails() throws Exception {

        int bid = this.getBookingid();

        Booking.connect();

        String sql = "SELECT booking_id, room_id, customer_id, expected_checkin_date, expected_checkout_date FROM booking where booking_id = ?";

        ps = con.prepareStatement(sql);
        ps.setInt(1, bid);

        rs = ps.executeQuery();

        if (rs.next()) {
            roomid = rs.getInt("room_id");
            customerid = rs.getInt("customer_id");
            checkindate = rs.getString("expected_checkin_date");
            checkoutdate = rs.getString("expected_checkout_date");
        }

        disconnect();

    }
    
    public boolean checkout() throws Exception {
        
        int bid = this.getBookingid();
        
        Booking.connect();
        
        String sql = "delete from booking1 where booking_id = ?";
        
        ps = con.prepareStatement(sql);
        ps.setInt(1, bid);
        
        int result = -1;
        result = ps.executeUpdate();
        
        
        
        if(result == 1) {
            
            disconnect();
            return true;
        }
        
        disconnect();
        return false;
    }
    
    public static int getLatestBookingId() throws Exception {
        
        Booking.connect();
        
        String sql = "SELECT MAX(booking_id) FROM booking";
        
        ps = con.prepareStatement(sql);
        
        rs = ps.executeQuery();
        
        int i = -1;
        
        if(rs.next()) {
            i = rs.getInt("MAX(booking_id)");
        }
        
        Booking.disconnect();
        
        return i;
    }
    
    
    public static ResultSet getArchive() throws Exception {
        
        Booking.connect();
        
        String sql = "select * from booking_archive";
        
        ps = con.prepareStatement(sql);
        
        rs = ps.executeQuery();
        
        return rs;
        
    }

}
