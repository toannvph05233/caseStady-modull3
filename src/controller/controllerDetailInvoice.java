package controller;

import model.DetailInvoice;

import java.util.ArrayList;

public class controllerDetailInvoice {

    public void createDetailInvoice(ArrayList<DetailInvoice> arrayList, DetailInvoice detailInvoice) {
        arrayList.add(detailInvoice);
    }

    public void editDetailInvoice(ArrayList<DetailInvoice> arrayList, DetailInvoice detailInvoice, int index) {
        arrayList.set(index, detailInvoice);
    }

    public void deleteDetailInvoice(ArrayList<DetailInvoice> arrayList, int index) {
        arrayList.remove(index);
    }

    public DetailInvoice findByIdDetailInvoice(ArrayList<DetailInvoice> arrayList, int idphong) {
        for (DetailInvoice x : arrayList) {
            if (x.getRoomID() == (idphong)) {
                return x;
            }
        }
        return null;
    }

    public int findIdDetailInvoice(ArrayList<DetailInvoice> arrayList, int idphong) {
        for (int i = 0; i < arrayList.size(); i++) {
            if (arrayList.get(i).getRoomID() == (idphong)) {
                return i;
            }
        }
        return -1;
    }
}



