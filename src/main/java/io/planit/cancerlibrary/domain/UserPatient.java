package io.planit.cancerlibrary.domain;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "ph_user_patient")
public class UserPatient extends AbstractAuditingEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequenceGenerator")
    @SequenceGenerator(name = "sequenceGenerator")
    private Long id;

    @NotNull
    @ManyToOne(optional = false)
    private User user;

    @NotNull
    @Column(name = "patient_no")
    private String patientNo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public UserPatient id(Long id) {
        this.id = id;
        return this;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public UserPatient user(User user) {
        this.user = user;
        return this;
    }

    public String getPatientNo() {
        return patientNo;
    }

    public void setPatientNo(String patientNo) {
        this.patientNo = patientNo;
    }

    public UserPatient patientNo(String patientNo) {
        this.patientNo = patientNo;
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        return id != null && id.equals(((UserPatient) o).id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, user, patientNo);
    }

    @Override
    public String toString() {
        return "UserPatient{" +
            "id=" + id +
            ", user=" + user +
            ", patientNo='" + patientNo + '\'' +
            '}';
    }
}
