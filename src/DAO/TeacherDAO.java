package DAO;

import bean.Teacher;

/**
 * Created by liang on 2016/7/3.
 */
public interface TeacherDAO {
    public abstract Teacher getOneTeacher(String account);

    public abstract String getTeacherPasswordByAccount(String account);

    public abstract boolean addTeacher(String account ,String password ,String name);
}
