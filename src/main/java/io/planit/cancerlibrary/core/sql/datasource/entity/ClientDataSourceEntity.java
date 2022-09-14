package io.planit.cancerlibrary.core.sql.datasource.entity;

import io.planit.cancerlibrary.domain.AbstractAuditingEntity;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "PH_DB")
@Getter
@Setter
public class ClientDataSourceEntity extends AbstractAuditingEntity implements Serializable {
    private static  final long sereialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequenceGenerator")
    @SequenceGenerator(name = "sequenceGenerator")
    @Column(name="id")
    private Long id;

    @Size(max = 50)
    @Column(name="db_key")
    private String dbKey;

    @Size(max = 200)
    @Column(name = "driver_nm")
    private String driverClassName;

    @Size(max = 200)
    @Column(name = "jdbc_url")
    private String url;

    @Size(max = 200)
    @Column(name = "user_nm")
    private String username;

    @Size(max = 200)
    @Column(name = "user_pw")
    private String password;

    @Size(max = 10)
    @Column(name = "db_type")
    private String dbmsType;

    @Size(max = 10)
    @Column(name = "schema")
    private String schema;

    @Column(name="is_active")
    private Boolean isActive;

    @Size(max = 10)
    @Column(name="dbms")
    private String type;

    public ClientDataSourceEntity dbKey(String _dbKey) {
        this.dbKey = _dbKey;
        return this;
    }

    public ClientDataSourceEntity driverClassName(String _driverClassName) {
        this.driverClassName = _driverClassName;
        return this;
    }

    public ClientDataSourceEntity url(String jdbcUrl) {
        this.url = jdbcUrl;
        return this;
    }

    public ClientDataSourceEntity username(String _username) {
        this.username = _username;
        return this;
    }

    public ClientDataSourceEntity password(String _password) {
        this.password = _password;
        return this;
    }

    public ClientDataSourceEntity dbmsType(String _dbmsType) {
        this.dbmsType = _dbmsType;
        return this;
    }

    public ClientDataSourceEntity schema(String _schema) {
        this.schema = _schema;
        return this;
    }

    public ClientDataSourceEntity isActive(boolean _isActive) {
        this.isActive = _isActive;
        return this;
    }

    public ClientDataSourceEntity type(String _type) {
        this.type = _type;
        return this;
    }

    public String getUniqueDbKey() {
        return getDbKey() + getDbmsType();
    }

    @Override
    public boolean equals(Object o) {
        if ( this == o) {
            return true;
        }

        if ( o == null || getClass() != o.getClass()) {
            return false;
        }

        return id != null && id.equals(((ClientDataSourceEntity)o).id);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }

    @Override
    public String toString() {
        return "ClientDatasource{" +
        "id=" + id +
        ", db_key = "  + dbKey +
        ", driverClassName = "  + driverClassName +
        ", jdbcUrl = " + url +
        ", name = " + username +
        ", password = " + password +
        ", dbmsType = " + dbmsType +
        ", schema = " + schema +
        ", isActive = " +  isActive.toString() +
        ", dbms = "  + type +
        "}";
    }
}


