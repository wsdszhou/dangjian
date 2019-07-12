package cn.zjw.pojo;

public class PropertyValue {
    private Integer id;

    private Integer product_id;

    private Integer properti_id;

    private String value;

    private Property property;

    public Property getProperty() {
        return property;
    }

    public void setProperty(Property property) {
        this.property = property;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
    }

    public Integer getProperti_id() {
        return properti_id;
    }

    public void setProperti_id(Integer properti_id) {
        this.properti_id = properti_id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value == null ? null : value.trim();
    }
}