package bean;

/**
 * Created by liang on 2016/7/1.
 */
public class Student {
    private int studID;
    private String studName;
    private String studAccount;
    private double grade;
    private String studClassName;
    private String studSex;

    public String getStudSex() {
        return studSex;
    }

    public void setStudSex(String studSex) {
        this.studSex = studSex;
    }

    public String getStudClassName() {
        return studClassName;
    }

    public void setStudClassName(String studClassName) {
        this.studClassName = studClassName;
    }

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }

    public int getStudID() {
        return studID;
    }

    public void setStudID(int studID) {
        this.studID = studID;
    }

    public String getStudName() {
        return studName;
    }

    public void setStudName(String studName) {
        this.studName = studName;
    }

    public String getStudAccount() {
        return studAccount;
    }

    public void setStudAccount(String studAccount) {
        this.studAccount = studAccount;
    }
}
