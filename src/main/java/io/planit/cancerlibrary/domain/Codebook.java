package io.planit.cancerlibrary.domain;

import io.planit.cancerlibrary.domain.embedded.Lookup;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * A Codebook.
 */
@Entity
@Table(name = "ph_codebook")
public class Codebook implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequenceGenerator")
    @SequenceGenerator(name = "sequenceGenerator")
    @Column(name = "id")
    private Long id;

    @NotNull
    @Size(min = 10, max = 50)
    @Column(name = "title", length = 50, nullable = false)
    private String title;

    @Column(name = "description")
    private String description;

    @ElementCollection
    @CollectionTable(name = "ph_codebook_lookup", joinColumns = @JoinColumn(name = "codebook_id"))
    @Column(name = "title", nullable = false)
    @OrderColumn(name = "order_no")
    private List<Lookup> lookupList = new ArrayList<>();

    public Long getId() {
        return this.id;
    }

    public Codebook id(Long id) {
        this.setId(id);
        return this;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return this.title;
    }

    public Codebook title(String title) {
        this.setTitle(title);
        return this;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return this.description;
    }

    public Codebook description(String description) {
        this.setDescription(description);
        return this;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Lookup> getLookupList() {
        return lookupList;
    }

    public void setLookupList(List<Lookup> lookupList) {
        this.lookupList = lookupList;
    }

    public Codebook lookupList(List<Lookup> lookupList) {
        this.setLookupList(lookupList);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Codebook)) {
            return false;
        }
        return id != null && id.equals(((Codebook) o).id);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }

    @Override
    public String toString() {
        return "Codebook{" +
            "id=" + getId() +
            ", title='" + getTitle() + "'" +
            ", description='" + getDescription() + "'" +
            "}";
    }
}
