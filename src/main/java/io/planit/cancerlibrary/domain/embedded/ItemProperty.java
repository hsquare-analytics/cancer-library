package io.planit.cancerlibrary.domain.embedded;

import java.io.Serializable;
import javax.persistence.Embeddable;

@Embeddable
public class ItemProperty implements Serializable {

    private Integer visibleIndex;

    private String caption ;

    public Integer getVisibleIndex() {
        return visibleIndex;
    }

    public void setVisibleIndex(Integer visibleIndex) {
        this.visibleIndex = visibleIndex;
    }

    public ItemProperty visibleIndex(Integer visibleIndex) {
        this.setVisibleIndex(visibleIndex);
        return this;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public ItemProperty caption(String caption) {
        this.setCaption(caption);
        return this;
    }
}
