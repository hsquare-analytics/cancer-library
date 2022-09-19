package io.planit.cancerlibrary.domain;

import java.io.Serializable;
import java.time.Instant;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.data.annotation.CreatedDate;

@Entity
@Table(name = "ph_topic")
public class Topic implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequenceGenerator")
    @SequenceGenerator(name = "sequenceGenerator")
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "seq", length = 30, nullable = false)
    private Integer seq;

    @NotNull
    @Size(max = 50)
    @Column(name = "name", length = 30, nullable = false)
    private String name;

    @NotNull
    @Column(name = "activated")
    private Boolean activated;

    @CreatedDate
    @Column(name = "load_dtm", updatable = false)
    private Instant loadDtm = Instant.now();

    @NotNull
    @ManyToOne(optional = false)
    private Subject subject;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Topic id(Long id) {
        this.id = id;
        return this;
    }

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

    public Topic seq(Integer seq) {
        this.seq = seq;
        return this;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Topic name(String name) {
        this.name = name;
        return this;
    }

    public Boolean getActivated() {
        return activated;
    }

    public void setActivated(Boolean activated) {
        this.activated = activated;
    }

   public Topic activated(Boolean activated) {
        this.activated = activated;
        return this;
    }

    public Instant getLoadDtm() {
        return loadDtm;
    }

    public void setLoadDtm(Instant loadDtm) {
        this.loadDtm = loadDtm;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public Topic subject(Subject subject) {
        this.subject = subject;
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
        Topic subject = (Topic) o;
        return id.equals(subject.id) && seq.equals(subject.seq) && name.equals(subject.name) && activated.equals(
            subject.activated);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, seq, name, activated);
    }

    @Override
    public String toString() {
        return "Topic{" +
            "id=" + id +
            ", seq='" + seq + '\'' +
            ", name='" + name + '\'' +
            ", activated=" + activated +
            '}';
    }
}
