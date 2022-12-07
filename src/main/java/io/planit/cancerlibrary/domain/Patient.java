package io.planit.cancerlibrary.domain;

import io.planit.cancerlibrary.domain.embedded.PatientDetail;

import java.util.Date;

public class Patient {

    public static final String TABLE = "PH_PATIENT";

    private String ptNo;
    private String ptNm;
    private String sexTpCd;
    private String ptBrdyDt;
    private String hspTpCd;
    private Date idxDt;
    private PatientDetail detail;

    public String getPtNo() {
        return ptNo;
    }

    public void setPtNo(String ptNo) {
        this.ptNo = ptNo;
    }

    public Patient ptNo(String ptNo) {
        this.ptNo = ptNo;
        return this;
    }

    public String getPtNm() {
        return ptNm;
    }

    public void setPtNm(String ptNm) {
        this.ptNm = ptNm;
    }

    public Patient ptNm(String ptNm) {
        this.ptNm = ptNm;
        return this;
    }

    public String getSexTpCd() {
        return sexTpCd;
    }

    public void setSexTpCd(String sexTpCd) {
        this.sexTpCd = sexTpCd;
    }

    public Patient sexTpCd(String sexTpCd) {
        this.sexTpCd = sexTpCd;
        return this;
    }

    public String getPtBrdyDt() {
        return ptBrdyDt;
    }

    public void setPtBrdyDt(String ptBrdyDt) {
        this.ptBrdyDt = ptBrdyDt;
    }

    public Patient ptBrdyDt(String ptBrdyDt) {
        this.ptBrdyDt = ptBrdyDt;
        return this;
    }

    public String getHspTpCd() {
        return hspTpCd;
    }

    public void setHspTpCd(String hspTpCd) {
        this.hspTpCd = hspTpCd;
    }

    public Patient hspTpCd(String hspTpCd) {
        this.hspTpCd = hspTpCd;
        return this;
    }

    public Date getIdxDt() {
        return idxDt;
    }

    public void setIdxDt(Date idxDt) {
        this.idxDt = idxDt;
    }

    public Patient idxDt(Date idxDt) {
        this.idxDt = idxDt;
        return this;
    }

    public PatientDetail getDetail() {
        return detail;
    }

    public void setDetail(PatientDetail detail) {
        this.detail = detail;
    }

    public Patient detail(PatientDetail detail) {
        this.detail = detail;
        return this;
    }

    public Patient() {
        // default constructor
    }
}
