package dao;

import model.Room;

import java.sql.*;
import java.util.ArrayList;

public class RoomDao {
    public static void deleteByID(int id) {
        String querry = "delete from room where room.roomID = ?; ";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connectMySql.conn.prepareStatement(querry);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void disableByID(int id) {
        String querry = "update room set roomstatus = false where roomID = ?;";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connectMySql.conn.prepareStatement(querry);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void enableByID(int id) {
        String querry = "update room set roomstatus = true where roomID = ?;";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connectMySql.conn.prepareStatement(querry);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static int getMaxID() {
        String querry ="select max(roomID) from room;";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        try {
            Statement statement = connectMySql.conn.createStatement();
            ResultSet rs = statement.executeQuery(querry);
            int id=0;
            while (rs.next()) {
                 id = rs.getInt("max(roomID)");
            }
            return id;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }


    public static ArrayList<Room> getAllRoom() {
        ArrayList<Room> ar = new ArrayList();
        String querry = "select * from room;";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        try {
            PreparedStatement preparedStatement = connectMySql.conn.prepareStatement(querry);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int roomId = resultSet.getInt("roomID");
                String roomTitle = resultSet.getString("roomTitle");
                String roomContent = resultSet.getString("roomContent");
                String userName = resultSet.getString("userName");
                String area = resultSet.getString("area");
                String tag = resultSet.getString("tag");
                Date createddate = resultSet.getDate("createddate");
                Boolean roomstatus = resultSet.getBoolean("roomstatus");
                String introduce = resultSet.getString("introduce");
                Float roomprice = resultSet.getFloat("roomprice");
                ar.add(new Room(roomId,roomTitle,createddate,roomprice,tag,area,introduce,userName,roomContent,roomstatus));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ar;
    }

    public static ArrayList<Room> getAllRoomDisplay() {
        ArrayList<Room> ar = new ArrayList();
        String querry = "select * from room where roomstatus = true;";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        try {
            PreparedStatement preparedStatement = connectMySql.conn.prepareStatement(querry);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int roomId = resultSet.getInt("roomID");
                String roomTitle = resultSet.getString("roomTitle");
                String roomContent = resultSet.getString("roomContent");
                String userName = resultSet.getString("userName");
                String area = resultSet.getString("area");
                String tag = resultSet.getString("tag");
                Date createddate = resultSet.getDate("createddate");
                Boolean roomstatus = resultSet.getBoolean("roomstatus");
                String introduce = resultSet.getString("introduce");
                Float roomprice = resultSet.getFloat("roomprice");
                ar.add(new Room(roomId,roomTitle,createddate,roomprice,tag,area,introduce,userName,roomContent,roomstatus));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ar;
    }
    public static Room getRoomDisplayById(int roomid) {
        String querry = "select * from room where roomstatus = true and roomID = ?;";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        Room room = null;
        try {
            PreparedStatement preparedStatement = connectMySql.conn.prepareStatement(querry);
            preparedStatement.setInt(1,roomid);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int roomId = resultSet.getInt("roomID");
                String roomTitle = resultSet.getString("roomTitle");
                String roomContent = resultSet.getString("roomContent");
                String userName = resultSet.getString("userName");
                String area = resultSet.getString("area");
                String tag = resultSet.getString("tag");
                Date createddate = resultSet.getDate("createddate");
                Boolean roomstatus = resultSet.getBoolean("roomstatus");
                String introduce = resultSet.getString("introduce");
                Float roomprice = resultSet.getFloat("roomprice");
                room =new Room(roomId,roomTitle,createddate,roomprice,tag,area,introduce,userName,roomContent,roomstatus);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return room;
    }

    public static void addRoomToDb(Room room) {
        String QUERRY = "insert room(roomTitle,roomContent,userName,area,tag,createddate,roomstatus,introduce,roomprice) values (?,?,?,?,?,?,?,?,?);";
        String querry = "insert room(roomTitle,roomContent,userName,area,createddate,roomstatus,introduce,roomprice) values (?,?,?,?,?,?,?,?);";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        PreparedStatement preparedStatement = null;
        if (room.getTag()!=null) {
            try {
                preparedStatement = connectMySql.conn.prepareStatement(QUERRY);
                preparedStatement.setString(1, room.getTitle());
                preparedStatement.setString(2, room.getRoomContent());
                preparedStatement.setString(3, room.getUserName());
                preparedStatement.setString(4, room.getArea());
                preparedStatement.setString(5, room.getTag());
                preparedStatement.setDate(6, room.getCreateDate());
                preparedStatement.setBoolean(7, room.isRoomStatus());
                preparedStatement.setString(8, room.getRoomIntroduce());
                preparedStatement.setFloat(9, room.getRoomPrice());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else{
            try {
                preparedStatement = connectMySql.conn.prepareStatement(querry);
                preparedStatement.setString(1, room.getTitle());
                preparedStatement.setString(2, room.getRoomContent());
                preparedStatement.setString(3, room.getUserName());
                preparedStatement.setString(4, room.getArea());
                preparedStatement.setDate(5, room.getCreateDate());
                preparedStatement.setBoolean(6, room.isRoomStatus());
                preparedStatement.setString(7, room.getRoomIntroduce());
                preparedStatement.setFloat(8, room.getRoomPrice());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }

    public static void main(String[] args) {
//        Room room = new Room("khachsan1",Date.valueOf("2020-03-09"),9000f,"Hà Nội","test1","tu","them anh vao nhe1");
//        addRoomToDb(room);
//        System.out.println(getAllRoomDisplay().get(0).getTitle());
//        Room room = RoomDao.getRoomDisplayById(7);
//        System.out.println(room.getRoomContent());
        System.out.println(getMaxID());
    }
}
