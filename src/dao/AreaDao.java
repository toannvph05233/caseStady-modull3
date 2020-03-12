package dao;

import model.Area;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AreaDao {
    public static void addArea(Area area) {
        String QUERRY = "insert area values (?);";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement= connectMySql.conn.prepareStatement(QUERRY);
            preparedStatement.setString(1,area.getArea());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static ArrayList<Area> getAllArea() {
        ArrayList<Area> ar = new ArrayList<>();
        String QUERRY = "select * from area;";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connectMySql.conn.prepareStatement(QUERRY);
            ResultSet rs=preparedStatement.executeQuery();
            while (rs.next()) {
                String area = rs.getString("area");
                ar.add(new Area(area));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return ar;
    }
    public static void main(String[] args) {
//        Area area = new Area("Hà Nội");
//        addArea(area);
    }
}
