package model;

import java.sql.Date;

public class User {
    private  String userName;
    private  String userPass;
    private  String firstName="";
    private  String lastName="";
    private Date birthDay;
    private  String avatar;
    private  int phoneNumber=0;
    private  String email;
    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setBirthDay(Date birthDay) {
        this.birthDay = birthDay;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserName() {
        return userName;
    }

    public String getUserPass() {
        return userPass;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public Date getBirthDay() {
        return birthDay;
    }

    public String getAvatar() {
        return avatar;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public User(String userName, String userPass, String firstName, String lastName, String avatar, int phoneNumber) {
        this.userName = userName;
        this.userPass = userPass;
        this.firstName = firstName;
        this.lastName = lastName;
        this.avatar = avatar;
        this.phoneNumber = phoneNumber;
    }

    public User(String userName, String userPass, String firstName, String lastName, Date birthDay, String avatar, int phoneNumber, String email) {
        this.userName = userName;
        this.userPass = userPass;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthDay = birthDay;
        this.avatar = avatar;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }

    public User(String userName, String userPass, String firstName, String lastName) {
        this.userName = userName;
        this.userPass = userPass;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public User(String userName, String userPass) {
        this.userName = userName;
        this.userPass = userPass;
    }
//    public static void main(String[] args) {
//        User user = new User("tu", "1234");
//        System.out.println(user.getLastName());
//    }
}
