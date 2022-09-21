package io.planit.cancerlibrary.domain.embedded;

import java.io.Serializable;
import javax.persistence.Embeddable;

@Embeddable
public class ItemAttribute implements Serializable {
    private String dataType;

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public ItemAttribute dataType(String dataType) {
        this.setDataType(dataType);
        return this;
    }
}
