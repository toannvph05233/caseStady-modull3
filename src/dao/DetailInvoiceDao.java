package dao;

import model.DetailInvoice;
import model.Image;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DetailInvoiceDao {
    public static void addDetailInvoice(DetailInvoice detailInvoice) {
        String QUERRY = "insert detailinvoice values (?,?,?,?,?);";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connectMySql.conn.prepareStatement(QUERRY);
            preparedStatement.setInt(1,detailInvoice.getInvoiceID());
            preparedStatement.setInt(2,detailInvoice.getRoomID());
            preparedStatement.setFloat(3,detailInvoice.getRoomprice());
            preparedStatement.setDate(4,detailInvoice.getRentStartDate());
            preparedStatement.setDate(5,detailInvoice.getRentEndDate());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static ArrayList<DetailInvoice> getListInvoiceDetail(int invoiceID) {
        ArrayList<DetailInvoice> ar = new ArrayList<>();
        String QUERRY = "select * from detailinvoice where invoiceID = ?;";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connectMySql.conn.prepareStatement(QUERRY);
            preparedStatement.setInt(1,invoiceID);
            ResultSet rs=preparedStatement.executeQuery();
            while (rs.next()) {
                int roomID = rs.getInt("roomID");
                float roomprice = rs.getFloat("roomprice");
                Date rentStartDate = rs.getDate("rentStartDate");
                Date rentEndDate = rs.getDate("rentEndDate");
                ar.add(new DetailInvoice(invoiceID,roomID,roomprice,rentStartDate,rentEndDate));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ar;
    }

//    public static void main(String[] args) {
//        DetailInvoice detailInvoice = new DetailInvoice(1,3,9000f,Date.valueOf("2020-03-11"),Date.valueOf("2020-03-20"));
//        addDetailInvoice(detailInvoice);
//        ArrayList<DetailInvoice> ar = getListInvoiceDetail(1);
//        System.out.println(ar.size());
//    }
}
