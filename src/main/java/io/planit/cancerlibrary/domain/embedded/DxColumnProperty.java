package io.planit.cancerlibrary.domain.embedded;

import java.io.Serializable;
import javax.persistence.Embeddable;

@Embeddable
public class DxColumnProperty implements Serializable {

    private Integer visibleIndex;

    public Integer getVisibleIndex() {
        return visibleIndex;
    }

    public void setVisibleIndex(Integer visibleIndex) {
        this.visibleIndex = visibleIndex;
    }

    public DxColumnProperty visibleIndex(Integer visibleIndex) {
        this.setVisibleIndex(visibleIndex);
        return this;
    }
}
