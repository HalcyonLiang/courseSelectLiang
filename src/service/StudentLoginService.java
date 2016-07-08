package service;

import util.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by liang on 2016/7/1.
 */
public class StudentLoginService {
    public boolean studentLogin(String account,String password)
    {
        Connection connection = null;
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        String sql = "select studPassword from student where studAccount=?";
        boolean loginTrue = false;
        try {
            connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1,account);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next())
            {
                if(resultSet.getString("studPassword").equals(password)) {
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
}
