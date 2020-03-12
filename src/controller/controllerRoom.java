package controller;

import model.Room;

import java.util.ArrayList;

public class controllerRoom {
    public void createRoom(ArrayList<Room> arrayList, Room Room) {
        arrayList.add(Room);
    }

    public void editRoom(ArrayList<Room> arrayList, Room Room, int index) {
        arrayList.set(index, Room);
    }

    public void deleteRoom(ArrayList<Room> arrayList, int index) {
        arrayList.remove(index);
    }

    public Room findByIdRoom(ArrayList<Room> arrayList, int idRoom) {
        for (Room x : arrayList) {
            if (x.getRoomId() == idRoom) {
                return x;
            }
        }
        return null;
    }

    public int findIdSP(ArrayList<Room> arrayList, int idRoom) {
        for (int i = 0; i < arrayList.size(); i++) {
            if (arrayList.get(i).getRoomId() == idRoom) {
                return i;
            }
        }
        return -1;
    }
}
