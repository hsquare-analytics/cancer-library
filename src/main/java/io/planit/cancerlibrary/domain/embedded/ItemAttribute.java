package io.planit.cancerlibrary.domain.embedded;

import java.io.Serializable;
import javax.persistence.Embeddable;

@Embeddable
public class ItemAttribute implements Serializable {
    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public ItemAttribute type(String type) {
        this.setType(type);
        return this;
    }
}
