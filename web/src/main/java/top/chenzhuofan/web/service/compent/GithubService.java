package top.chenzhuofan.web.service.compent;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.chenzhuofan.web.config.SystemConfig;
import top.chenzhuofan.web.util.GitHubApiUtil;

import java.text.MessageFormat;

@Service
@Slf4j
public class GithubService {
    @Autowired private SystemConfig systemConfig;

    public String getUploadUrl(String fileName, byte[] bytes) {
        String url =
                MessageFormat.format(
                        "https://api.github.com/repos/{0}/{1}/contents/{2}",
                        systemConfig.getGithubOwner(),
                        systemConfig.getGithubRepo(),
                        systemConfig.getGithuPath() + fileName);
        boolean result = GitHubApiUtil.create(url, bytes, systemConfig.getGithubToken());
        if (result) {
            return MessageFormat.format(
                    "https://cdn.jsdelivr.net/gh/{0}/{1}/{2}",
                    systemConfig.getGithubOwner(),
                    systemConfig.getGithubRepo(),
                    systemConfig.getGithuPath() + fileName);
        }
        return null;
    }
}
