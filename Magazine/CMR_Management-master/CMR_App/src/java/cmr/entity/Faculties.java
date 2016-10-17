/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.entity;

import java.sql.Date;

/**
 *
 * @author BUIVUHUECHI
 */
public class Faculties {
    private int facultyID;
    private String facultyName;
    private Date academicYear;
    private int mc_ID;
    private int op_ID;
    private Date fa_startDate;
    private Date fa_endDate;

    public Faculties() {
    }

    public Faculties(String facultyName, Date academicYear, int mc_ID, int op_ID, Date fa_startDate, Date fa_endDate) {
        this.facultyName = facultyName;
        this.academicYear = academicYear;
        this.mc_ID = mc_ID;
        this.op_ID = op_ID;
        this.fa_startDate = fa_startDate;
        this.fa_endDate = fa_endDate;
    }

    public int getFacultyID() {
        return facultyID;
    }

    public void setFacultyID(int facultyID) {
        this.facultyID = facultyID;
    }

    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }

    public Date getAcademicYear() {
        return academicYear;
    }

    public void setAcademicYear(Date academicYear) {
        this.academicYear = academicYear;
    }

    public int getMc_ID() {
        return mc_ID;
    }

    public void setMc_ID(int mc_ID) {
        this.mc_ID = mc_ID;
    }

    public int getOp_ID() {
        return op_ID;
    }

    public void setOp_ID(int op_ID) {
        this.op_ID = op_ID;
    }

    public Date getFa_startDate() {
        return fa_startDate;
    }

    public void setFa_startDate(Date fa_startDate) {
        this.fa_startDate = fa_startDate;
    }

    public Date getFa_endDate() {
        return fa_endDate;
    }

    public void setFa_endDate(Date fa_endDate) {
        this.fa_endDate = fa_endDate;
    }
    
    
    
}
