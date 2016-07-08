package service;

import bean.TeacherCourse;
import util.DB;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by liang on 2016/7/1.
 */
public class StudSelectCourseService {

    /*
    根据课程ID,教师姓名,学生ID 将学生选课插入到数据库当中
     */
    public boolean stuSelectCourse(int course_id,String teacherName,int student_id)
    {
        boolean judge = true;
        Connection connection = null;

        int teacher_id = 0;

        String sql1 = "select teacherID from teacher where teacherName = ?" ;
        ResultSet resultSet1 = null;
        PreparedStatement preparedStatement1 = null;

        connection = DB.getConnection();
        try {
            preparedStatement1 = connection.prepareStatement(sql1);
            preparedStatement1.setString(1,teacherName);
            resultSet1 = preparedStatement1.executeQuery();
            while(resultSet1.next())
            {
               teacher_id = resultSet1.getInt("teacherID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            judge = false;

        }

        DB.closeRs(resultSet1);
        DB.closeStmt(preparedStatement1);
        DB.closeConn(connection);
        judge = judgeCanSelect(course_id,teacher_id,student_id);
        System.out.println("asdasdasd" + judgeCanSelect(course_id,teacher_id,student_id));
        if(judge) {
            ResultSet resultSet2 = null;
            Statement Statement2 = null;
            String sql2 = "insert into studentcourse(courseID,studentID,teacherID) values(" + course_id + "," + student_id + "," + teacher_id + ")";

            System.out.println(sql2);


            try {
                connection = DB.getConnection();

                Statement2 = connection.createStatement();
                Statement2.execute(sql2);


            } catch (SQLException e) {
                e.printStackTrace();
                judge = false;
            }

            DB.closeRs(resultSet2);
            DB.closeStmt(Statement2);
            DB.closeConn(connection);
            return judge;
        }
        else
            return judge;
    }


    /*
        根据学生id,教师姓名，课程id 实现学生退选
     */
    public boolean studUndoSelected(int course_id,String teacherName,int stud_id)
    {
        boolean judge = true;
        Connection connection = null;

        int teacher_id = 0;

        String sql1 = "select teacherID from teacher where teacherName = ?" ;
        ResultSet resultSet1 = null;
        PreparedStatement preparedStatement1 = null;

        connection = DB.getConnection();
        try {
            preparedStatement1 = connection.prepareStatement(sql1);
            preparedStatement1.setString(1,teacherName);
            resultSet1 = preparedStatement1.executeQuery();
            while(resultSet1.next())
            {
                teacher_id = resultSet1.getInt("teacherID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            judge = false;

        }

        DB.closeRs(resultSet1);
        DB.closeStmt(preparedStatement1);
        ResultSet resultSet2 = null;
        Statement Statement2 = null;
        String sql2 = "delete from studentcourse where courseID = " + course_id + " and studentID = " + stud_id +" and teacherID = " + teacher_id;

        System.out.println(sql2);


        try {
            connection = DB.getConnection();

            Statement2 = connection.createStatement();
            Statement2.execute(sql2);


        } catch (SQLException e) {
            e.printStackTrace();
            judge = false;
        }

        DB.closeRs(resultSet2);
        DB.closeStmt(Statement2);
        DB.closeConn(connection);
        return judge;

    }


    public boolean judgeCanSelect(int course_id,int teacher_id,int student_id)
    {
        Connection connection = null;
        String sql = " select courseWeek,courseLesson from teachercourse as t1 " +
                "where courseWeek in ( " +
                "select courseWeek " +
                " from studentcourse as s1 natural join teachercourse where studentID =" + student_id + " ) " +
                "and courseLesson in ( " +
                "select courseLesson" +
                " from studentcourse as s1 natural join teachercourse where studentID =" + student_id +
                ")" +
                " " +
                "and teacherID =" + teacher_id + " and courseID =  " + course_id;
        System.out.println("judge  " + sql);
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        connection = DB.getConnection();
        boolean judge =  true;
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next())
            {
                judge = false;
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            judge = false;

        }
        DB.closeRs(resultSet);
        DB.closeStmt(preparedStatement);
        DB.closeConn(connection);
        return judge;
    }
}
