package io.planit.cancerlibrary.service.dto;

import io.planit.cancerlibrary.domain.Codebook;
import io.planit.cancerlibrary.domain.embedded.Lookup;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

public class CodebookDTO {

    private Long id;

    @NotNull
    @Size(min = 1, max = 50)
    private String title;

    private String description;

    private List<Lookup> lookupList = new ArrayList<>();

    private String createdBy;

    private Instant createdDate;

    private String lastModifiedBy;

    private Instant lastModifiedDate;

    public CodebookDTO() {
    }

    public CodebookDTO(Codebook codebook) {
        this.id = codebook.getId();
        this.title = codebook.getTitle();
        this.description = codebook.getDescription();
        this.lookupList = codebook.getLookupList();
        this.createdBy = codebook.getCreatedBy();
        this.createdDate = codebook.getCreatedDate();
        this.lastModifiedBy = codebook.getLastModifiedBy();
        this.lastModifiedDate = codebook.getLastModifiedDate();
    }

    public Codebook toEntity() {
        Codebook codebook = new Codebook();
        codebook.setId(this.id);
        codebook.setTitle(this.title);
        codebook.setDescription(this.description);
        codebook.setLookupList(this.lookupList);
        codebook.setCreatedBy(this.createdBy);
        codebook.setCreatedDate(this.createdDate);
        codebook.setLastModifiedBy(this.lastModifiedBy);
        codebook.setLastModifiedDate(this.lastModifiedDate);
        return codebook;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
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

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Instant getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Instant createdDate) {
        this.createdDate = createdDate;
    }

    public String getLastModifiedBy() {
        return lastModifiedBy;
    }

    public void setLastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
    }

    public Instant getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Instant lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }
}
