package servlet;

import bean.Student;
import bean.TeacherCourse;
import factory.DAOFactory;
import service.StudSelectCourseService;

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
public class StudSelectCourse extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String courseID = request.getParameter("course_id");
         String teacherName = request.getParameter("teacher_name");
         teacherName = new String(teacherName.getBytes("ISO-8859-1"),"UTF-8");
        Student student = (Student)request.getSession().getAttribute("student");
        System.out.println(student.getStudAccount());
         System.out.println(teacherName);
         System.out.println(courseID);
        StudSelectCourseService studSelectCourseService = new StudSelectCourseService();
        boolean test = studSelectCourseService.stuSelectCourse(Integer.parseInt(courseID),teacherName,student.getStudID());

        ArrayList<TeacherCourse> teacherCourseList = DAOFactory.getTeacherCourseDAO().getTeacherCourseListCanSelect(student.getStudAccount());
        List<TeacherCourse> teacherCourseSelected = DAOFactory.getTeacherCourseDAO().getTeacherCourseListSelected(student.getStudAccount());
        if(test) {
            request.setAttribute("info","选课成功");
            request.getSession(true).setAttribute("courseAllList",teacherCourseList);
            request.getSession(true).setAttribute("courseSelected",teacherCourseSelected);
            request.getRequestDispatcher("/studCourseCenter.jsp").forward(request,response);
        }
        else
        {
            request.setAttribute("info","您选的课程时间冲突");
            request.getRequestDispatcher("/studCourseCenter.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doPost(request,response);
    }
}
