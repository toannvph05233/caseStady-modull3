package model;

import java.sql.Date;
import java.util.LinkedList;

public class DetailInvoice {
    public int invoiceID;
    public int roomID;
    public float roomprice;
    public java.util.Date rentStartDate;
    public java.util.Date rentEndDate;
    public String title;

    public DetailInvoice() {
        invoiceID = 0;
        title = "";
    }

    public DetailInvoice(int invoiceID, int roomID, float roomprice, Date rentStartDate, Date rentEndDate) {
        this.invoiceID = invoiceID;
        this.roomID = roomID;
        this.roomprice = roomprice;
        this.rentStartDate = rentStartDate;
        this.rentEndDate = rentEndDate;
    }

    public int getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(int invoiceID) {
        this.invoiceID = invoiceID;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public float getRoomprice() {
        return roomprice;
    }

    public void setRoomprice(float roomprice) {
        this.roomprice = roomprice;
    }

    public java.util.Date getRentStartDate() {
        return rentStartDate;
    }

    public void setRentStartDate(java.util.Date rentStartDate) {
        this.rentStartDate = rentStartDate;
    }

    public java.util.Date getRentEndDate() {
        return rentEndDate;
    }

    public void setRentEndDate(java.util.Date rentEndDate) {
        this.rentEndDate = rentEndDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
