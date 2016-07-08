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
public class TeacherCommitGrade extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String teacher_id = request.getSession().getAttribute("teacher_id").toString();
        String course_id = request.getSession().getAttribute("course_id").toString();
        String grade = request.getParameter("grade");
        String stud_id = request.getParameter("stud_id");
        //System.out.println("teacher = " + teacher_id + " course= "+ course_id +" grade=" + grade + " student = " + stud_id);
        boolean judge = DAOFactory.getGradeService().teacherCommitGrade(Integer.parseInt(course_id),Integer.parseInt(stud_id),Integer.parseInt(teacher_id),Double.parseDouble(grade));

        List<Student> studentList = DAOFactory.getStudentDAO().getOneCourseSelectedStudents(Integer.parseInt(course_id), Integer.parseInt(teacher_id));
        if(judge)
        {

            request.setAttribute("info", "上传成绩成功");
            request.getSession(true).setAttribute("studentList", studentList);
            request.getRequestDispatcher("/teacherCourseCommitGrade.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
