package top.chenzhuofan.web.util;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.file.FileReader;
import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpResponse;
import com.google.common.collect.Maps;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.text.MessageFormat;
import java.util.Base64;
import java.util.Map;

@Slf4j
public class GitHubApiUtil {
    /**
     * 由于没有考虑sha，故而只能新建文件，而不能更新文件(更新文件需要先get访问得到sha，然后再put)
     *
     * @param url https://api.github.com/repos/:owner/:repo/contents/:path
     * @param file 需确保文件存在
     * @param token 用于鉴权
     * @return
     */
    public static boolean create(String url, byte[] bytes, String token) {
        Map<String, String> bodyMap = Maps.newConcurrentMap();
        bodyMap.put("message", "图床提交");
        bodyMap.put("content", Base64.getEncoder().encodeToString(bytes));

        HttpResponse httpResponse =
                HttpRequest.put(url)
                        .header("Content-Type", "application/json")
                        .header("Authorization", MessageFormat.format("token {0}", token))
                        .body(new Gson().toJson(bodyMap))
                        .timeout(4000)
                        .execute();
        boolean result = new Integer(201).equals(httpResponse.getStatus());
        if (!result) {
            log.error("image upload github error:{}", httpResponse.body());
        }
        return result;
    }

    public static void main(String[] args) {
        String url = "https://api.github.com/repos/chen-xing/figure_bed/contents/cdn/12.png";
        FileReader fileReader = new FileReader("C:\\Users\\fengqingyang\\Desktop\\大文档打标.png");
        byte[] bytes = fileReader.readBytes();
        boolean falg = GitHubApiUtil.create(url, bytes, "c09253ff7d906eb59ec1db7ed74c441d2c245cb3");
        System.out.println(falg);
    }
}
