package DAOImpl;

import DAO.TeacherDAO;
import bean.Student;
import bean.Teacher;
import util.DB;

import java.sql.*;

/**
 * Created by liang on 2016/7/3.
 */
public class TeacherDAOImpl implements TeacherDAO {


    /*
        根据教师账号信息拿到一个教师对象
     */
    @Override
    public Teacher getOneTeacher(String account) {
        Teacher teacher = new Teacher();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DB.getConnection();
            String sql = "select teacherID,teacherName ,teacherAccount from teacher where teacherAccount = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,account);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next())
            {
                teacher.setTeacherAccount(resultSet.getString("teacherAccount"));
                teacher.setTeacherID(resultSet.getInt("teacherID"));
                teacher.setTeacherName(resultSet.getString("teacherName"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.closeRs(resultSet);
        DB.closeStmt(preparedStatement);
        DB.closeConn(connection);
        return teacher;
    }

    @Override
    public String getTeacherPasswordByAccount(String account) {
        String result = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "select teacherPassword from teacher where teacherAccount = ?";
        connection = DB.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,account);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next())
            {
                result = resultSet.getString("teacherPassword");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        DB.closeRs(resultSet);
        DB.closeStmt(preparedStatement);
        DB.closeConn(connection);
        return result;
    }

    @Override
    public boolean addTeacher(String account, String password, String name) {
        try {
            Connection connection = DB.getConnection();
            Statement statement = connection.createStatement();

            String sql1 = "select teacherID from teacher where teacherAccount = '" + account + "'";
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
                String sql2 = "insert into teacher "+"(teacherAccount,teacherPassword,teacherName)"
                        +"values"+"('" + account + "','" + password + "','" + name + "')";
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
