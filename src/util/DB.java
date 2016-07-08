package util;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB
{
  private static ComboPooledDataSource cpds;

  static
  {
    try
    {
      cpds = new ComboPooledDataSource();
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }

  public static Connection getConnection()
  {
    Connection conn = null;
    try {
      conn = cpds.getConnection();
    }
    catch (SQLException e) {
      e.printStackTrace();
    }
    return conn;
  }

  public static void closeRs(ResultSet rs) {
    if (rs != null)
      try {
        rs.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
  }

  public static void closeStmt(Statement stmt)
  {
    if (stmt != null)
      try {
        stmt.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
  }

  public static void closeConn(Connection conn)
  {
    if (conn != null)
      try {
        conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
  }
}

/* Location:           I:\FindVideo\WEB-INF\classes\
 * Qualified Name:     edu.findvideo.util.DB
 * JD-Core Version:    0.6.1
 */