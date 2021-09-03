package top.chenzhuofan.web.rest;

import io.searchbox.client.JestClient;
import io.searchbox.core.Search;
import io.searchbox.core.SearchResult;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.HtmlUtils;
import top.chenzhuofan.web.bean.Article;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author chen xing
 * @description 搜索相关的接口
 * @date 2021-09-03 20:54
 */
@Controller
@Slf4j
public class SearchApiController {
    @Autowired private JestClient jestClient;

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam String keyword, Model model) {
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        QueryBuilder queryBuilder =
                QueryBuilders.boolQuery()
                        .should(QueryBuilders.matchPhrasePrefixQuery("title", keyword))
                        .should(QueryBuilders.matchPhrasePrefixQuery("content", keyword))
                        .should(QueryBuilders.matchPhrasePrefixQuery("path", keyword));
        searchSourceBuilder.query(queryBuilder);

        HighlightBuilder highlightBuilder = new HighlightBuilder();
        // path属性高亮度
        HighlightBuilder.Field highlightPath = new HighlightBuilder.Field("path");
        highlightPath.highlighterType("unified");
        highlightBuilder.field(highlightPath);
        // title字段高亮度
        HighlightBuilder.Field highlightTitle = new HighlightBuilder.Field("title");
        highlightTitle.highlighterType("unified");
        highlightBuilder.field(highlightTitle);
        // content字段高亮度
        HighlightBuilder.Field highlightContent = new HighlightBuilder.Field("content");
        highlightContent.highlighterType("unified");
        highlightBuilder.field(highlightContent);

        // 高亮度配置生效
        searchSourceBuilder.highlighter(highlightBuilder);

        log.info("搜索条件{}", searchSourceBuilder.toString());

        // 构建搜索功能
        Search search =
                new Search.Builder(searchSourceBuilder.toString())
                        .addIndex("diskfile")
                        .addType("_doc")
                        .build();
        try {
            // 执行
            SearchResult result = jestClient.execute(search);
            List<Article> articles = new ArrayList<>();
            result.getHits(Article.class)
                    .forEach(
                            (value) -> {
                                if (value.highlight != null
                                        && value.highlight.get("content") != null) {
                                    StringBuffer highlightContentBuffer = new StringBuffer();
                                    value.highlight
                                            .get("content")
                                            .forEach(
                                                    v -> {
                                                        highlightContentBuffer.append(v);
                                                    });
                                    value.source.setHighlightContent(
                                            HtmlUtils.htmlUnescape(
                                                    highlightContentBuffer.toString()));
                                }
                                value.source.setContent(value.source.getContent());
                                articles.add(value.source);
                            });
            model.addAttribute("articles", articles);
            model.addAttribute("keyword", keyword);
            return "search";
        } catch (IOException e) {
            log.error("{}", e.getLocalizedMessage());
        }
        return "search";
    }
}
