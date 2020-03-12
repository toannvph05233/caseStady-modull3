package model;

import java.sql.Date;

public class Invoice {
    public String userName;
    public int invoiceID;
    public Date invoiceCreateDate;

    public Invoice() {
    }

    public Invoice(String userName, int invoiceID, Date invoiceCreateDate) {
        this.userName = userName;
        this.invoiceID = invoiceID;
        this.invoiceCreateDate = invoiceCreateDate;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(int invoiceID) {
        this.invoiceID = invoiceID;
    }

    public Date getInvoiceCreateDate() {
        return invoiceCreateDate;
    }

    public void setInvoiceCreateDate(Date invoiceCreateDate) {
        this.invoiceCreateDate = invoiceCreateDate;
    }
}
