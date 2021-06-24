package top.chenzhuofan.web.dal.entity;

import lombok.Data;

import java.util.Date;

@Data
public class ItNews {
    private Long id;

    private String newsuuid;

    private String title;

    private String url;

    private Integer readTimes;

    private Integer newsType;

    private String newsBizId;

    private Date gmtCreate;

    private Date gmtModify;
}
