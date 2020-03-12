package myutil;

import dao.InvoiceDao;
import dao.RoomDao;

import java.sql.Date;

public class MyUtils {
    public static Date getCurrentDate() {
        Date date = new Date(System.currentTimeMillis());
        return date;
    }
    public static int getroomId() {
        int id= RoomDao.getMaxID()+1;
        return id;
    }
    public static int InvoiceId() {
        int id= InvoiceDao.getMaxID()+1;
        return id;
    }
}
