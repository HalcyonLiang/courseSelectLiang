package bean;

/**
 * Created by liang on 2016/7/1.
 */
public class TeacherCourse {
    private String courseName = null;
    private String courseDept = null;
    private String courseContent = null ;
    private String teacherName = null;
    private int courseID = 0 ;
    private int teacherID = 0;

    public int getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(int teacherID) {
        this.teacherID = teacherID;
    }

    private int courseWeek = 0;
    private int courseLesson = 0;
    private double grade;

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }

    public int getCourseWeek() {
        return courseWeek;
    }

    public void setCourseWeek(int courseWeek) {
        this.courseWeek = courseWeek;
    }

    public int getCourseLesson() {
        return courseLesson;
    }

    public void setCourseLesson(int courseLesson) {
        this.courseLesson = courseLesson;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseDept() {
        return courseDept;
    }

    public void setCourseDept(String courseDept) {
        this.courseDept = courseDept;
    }

    public String getCourseContent() {
        return courseContent;
    }

    public void setCourseContent(String courseContent) {
        this.courseContent = courseContent;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }
}
