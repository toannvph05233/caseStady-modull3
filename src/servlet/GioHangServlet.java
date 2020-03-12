package servlet;

import controller.controllerDetailInvoice;
import controller.controllerRoom;
import dao.DetailInvoiceDao;
import dao.InvoiceDao;
import dao.RoomDao;
import model.DetailInvoice;
import model.Invoice;
import model.Room;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "GioHangServlet", urlPatterns = {"/giohang"})
public class GioHangServlet extends HttpServlet {
    ArrayList<Room> listRoom = RoomDao.getAllRoom();
    controllerRoom controllerRoom = new controllerRoom();
    controllerDetailInvoice controllerDetailInvoice = new controllerDetailInvoice();
    ArrayList<DetailInvoice> listDetailInvoice = new ArrayList<>();
    ArrayList<Invoice> listInvoice = InvoiceDao.getAllInvoce();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            addGioHang(request, response);
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("lol");
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addgiohang":
                try {
                    addGioHang(request, response);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                deleteGioHang(request, response);
                break;
            case "muasp":
                try {
                    createHoaDon(request, response);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                break;
            default:
                bookroom(request, response);
                break;
        }
    }


    private void addGioHang(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        int RoomId = Integer.parseInt(request.getParameter("id"));
        System.out.println(RoomId);
        Room RoomForRent = controllerRoom.findByIdRoom(listRoom, RoomId);
        Date checkIn = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("checkIn"));
        Date checkOut = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("checkOut"));
        DetailInvoice detailInvoice = new DetailInvoice();
        RequestDispatcher dispatcher;

        if (RoomForRent == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            detailInvoice.setRoomID(RoomId);
            detailInvoice.setRoomprice(RoomForRent.getRoomPrice());
            detailInvoice.setRentStartDate(checkIn);
            detailInvoice.setRentEndDate(checkOut);
            detailInvoice.setTitle(RoomForRent.getTitle());

            listDetailInvoice.add(detailInvoice);

            request.setAttribute("listDetailInvoice", listDetailInvoice);

            dispatcher = request.getRequestDispatcher("/views/giohang.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void bookroom(HttpServletRequest request, HttpServletResponse response) {
        int RoomId = Integer.parseInt(request.getParameter("id"));
        Room RoomForRent = controllerRoom.findByIdRoom(listRoom, RoomId);
        RequestDispatcher dispatcher;
        if (RoomForRent == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("RoomForRent", RoomForRent);
            dispatcher = request.getRequestDispatcher("/views/bookroom.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteGioHang(HttpServletRequest request, HttpServletResponse response) {
        int RoomId = Integer.parseInt(request.getParameter("id"));
        DetailInvoice detailInvoice = controllerDetailInvoice.findByIdDetailInvoice(listDetailInvoice, RoomId);
        int id = controllerDetailInvoice.findIdDetailInvoice(listDetailInvoice, RoomId);
        RequestDispatcher dispatcher;
        if (detailInvoice == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.controllerDetailInvoice.deleteDetailInvoice(listDetailInvoice, id);
            request.setAttribute("listDetailInvoice", listDetailInvoice);

            dispatcher = request.getRequestDispatcher("/views/giohang.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void createHoaDon(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        String userName = request.getParameter("userName");
        Date dateCreate = new java.util.Date();
        int idHoaDonNew = listInvoice.get(listInvoice.size()).getInvoiceID();
        Invoice invoice = new Invoice(userName, idHoaDonNew, dateCreate);

        for (DetailInvoice x : listDetailInvoice) {
            x.setRoomID(idHoaDonNew);
        }

        RequestDispatcher dispatcher;

        InvoiceDao.addInvoiceToDb(invoice);
        for (DetailInvoice x : listDetailInvoice) {
            DetailInvoiceDao.addDetailInvoice(x);
            RoomDao.disableByID(x.getRoomID());
        }
        dispatcher = request.getRequestDispatcher("home");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
