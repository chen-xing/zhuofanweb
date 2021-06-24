package top.chenzhuofan.web.config;

import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Getter
@Component
public class SystemConfig {
    @Value("${github.owner:''}")
    private String githubOwner;

    @Value("${github.repo:''}")
    private String githubRepo;

    @Value("${github.path:''}")
    private String githuPath;

    @Value("${github.token:''}")
    private String githubToken;
}
