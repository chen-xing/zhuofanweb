package top.chenzhuofan.web.dal.entity;

import lombok.Data;

import java.util.Date;

@Data
public class WebCategory {
    private Long id;

    private String uuid;

    private String name;

    private Integer sort;

    private Integer deleted;

    private Date gmtCreate;

    private Date gmtModify;
}
