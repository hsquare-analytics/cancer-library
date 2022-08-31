package io.planit.cancerlibrary.domain;

import java.io.Serializable;
import java.time.Instant;
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

@Entity
@Table(name = "ph_user_category")
public class UserCategory extends AbstractAuditingEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequenceGenerator")
    @SequenceGenerator(name = "sequenceGenerator")
    private Long id;

    @NotNull
    @ManyToOne(optional = false)
    private User user;

    @NotNull
    @ManyToOne(optional = false)
    private Category category;

    @NotNull
    @Column(nullable = false)
    private boolean activated = false;

    @Size(min = 3, max = 50)
    @Column(name = "term_column", nullable = false)
    private String termColumn;

    @Column(name = "term_start")
    private Instant termStart;

    @Column(name = "term_end")
    private Instant termEnd;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public UserCategory user(User user) {
        this.user = user;
        return this;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public UserCategory category(Category category) {
        this.category = category;
        return this;
    }

    public boolean isActivated() {
        return activated;
    }

    public void setActivated(boolean activated) {
        this.activated = activated;
    }

    public UserCategory activated(boolean activated) {
        this.activated = activated;
        return this;
    }

    public String getTermColumn() {
        return termColumn;
    }

    public void setTermColumn(String termColumn) {
        this.termColumn = termColumn;
    }

    public UserCategory termColumn(String termColumn) {
        this.termColumn = termColumn;
        return this;
    }

    public Instant getTermStart() {
        return termStart;
    }

    public void setTermStart(Instant termStart) {
        this.termStart = termStart;
    }

    public UserCategory termStart(Instant termStart) {
        this.termStart = termStart;
        return this;
    }

    public Instant getTermEnd() {
        return termEnd;
    }

    public void setTermEnd(Instant termEnd) {
        this.termEnd = termEnd;
    }

    public UserCategory termEnd(Instant termEnd) {
        this.termEnd = termEnd;
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

        return id != null && id.equals(((UserCategory) o).id);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }

    @Override
    public String toString() {
        return "UserCategory{" +
            "id=" + id +
            ", user=" + user +
            ", category=" + category +
            ", activated=" + activated +
            ", termColumn='" + termColumn + '\'' +
            ", termStart=" + termStart +
            ", termEnd=" + termEnd +
            '}';
    }
}
