package io.planit.cancerlibrary.domain;

import java.time.Instant;
import java.util.Date;

public class Patient {

    private String ptNo;
    private String ptNm;
    private String sexTpCd;
    private String ptBrdyDt;
    private String hspTpCd;
    private Date idxDt;
    private String status;
    private String createdBy;
    private Instant createdDate;
    private String lastModifiedBy;
    private Instant lastModifiedDate;

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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Patient status(String status) {
        this.status = status;
        return this;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Patient createdBy(String createdBy) {
        this.createdBy = createdBy;
        return this;
    }

    public Instant getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Instant createdDate) {
        this.createdDate = createdDate;
    }

    public Patient createdDate(Instant createdDate) {
        this.createdDate = createdDate;
        return this;
    }

    public String getLastModifiedBy() {
        return lastModifiedBy;
    }

    public void setLastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
    }

    public Patient lastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
        return this;
    }

    public Instant getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Instant lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }

    public Patient lastModifiedDate(Instant lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
        return this;
    }

    public Patient() {
    }
}
