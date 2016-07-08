package factory;

import DAO.CourseDAO;
import DAO.StudentDAO;
import DAO.TeacherCourseDAO;
import DAO.TeacherDAO;
import DAOImpl.CourseDAOImpl;
import DAOImpl.StudentDAOImpl;
import DAOImpl.TeacherCourseDAOImpl;
import DAOImpl.TeacherDAOImpl;
import service.GradeService;
import service.TeacherLoginService;

/**
 * Created by liang on 2016/7/1.
 */
public class DAOFactory {
    private static DAOFactory df = new DAOFactory();
    private static TeacherCourseDAO teacherCourseDAO = new TeacherCourseDAOImpl();
    private static StudentDAO studentDAO = new StudentDAOImpl();
    private static TeacherDAO teacherDAO = new TeacherDAOImpl();
    private static CourseDAO  courseDAO = new CourseDAOImpl();



    private static TeacherLoginService teacherLoginService = new TeacherLoginService();
    private static GradeService gradeService = new GradeService();

    public static GradeService getGradeService() {
        return gradeService;
    }

    public static CourseDAO getCourseDAO() {
        return courseDAO;
    }

    public static TeacherLoginService getTeacherLoginService() {
        return teacherLoginService;
    }

    public static TeacherDAO getTeacherDAO() {
        return teacherDAO;
    }

    public static DAOFactory getInstance() {
        return df;
    }
    public static TeacherCourseDAO getTeacherCourseDAO() {
        return teacherCourseDAO;
    }

    public static StudentDAO getStudentDAO() {
        return studentDAO;
    }
}
