package model;

public class Image {
    public String imageName;
    public int roomId;

    public String getImageName() {
        return imageName;
    }

    public int getRoomId() {
        return roomId;
    }

    public Image(String imageName, int roomId) {
        this.imageName = imageName;
        this.roomId = roomId;
    }
}
