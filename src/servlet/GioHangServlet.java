package servlet;

import controller.controllerDetailInvoice;
import controller.controllerRoom;
import dao.DetailInvoiceDao;
import dao.InvoiceDao;
import dao.RoomDao;
import model.DetailInvoice;
import model.Invoice;
import model.Room;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "AddGioHang":
                try {
                    addGioHang(request, response);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                deleteGioHang(request, response);
                break;
            case "createHoaDon":
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
        java.util.Date today =new java.util.Date();

        Date checkIn = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("checkIn"));
        Date checkOut = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("checkOut"));
        int RoomId = Integer.parseInt(request.getParameter("id"));
        Room RoomForRent = controllerRoom.findByIdRoom(listRoom, RoomId);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String userName = user.getUserName();

        if (checkIn.compareTo(checkOut) == -1 && checkIn.compareTo(today) == 1) {
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
                float sumPrice = 0;
                for (DetailInvoice x : listDetailInvoice) {
                    long noDay = (x.getRentEndDate().getTime() - x.getRentStartDate().getTime()) / (24 * 3600 * 1000);
                    sumPrice += noDay * x.getRoomprice();
                }
                request.setAttribute("sumPrice", sumPrice);
                request.setAttribute("listDetailInvoice", listDetailInvoice);
                request.setAttribute("userName", userName);

                dispatcher = request.getRequestDispatcher("/views/giohang.jsp");
            }
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

        } else {
            String message = "Ngày bạn nhập sai rồi kiểm tra đi: <br> <br> Ngày CheckIn phải sau ngày hôm nay và ngày CheckOut phải sau ngày CheckIn";
            request.setAttribute("message", message);
            RequestDispatcher dispatcher;
            request.setAttribute("RoomForRent", RoomForRent);
            dispatcher = request.getRequestDispatcher("/views/bookroom.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    private void bookroom(HttpServletRequest request, HttpServletResponse response) {
        int RoomId = Integer.parseInt(request.getParameter("id"));
        Room RoomForRent = controllerRoom.findByIdRoom(listRoom, RoomId);
        String message = "Mời bạn nhập";
        RequestDispatcher dispatcher;
        if (RoomForRent == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("RoomForRent", RoomForRent);
            request.setAttribute("message", message);
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String userName = user.getUserName();

        Date dateCreate = new java.util.Date();
        int idHoaDonNew = 1;
        if (listInvoice.size() != 0) {
            idHoaDonNew = listInvoice.size() + 1;
        }
        ;
        Invoice invoice = new Invoice(userName, idHoaDonNew, dateCreate);

        for (DetailInvoice x : listDetailInvoice) {
            x.setInvoiceID(idHoaDonNew);
        }
        RequestDispatcher dispatcher;
        InvoiceDao.addInvoiceToDb(invoice);
        for (DetailInvoice x : listDetailInvoice) {
            DetailInvoiceDao.addDetailInvoice(x);
            RoomDao.disableByID(x.getRoomID());
            ;
        }
        dispatcher = request.getRequestDispatcher("home");

        try {
            System.out.println("Creat Hóa đơn thành công");
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
