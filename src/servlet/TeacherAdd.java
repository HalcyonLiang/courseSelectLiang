package servlet;

import service.StudentAddService;
import service.TeacherAddService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by liang on 2016/7/4.
 */
public class TeacherAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TeacherAddService service = new TeacherAddService();
        String teacher_name = request.getParameter("teacher_name");
        String teacher_account = request.getParameter("teacher_account");
        String teacher_password = request.getParameter("teacher_password");



        boolean judge = service.teacherAdd(teacher_name,teacher_account,teacher_password);
        if(judge)
        {
            request.setAttribute("info","添加教师成功");
            request.getRequestDispatcher("/managerManageCenterAddTeacher.jsp").forward(request,response);
        }
        else
        {
            request.setAttribute("info","教师信息已经在数据库中");
            request.getRequestDispatcher("/managerManageCenterAddTeacher.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
