package top.chenzhuofan.web.dal.entity;

import lombok.Data;

import java.util.Date;

@Data
public class WebUrl {
    private Long id;

    private String uuid;

    private String title;

    private String description;

    private String url;

    private String icoImage;

    private Integer sort;

    private Integer deleted;

    private String webCategoryUuid;

    private Integer innerUrl;

    private String templateUrl;

    private Date gmtCreate;

    private Date gmtModify;
}
