package servlet;
import dao.RoomDao;
import model.Room;
import model.User;
import myutil.MyUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;



public class PostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("views/dangbai.jsp");
        rd.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("UTF-8");
        HttpSession session = req.getSession();
        User loginedUser = (User) session.getAttribute("user");
        if (loginedUser!=null){
        String userName = loginedUser.getUserName();
        int roomid = MyUtils.getroomId();
        Date date = MyUtils.getCurrentDate();
        String title = req.getParameter("title");
        String area = req.getParameter("region");
        String tag = req.getParameter("taginput");
        String content = req.getParameter("content");
        float price = Float.parseFloat(req.getParameter("price"));
        String introduce = req.getParameter("introduce");
        Room room = new Room(roomid,title,date,price,tag,area,introduce,userName,content,true);
        req.setAttribute("room", room);
        req.setAttribute("userName",loginedUser.getUserName());
        RoomDao.addRoomToDb(room);
        RequestDispatcher dispatcher = req.getRequestDispatcher("views/singlecopy.jsp");
        dispatcher.forward(req, resp);

        }
    }
}
