package servlet;

import dao.RoomDao;
import model.Room;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class PostDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int roomId = Integer.parseInt(req.getParameter("roomid"));
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");
        if (user != null) {
            if (roomId > 0) {
                Room room = RoomDao.getRoomDisplayById(roomId);
                req.setAttribute("room", room);
                req.setAttribute("userName",user.getUserName());
                RequestDispatcher rd = req.getRequestDispatcher("views/singlecopy.jsp");
                rd.forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("views/single.jsp");
        rd.forward(req,resp);
    }
}
