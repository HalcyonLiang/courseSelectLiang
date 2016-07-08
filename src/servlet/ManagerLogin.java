package servlet;

import bean.Teacher;
import service.ManagerLoginService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by liang on 2016/7/1.
 */
public class ManagerLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String password = request.getParameter("password");

        System.out.println("account=" +account + " password=" + password);
        ManagerLoginService service = new ManagerLoginService();
        if (service.managerLogin(account,password)){
           // request.getSession().setAttribute("account",account);
           // request.getSession().setAttribute("password",password);
            List<Teacher> teacher = new ArrayList<Teacher>();
            teacher = service.teacherAddList();
            request.getSession().setAttribute("teacher", teacher);
            System.out.println(teacher.get(0).getTeacherName());
            request.getRequestDispatcher("/managerManageCenter.jsp").forward(request,response);
        }
        else
            request.getRequestDispatcher("/index.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
