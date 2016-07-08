package DAO;

import bean.Teacher;
import bean.TeacherCourse;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by liang on 2016/7/1.
 */
public interface TeacherCourseDAO {
    public abstract ArrayList<TeacherCourse> getTeacherCourseListCanSelect(String account);
    public abstract List<TeacherCourse> getTeacherCourseListSelected(String account);
    public abstract List<TeacherCourse> getTeacherCourseList(String account);

    public abstract boolean teacherCommitGrade(int course_id,int teacher_id,int stud_id ,double grade);
}
