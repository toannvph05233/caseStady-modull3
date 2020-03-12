package model;

import java.sql.Date;

public class Room {
    public String title;

    public int getRoomId() {
        return roomId;
    }

    public int roomId;
    public Date createDate;
    public float roomPrice;
    public String tag=null;
    public String area;
    public String roomIntroduce;
    public String userName;
    public String roomContent;
    public boolean roomStatus = true;

    public Room(String title, Date createDate, float roomPrice, String tag, String area, String roomIntroduce, String userName, String roomContent) {
        this.title = title;
        this.createDate = createDate;
        this.roomPrice = roomPrice;
        this.tag = tag;
        this.area = area;
        this.roomIntroduce = roomIntroduce;
        this.userName = userName;
        this.roomContent = roomContent;
    }
    public Room(String title, Date createDate, float roomPrice, String area, String roomIntroduce, String userName, String roomContent) {
        this.title = title;
        this.createDate = createDate;
        this.roomPrice = roomPrice;
        this.area = area;
        this.roomIntroduce = roomIntroduce;
        this.userName = userName;
        this.roomContent = roomContent;
    }



    public Room(int roomID,String title, Date createDate, float roomPrice, String tag, String area, String roomIntroduce, String userName, String roomContent,Boolean status) {
        this.roomId = roomID;
        this.title = title;
        this.createDate = createDate;
        this.roomPrice = roomPrice;
        this.tag = tag;
        this.area = area;
        this.roomIntroduce = roomIntroduce;
        this.userName = userName;
        this.roomContent = roomContent;
        this.roomStatus=status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public float getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(float roomPrice) {
        this.roomPrice = roomPrice;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getRoomIntroduce() {
        return roomIntroduce;
    }

    public void setRoomIntroduce(String roomIntroduce) {
        this.roomIntroduce = roomIntroduce;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getRoomContent() {
        return roomContent;
    }

    public void setRoomContent(String roomContent) {
        this.roomContent = roomContent;
    }

    public boolean isRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(boolean roomStatus) {
        this.roomStatus = roomStatus;
    }
}
