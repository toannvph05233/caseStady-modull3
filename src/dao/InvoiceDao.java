package dao;

import model.DetailInvoice;
import model.Invoice;
import model.Room;

import java.sql.*;
import java.util.ArrayList;

public class InvoiceDao {
    public static void addInvoiceToDb(Invoice invoice) {
        String QUERRY = "insert invoice(invoiceID,userName,invoiceCreatedDate) values (?,?,?);";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement= connectMySql.conn.prepareStatement(QUERRY);
            preparedStatement.setInt(1,invoice.getInvoiceID());
            preparedStatement.setString(2,invoice.getUserName());
            preparedStatement.setDate(3, (Date) invoice.getInvoiceCreateDate());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static int getMaxID() {
        String querry ="select max(invoiceID) from invoice;";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        try {
            Statement statement = connectMySql.conn.createStatement();
            ResultSet rs = statement.executeQuery(querry);
            int id=0;
            while (rs.next()) {
                id = rs.getInt("max(invoiceID)");
            }
            return id;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }
    public static ArrayList<Invoice> getAllInvoce() {
        ArrayList<Invoice> ar = new ArrayList();
        String querry = "select * from invoice;";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        try {
            PreparedStatement preparedStatement = connectMySql.conn.prepareStatement(querry);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String userName = resultSet.getString(2);
                int invoiceID = resultSet.getInt(1);
                Date invoiceCreateDate = resultSet.getDate(3);
                ar.add(new Invoice(userName,invoiceID,invoiceCreateDate));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ar;
    }

//    public static void main(String[] args) {
////        Invoice invoice= new Invoice("tu", Date.valueOf("2020-11-03"));
////        addInvoiceToDb(invoice);
//        System.out.println(getMaxID());
//    }
}
