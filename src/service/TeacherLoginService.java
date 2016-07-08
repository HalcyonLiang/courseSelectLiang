package service;

import factory.DAOFactory;

/**
 * Created by liang on 2016/7/3.
 */
public class TeacherLoginService {

    /*
        教师登陆信息验证
     */
    public boolean teacherLogin(String account,String password)
    {
        String getPassword = DAOFactory.getTeacherDAO().getTeacherPasswordByAccount(account);
        if(getPassword.equals(password))
            return true;
        else
            return false;
    }
}
