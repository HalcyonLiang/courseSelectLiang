package service;

import factory.DAOFactory;
import util.DB;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by lenovo on 2016/7/2.
 */

public class StudentAddService {
    public boolean studentAdd(String student_name,String student_account,
                           String student_password,String class_name,String sex){
       return DAOFactory.getStudentDAO().addStudent(student_account,student_password,student_name,class_name,sex);
    }
}
