package servlet;

import service.StudentAddService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by liang on 2016/7/4.
 */
public class StudentAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentAddService service = new StudentAddService();
        String student_name = request.getParameter("stud_name");
        String student_account = request.getParameter("stud_account");
        String student_password = request.getParameter("stud_password");
        String student_className = request.getParameter("stud_className");

        String student_sex = request.getParameter("stud_sex");
        boolean judge = service.studentAdd(student_name,student_account,student_password,student_className,student_sex);
        if(judge)
        {
            request.setAttribute("info","添加学生成功");
            request.getRequestDispatcher("/managerManageCenter.jsp").forward(request,response);
        }
        else
        {
            request.setAttribute("info","学生信息已经在数据库中");
            request.getRequestDispatcher("/managerManageCenter.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
