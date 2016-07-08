package DAOImpl;

import DAO.CourseDAO;
import util.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by liang on 2016/7/3.
 */
public class CourseDAOImpl implements CourseDAO {
    @Override
    public String getCourseName(int course_id) {
        String courseName = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        connection = DB.getConnection();
        String sql = "select courseName from course where courseID = " + course_id;
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next())
            {
                courseName = resultSet.getString("courseName");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.closeRs(resultSet);
        DB.closeStmt(preparedStatement);
        DB.closeConn(connection);
        return courseName;
    }
}
