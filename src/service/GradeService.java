package service;

import factory.DAOFactory;

/**
 * Created by liang on 2016/7/3.
 */
public class GradeService {
    /*
        教师提交成绩
     */
     public boolean teacherCommitGrade(int course_id,int stud_id,int teacher_id,double grade){
        return DAOFactory.getTeacherCourseDAO().teacherCommitGrade(course_id,teacher_id,stud_id,grade);
     }
}
