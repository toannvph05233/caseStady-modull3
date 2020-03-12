package dao;


import model.Image;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ImageDao {
    public static void addArea(Image img) {
        String QUERRY = "insert image values (?,?);";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement= connectMySql.conn.prepareStatement(QUERRY);
            preparedStatement.setString(1,img.getImageName());
            preparedStatement.setInt(2,img.getRoomId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static ArrayList<Image> getImgByRoomId(int roomId) {
        ArrayList<Image> ar = new ArrayList<>();
        String QUERRY = "select roomimage from area where roomID = ?;";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connectMySql.conn.prepareStatement(QUERRY);
            preparedStatement.setInt(1,roomId);
            ResultSet rs=preparedStatement.executeQuery();
            while (rs.next()) {
                String roomimage = rs.getString("roomimage");
                ar.add(new Image(roomimage,roomId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ar;
    }
//    public static void main(String[] args) {
//
//    }
}
