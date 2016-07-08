package servlet;

import bean.Student;
import factory.DAOFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by liang on 2016/7/3.
 */
public class TeacherCourseSelectStudent extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String course_id = request.getParameter("course_id");
        String teacher_id = request.getParameter("teacher_id");
        String isGrade = request.getParameter("isGrade");
        //System.out.println("asdasdasd = " + isGrade);
        List<Student> studentList = DAOFactory.getStudentDAO().getOneCourseSelectedStudents(Integer.parseInt(course_id), Integer.parseInt(teacher_id));
        if("false".equals(isGrade)) {
            request.getSession(true).setAttribute("course_name",DAOFactory.getCourseDAO().getCourseName(Integer.parseInt(course_id)));
            request.getSession(true).setAttribute("studentList", studentList);
            request.getRequestDispatcher("/teacherCourseSelectStudent.jsp").forward(request, response);
        }
        else if("true".equals(isGrade))
        {
            request.getSession(true).setAttribute("teacher_id",teacher_id);
            request.getSession(true).setAttribute("course_id",course_id);
            request.getSession(true).setAttribute("studentList", studentList);
            request.getRequestDispatcher("/teacherCourseCommitGrade.jsp").forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
