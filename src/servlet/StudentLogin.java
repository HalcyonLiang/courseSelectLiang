package servlet;

import DAOImpl.TeacherCourseDAOImpl;
import bean.Student;
import bean.TeacherCourse;
import factory.DAOFactory;
import service.StudentLoginService;
import util.DB;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by liang on 2016/7/1.
 */
public class StudentLogin extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String account = request.getParameter("account");
        System.out.println("account=" + account);
        String password = request.getParameter("password");

        StudentLoginService studentLoginService = new StudentLoginService();
        boolean loginTrue = studentLoginService.studentLogin(account,password);

        ArrayList<TeacherCourse> teacherCourseList = DAOFactory.getTeacherCourseDAO().getTeacherCourseListCanSelect(account);
        List<TeacherCourse> teacherCourseSelected = DAOFactory.getTeacherCourseDAO().getTeacherCourseListSelected(account);

        Student student = DAOFactory.getStudentDAO().getOneStudent(account);
        System.out.println("logintrue = "  + loginTrue);
        if(loginTrue) {

            request.getSession().setAttribute("courseAllList",teacherCourseList);
            request.getSession().setAttribute("courseSelected",teacherCourseSelected);
            request.getSession().setAttribute("student",student);
            request.getRequestDispatcher("/studCourseCenter.jsp").forward(request, response);
        }
        else {
            request.setAttribute("info", "请输入正确的账号和密码");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }


    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
               this.doPost(request, response);
    }
}
