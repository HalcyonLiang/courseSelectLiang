package service;

/**
 * Created by lenovo on 2016/7/1.
 */
import util.DB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import bean.Teacher;

public class ManagerLoginService {
    Connection connection = null;
    ResultSet resultSet = null;
    PreparedStatement preparedStatement = null;
    Statement statement = null;
    String sql = "select ManaPassword from manager where ManaAccount=?";
    boolean loginTrue = false;

    public boolean managerLogin(String account,String password){
        try {
            connection = DB.getConnection();
            statement = connection.createStatement();
            String sql1 = "select manaPassword from manager where manaAccount = '"+account+"'";
            resultSet = statement.executeQuery(sql1);

            System.out.println(sql1);
            while(resultSet.next())
            {
                if(resultSet.getString("manaPassword").equals(password)) {
                    loginTrue = true;

                }
                else
                    loginTrue = false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.closeRs(resultSet);
        DB.closeStmt(preparedStatement);
        DB.closeConn(connection);
        return loginTrue;

    }
    public List<Teacher> teacherAddList(){

        List<Teacher> teacher =  new ArrayList<Teacher>();
        try {
            connection = DB.getConnection();
            Statement statement = connection.createStatement();
            String sql = "select teacherID,teacherName,teacherAccount from teacher";
            ResultSet result = statement.executeQuery(sql);

           while(result.next()){
                Teacher teacherbean = new Teacher();
                teacherbean.setTeacherID(result.getInt(1));
                teacherbean.setTeacherName(result.getString(2));
                teacherbean.setTeacherAccount(result.getString(3));
                teacher.add(teacherbean);
            }
        }catch(SQLException e){e.printStackTrace();}
        DB.closeRs(resultSet);
        DB.closeStmt(preparedStatement);
        DB.closeConn(connection);
        return teacher;
    }
}
