package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectMySql {
    private String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    private String DB_URL = "jdbc:mysql://localhost:3306/casestudymodule3";
    private String DB_USER = "root";
    private String DB_PASS = "123456";
    public Connection conn = null;
    public Statement statement = null;
    private ConnectMySql() {
        try {
            Class.forName(JDBC_DRIVER);
            System.out.println("khai bao thanh cong driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public void open() {
        if (this.conn == null) {
            System.out.println("bat dau ket noi");
            try {
                this.conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                System.out.println("ket noi thanh cong");
                statement = conn.createStatement();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public void close() {
        if (this.conn != null) {
            try {
//                this.statement.close();
                this.conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public void rollback() throws SQLException {
        if (this.conn != null) {
            try {
                conn.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
                throw e;
            }
        }
    }

    private static class ConnectMySqlSingleton {
        public static ThreadLocal<ConnectMySql> instance;
        static {
            ThreadLocal<ConnectMySql> dm = new ThreadLocal<ConnectMySql>(){
                @Override
                protected ConnectMySql initialValue() {
                    return new ConnectMySql();
                }
            };
            instance = dm;
        }
    }
    public static ConnectMySql getInstance() {
        return ConnectMySqlSingleton.instance.get();
    }

    public static void main(String[] args) {
        ConnectMySql connectMysql = ConnectMySql.getInstance();
        connectMysql.open();
        connectMysql.close();
    }
}
