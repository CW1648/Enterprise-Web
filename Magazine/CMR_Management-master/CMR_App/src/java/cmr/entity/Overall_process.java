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
public class Overall_process {

    private int op_ID;
    private Date op_year;
    private int mm_ID;
    private Date op_startDate;
    private Date op_endDate;

    public Overall_process() {
    }

    public Overall_process(int op_ID, Date op_year, int mm_ID, Date op_startDate, Date op_endDate) {
        this.op_ID = op_ID;
        this.op_year = op_year;
        this.mm_ID = mm_ID;
        this.op_startDate = op_startDate;
        this.op_endDate = op_endDate;
    }

    public int getOp_ID() {
        return op_ID;
    }

    public void setOp_ID(int op_ID) {
        this.op_ID = op_ID;
    }

    public Date getOp_year() {
        return op_year;
    }

    public void setOp_year(Date op_year) {
        this.op_year = op_year;
    }

    public int getMm_ID() {
        return mm_ID;
    }

    public void setMm_ID(int mm_ID) {
        this.mm_ID = mm_ID;
    }

    public Date getOp_startDate() {
        return op_startDate;
    }

    public void setOp_startDate(Date op_startDate) {
        this.op_startDate = op_startDate;
    }

    public Date getOp_endDate() {
        return op_endDate;
    }

    public void setOp_endDate(Date op_endDate) {
        this.op_endDate = op_endDate;
    }
    
    
}
