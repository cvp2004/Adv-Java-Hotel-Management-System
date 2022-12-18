package pkgbean;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.jsp.JspWriter;

public class Room implements Serializable {

    private int roomid;
    private String roomno;
    private int capacity;
    private int rate;
    private String status;
    private int currentbookingid;

    private static Connection con;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public Room() {
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public String getRoomno() {
        return roomno;
    }

    public void setRoomno(String roomno) {
        this.roomno = roomno;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCurrentbookingid() {
        return currentbookingid;
    }

    public void setCurrentbookingid(int currentbookingid) {
        this.currentbookingid = currentbookingid;
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

    public static ResultSet getRoomStatus() throws Exception {

        String sql = "select * from room_status";

        connect();

        ps = con.prepareStatement(sql);

        rs = ps.executeQuery();

        return (rs);

    }

    public void getRoomDetails() throws Exception {

        int rid = this.getRoomid();

        this.connect();

        String sql = "SELECT room_no, capacity, rate, status, current_booking_id FROM hoteldb.room where room_id = ?";

        ps = con.prepareStatement(sql);
        ps.setInt(1, this.getRoomid());

        rs = ps.executeQuery();

        if (rs.next()) {
            roomno = rs.getString("room_no");
            capacity = rs.getInt("capacity");
            rate = rs.getInt("rate");
            status = rs.getString("status");
            currentbookingid = rs.getInt("current_booking_id");
        }

        disconnect();

    }

    public void updateStatus(String s) throws Exception {

        String sql = "Update room_status set status='" + s + "' where room_id=?";

        connect();

        ps = con.prepareStatement(sql);
        ps.setInt(1, roomid);

        ps.executeUpdate();
    }
}
