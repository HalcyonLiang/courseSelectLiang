package DAO;

import bean.Student;

import java.util.List;

/**
 * Created by liang on 2016/7/1.
 */
public interface StudentDAO {
    public abstract Student getOneStudent(String account);


    public abstract List<Student> getOneCourseSelectedStudents(int course_id,int teacher_id);
    public abstract boolean addStudent(String account,String password,String name,String className,String sex);
}
