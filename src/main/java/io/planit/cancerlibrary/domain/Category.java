package io.planit.cancerlibrary.domain;

import java.io.Serializable;
import java.time.Instant;
import java.util.Objects;
import javax.persistence.*;
import javax.validation.constraints.*;
import org.springframework.data.annotation.CreatedDate;

@Entity
@Table(name = "ph_category")
public class Category implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequenceGenerator")
    @SequenceGenerator(name = "sequenceGenerator")
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "seq", nullable = false)
    private Integer seq;

    @NotNull
    @Size(max = 30)
    @Column(name = "name", length = 30, nullable = false)
    private String name;

    @NotNull
    @Column(name = "table_name")
    private String tableName;

    @NotNull
    @Column(name = "index_date")
    private String indexDate;

    @NotNull
    @Column(name = "activated", nullable = false)
    private boolean activated;

    @CreatedDate
    @Column(name = "load_dtm", updatable = false)
    private Instant loadDtm = Instant.now();

    @NotNull
    @ManyToOne(optional = false)
    private Topic topic;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Category id(Long id) {
        this.id = id;
        return this;
    }

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

    public Category seq(Integer seq) {
        this.seq = seq;
        return this;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public Category name(String name) {
        this.name = name;
        return this;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public Category tableName(String tableName) {
        this.tableName = tableName;
        return this;
    }
    public String getIndexDate() {
        return indexDate;
    }

    public void setIndexDate(String indexDate) {
        this.indexDate = indexDate;
    }

    public Category indexDate(String indexDate) {
        this.indexDate = indexDate;
        return this;
    }

    public Boolean isActivated() {
        return activated;
    }

    public void setActivated(Boolean activated) {
        this.activated = activated;
    }

    public Category activated(Boolean activated) {
        this.activated = activated;
        return this;
    }

    public Instant getLoadDtm() {
        return loadDtm;
    }

    public void setLoadDtm(Instant loadDtm) {
        this.loadDtm = loadDtm;
    }

    public Category loadDtm(Instant loadDtm) {
        this.loadDtm = loadDtm;
        return this;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public Category topic(Topic topic) {
        this.topic = topic;
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
        Category category = (Category) o;
        return id.equals(category.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "Category{" +
            "id=" + id +
            ", seq=" + seq +
            ", name='" + name + '\'' +
            ", tableName='" + tableName + '\'' +
            ", indexDate='" + indexDate + '\'' +
            ", activated=" + activated +
            ", loadDtm=" + loadDtm +
            ", topic=" + topic +
            '}';
    }
}
