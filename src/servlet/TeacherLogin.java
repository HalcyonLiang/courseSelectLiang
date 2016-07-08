package servlet;

import bean.Teacher;
import bean.TeacherCourse;
import factory.DAOFactory;

import java.io.IOException;
import java.util.List;

/**
 * Created by liang on 2016/7/1.
 */
public class TeacherLogin extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String account = request.getParameter("account");
        String password = request.getParameter("password");



        boolean judge = DAOFactory.getTeacherLoginService().teacherLogin(account,password);
        if(judge)
        {
            Teacher teacher = DAOFactory.getTeacherDAO().getOneTeacher(account);
            List<TeacherCourse> teacherCourseList = DAOFactory.getTeacherCourseDAO().getTeacherCourseList(account);
            request.getSession(true).setAttribute("teacher",teacher);
            request.getSession(true).setAttribute("mycourseList",teacherCourseList);
            request.getRequestDispatcher("/teacherCourseCenter.jsp").forward(request,response);
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
           this.doPost(request,response);
    }
}
