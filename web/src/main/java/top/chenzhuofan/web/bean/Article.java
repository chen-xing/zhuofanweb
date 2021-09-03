package top.chenzhuofan.web.bean;

import io.searchbox.annotations.JestId;
import lombok.Data;

/**
 * @author chen xing
 * @description TODO
 * @date 2021-09-03 21:06
 */
@Data
public class Article {
    @JestId
    private String id;
    private String fileFingerprint;
    private String author;
    private String title;
    private String path;
    private String content;
    private String highlightContent;
}