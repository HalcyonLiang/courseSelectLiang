package DAOImpl;

import DAO.StudentDAO;
import bean.Student;
import util.DB;

import javax.swing.plaf.nimbus.State;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by liang on 2016/7/1.
 */
public class StudentDAOImpl implements StudentDAO {
    @Override
    public Student getOneStudent(String account) {
        Student student = new Student();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DB.getConnection();
            String sql = "select studID,studName ,studAccount,studSex,studClassName from student where studAccount = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,account);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next())
            {
                student.setStudAccount(resultSet.getString("studAccount"));
                student.setStudID(resultSet.getInt("studID"));
                student.setStudName(resultSet.getString("studName"));
                student.setStudSex(resultSet.getString("studSex"));
                student.setStudClassName(resultSet.getString("studClassName"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.closeRs(resultSet);
        DB.closeStmt(preparedStatement);
        DB.closeConn(connection);
        return student;


    }



    /*
    根据课程ID和教师ID拿到选择这门课程的所有学生
     */

    @Override
    public List<Student> getOneCourseSelectedStudents(int course_id, int teacher_id) {
        List<Student> studentList = new ArrayList<Student>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "select studID,studAccount,studPassword,studName,grade,studClassName,studSex " +
                "from student " +
                "join studentcourse where student.studID = studentcourse.studentID " +
                "and courseID =" + course_id + " and teacherID = " + teacher_id ;
        connection = DB.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next())
            {
                Student student = new Student();
                student.setStudID(resultSet.getInt("studID"));
                student.setStudName(resultSet.getString("studName"));
                student.setStudAccount(resultSet.getString("studAccount"));
                student.setGrade(resultSet.getDouble("grade"));
                student.setStudClassName(resultSet.getString("studClassName"));
                student.setStudSex(resultSet.getString("studSex"));
                studentList.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        DB.closeRs(resultSet);
        DB.closeStmt(preparedStatement);
        DB.closeConn(connection);
        return studentList;
    }

    @Override
    public boolean addStudent(String account, String password, String name, String className, String sex) {
        try {
            Connection connection = DB.getConnection();
            Statement statement = connection.createStatement();

            String sql1 = "select studID from student where studAccount = '" + account + "'";
            PreparedStatement preparedStatement = connection.prepareStatement(sql1);
            ResultSet resultSet = null;
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next())
            {
                return false;
            }

        /*    statement.execute(sql1);



            if (statement.getResultSet() != null){
                return false;
            } */
            else{
                String sql2 = "insert into student "+"(studAccount,studPassword,studName,studClassName,studSex)"
                        +"values"+"('" + account + "','" + password + "','" + name + "','" + className + "','" + sex + "')";
                System.out.println(sql2);
                int row = statement.executeUpdate(sql2);
                //insert successfully
            }
            DB.closeConn(connection);
            DB.closeStmt(statement);
        }catch(SQLException e){e.printStackTrace();}
        return true;
    }


}
