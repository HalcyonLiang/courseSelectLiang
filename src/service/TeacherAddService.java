package service;

import factory.DAOFactory;
import util.DB;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Created by lenovo on 2016/7/3.
 */
public class TeacherAddService {
    public boolean teacherAdd(String teacherName,String teacherAccount,String teacherPassword){
        return DAOFactory.getTeacherDAO().addTeacher(teacherAccount,teacherPassword,teacherName);
    }

}
