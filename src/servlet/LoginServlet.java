package servlet;

import dao.UserDao;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

//@WebServlet(urlPatterns = {"/login","/dangnhap"},name = "login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String pass = req.getParameter("pass");
        User user0 = UserDao.loginDb(name, pass);
        if (user0!=null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user0);
            User user1 = (User) session.getAttribute("user");
            req.setAttribute("user", user1);
            RequestDispatcher rd = req.getRequestDispatcher("/");
            rd.forward(req, resp);
        }
    }
}
