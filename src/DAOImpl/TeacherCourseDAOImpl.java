package DAOImpl;

import DAO.TeacherCourseDAO;
import bean.Teacher;
import bean.TeacherCourse;
import sun.misc.REException;
import util.DB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by liang on 2016/7/1.
 */
public class TeacherCourseDAOImpl implements TeacherCourseDAO {
    @Override
    public ArrayList<TeacherCourse> getTeacherCourseListCanSelect(String account) {

        Connection connection = null;
        String sql2 = "select course.courseID,courseName,courseDept,courseContent,teacherName,courseWeek ,courseLesson " +
                "from course join teachercourse on course.courseID = teachercourse.courseID" +
                " join teacher on teacher.teacherID = teachercourse.teacherID where course.courseID not in " +
                " (select courseID from studentcourse join student on student.studID = studentcourse.studentID WHERE student.studAccount = ?)";
        System.out.println(sql2);
        ResultSet resultSet2 = null;
        PreparedStatement preparedStatement1 = null;
        ArrayList<TeacherCourse> teacherCourseList = new ArrayList<TeacherCourse>();
        try {
            connection = DB.getConnection();

            preparedStatement1 = connection.prepareStatement(sql2);

            preparedStatement1.setString(1,account);

            resultSet2 = preparedStatement1.executeQuery();
            while(resultSet2.next())
            {
                TeacherCourse teacherCourse = new TeacherCourse();
                teacherCourse.setCourseID(resultSet2.getInt("courseID"));
                teacherCourse.setCourseName(resultSet2.getString("courseName"));
                teacherCourse.setCourseDept(resultSet2.getString("courseDept"));
                teacherCourse.setCourseContent(resultSet2.getString("courseContent"));
                teacherCourse.setTeacherName(resultSet2.getString("teacherName"));
                teacherCourse.setCourseLesson(resultSet2.getInt("courseLesson"));
                teacherCourse.setCourseWeek(resultSet2.getInt("courseWeek"));
                teacherCourseList.add(teacherCourse);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.closeRs(resultSet2);
        DB.closeStmt(preparedStatement1);
        DB.closeConn(connection);
        return teacherCourseList;
    }

    @Override
    public List<TeacherCourse> getTeacherCourseListSelected(String account) {
        Connection connection = null;
        String sql = "select teacher.teacherID,course.courseID ,courseName,courseDept,courseContent,courseDept,teacherName,courseWeek,courseLesson ,grade  from student " +
                "join studentcourse on student.studID = studentcourse.studentID " +
                "natural join course " +
                "natural join teacher " +
                "natural join teachercourse " +
                "where studAccount = ?";
        System.out.println(sql);
        ResultSet resultSet2 = null;
        PreparedStatement preparedStatement1 = null;
        ArrayList<TeacherCourse> teacherCourseListSelected = new ArrayList<TeacherCourse>();
        try {
            connection = DB.getConnection();

            preparedStatement1 = connection.prepareStatement(sql);

            preparedStatement1.setString(1,account);

            resultSet2 = preparedStatement1.executeQuery();
            while(resultSet2.next())
            {
                TeacherCourse teacherCourse = new TeacherCourse();
                teacherCourse.setCourseID(resultSet2.getInt("courseID"));
                teacherCourse.setCourseName(resultSet2.getString("courseName"));
                teacherCourse.setCourseDept(resultSet2.getString("courseDept"));
                teacherCourse.setCourseContent(resultSet2.getString("courseContent"));
                teacherCourse.setTeacherName(resultSet2.getString("teacherName"));
                teacherCourse.setCourseWeek(resultSet2.getInt("courseWeek"));
                teacherCourse.setCourseLesson(resultSet2.getInt("courseLesson"));
                teacherCourse.setGrade(resultSet2.getDouble("grade"));
                teacherCourse.setTeacherID(resultSet2.getInt("teacherID"));
                teacherCourseListSelected.add(teacherCourse);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.closeRs(resultSet2);
        DB.closeStmt(preparedStatement1);
        DB.closeConn(connection);
        return teacherCourseListSelected;
    }


    /*
        根据教师账号拿到教师自己教授的所有课程
     */
    @Override
    public List<TeacherCourse> getTeacherCourseList(String account) {
        List<TeacherCourse> teacherCourses = new ArrayList<TeacherCourse>();
       Connection connection = null;
       PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "select teacher.teacherID ,courseID,courseName,courseWeek,courseLesson,courseDept,courseContent " +
                "from course " +
                "natural join teachercourse " +
                "natural join teacher " +
                "where teacherAccount = " + account;
        System.out.println(sql);
        connection = DB.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                TeacherCourse teacherCourse = new TeacherCourse();
                teacherCourse.setCourseID(resultSet.getInt("courseID"));
                teacherCourse.setCourseName(resultSet.getString("courseName"));
                teacherCourse.setCourseDept(resultSet.getString("courseDept"));
                teacherCourse.setCourseContent(resultSet.getString("courseContent"));
                teacherCourse.setCourseLesson(resultSet.getInt("courseLesson"));
                teacherCourse.setCourseWeek(resultSet.getInt("courseWeek"));
                teacherCourse.setTeacherID(resultSet.getInt("teacherID"));
                teacherCourses.add(teacherCourse);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.closeRs(resultSet);
        DB.closeStmt(preparedStatement);
        DB.closeConn(connection);
        return teacherCourses;
    }

    @Override
    public boolean teacherCommitGrade(int course_id, int teacher_id, int stud_id, double grade) {
        Connection connection = null;
        Statement statement = null;
        String sql = "update studentcourse set grade = " + grade + ",isPassed = 1 " + " where " +
                "courseID = " + course_id + " and studentID = " + stud_id + " and teacherID = " + teacher_id;
        System.out.println(sql);
        connection = DB.getConnection();
        try {
            statement = connection.createStatement();
            statement.execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        DB.closeStmt(statement);
        DB.closeConn(connection);
        return true;

    }


}
