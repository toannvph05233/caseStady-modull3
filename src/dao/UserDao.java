package dao;

import model.User;

import javax.swing.*;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class UserDao {
    public static void deleteByID(String userName) {
        String querry = "delete from user where user.userName = ?; ";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connectMySql.conn.prepareStatement(querry);
            preparedStatement.setString(1,userName);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static User loginDb(String name, String pass) {
        String querry = "select * from user where userName = ? and password = ?;";
        User user = null;
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        try {
            PreparedStatement preparedStatement = connectMySql.conn.prepareStatement(querry);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, pass);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String userName = resultSet.getString("userName");
                String userPass = resultSet.getString("password");
                String firtName = resultSet.getString("firstname");
                String lastName = resultSet.getString("lastname");
                Date brithDay = resultSet.getDate("birthday");
                int phoneNumber = resultSet.getInt("phonenumber");
                String avatar = resultSet.getString("avatar");
                String email = resultSet.getString("email");
                user = new User(userName, userPass,firtName,lastName,brithDay,avatar,phoneNumber,email);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
//        connectMySql.close();
        return user;
    }

    public static ArrayList getAllUserName() {
        ArrayList arrayList = new ArrayList();
        String QUERRY = "select userName from user";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        try {
            ResultSet resultSet = connectMySql.statement.executeQuery(QUERRY);
            while (resultSet.next()) {
                String userName = resultSet.getString("userName");
                arrayList.add(userName);
            }
//            connectMySql.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Collections.sort(arrayList, new Comparator<String>() {
            @Override
            public int compare(String s, String t1) {
                return s.compareTo(t1);
            }
        });
        return arrayList;
    }

    public static void addUserDb(User user) {
        String QUERRY = "insert user values (?,?,?,?,?,?,?,?);";
        String querry = "insert user(userName,password,firstname,lastname) values (?,?,?,?);";
        ConnectMySql connectMySql = ConnectMySql.getInstance();
        connectMySql.open();
        PreparedStatement preparedStatement = null;
        if (user.getPhoneNumber()!=0){
        try {
            preparedStatement = connectMySql.conn.prepareStatement(QUERRY);
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getUserPass());
            preparedStatement.setString(3, user.getFirstName());
            preparedStatement.setString(4, user.getLastName());
            preparedStatement.setDate(6, user.getBirthDay());
            preparedStatement.setInt(8, user.getPhoneNumber());
            preparedStatement.setString(5, user.getAvatar());
            preparedStatement.setString(7, user.getEmail());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }}else{try {
            preparedStatement = connectMySql.conn.prepareStatement(querry);
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getUserPass());
            preparedStatement.setString(3, user.getFirstName());
            preparedStatement.setString(4, user.getLastName());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        }
    }

    public static void main(String[] args) {
        User user = new User("tu","1234","tu","dinh");
        addUserDb(user);
//        User user1=loginDb("tu", "1234");
//        System.out.println(user1.getBirthDay());
//
    }
}
