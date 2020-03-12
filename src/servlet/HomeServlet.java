package servlet;

import dao.RoomDao;
import dao.UserDao;
import model.Room;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User loginedUser = (User) session.getAttribute("user");
        if (loginedUser != null) {
            req.setAttribute("loginUser",loginedUser);
            ArrayList<Room> rooms = RoomDao.getAllRoomDisplay();
            req.setAttribute("rooms",rooms);
            RequestDispatcher rd = req.getRequestDispatcher("/views/index.jsp");
            rd.forward(req,resp);
        } else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/login.jsp");
            requestDispatcher.forward(req, resp);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
