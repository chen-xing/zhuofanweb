package top.chenzhuofan.web.rest;

import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.unit.DataSize;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import top.chenzhuofan.web.bean.BaseResponse;
import top.chenzhuofan.web.bean.DataConvertorInput;
import top.chenzhuofan.web.bean.IndexPageUrlInfoBean;
import top.chenzhuofan.web.bean.ItNewsBean;
import top.chenzhuofan.web.enums.DataTypeConverterEnum;
import top.chenzhuofan.web.request.GetNewsInfoRequest;
import top.chenzhuofan.web.response.GetNewsInfoResponse;
import top.chenzhuofan.web.service.IndexPageService;
import top.chenzhuofan.web.service.compent.GithubService;
import top.chenzhuofan.web.util.RedissonCache;
import top.chenzhuofan.web.util.UUIDUtil;
import top.chenzhuofan.web.util.YamlUtil;
import top.chenzhuofan.web.util.aop.MethodMonitor;

import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * 功能说明：
 *
 * @author fengqingyang
 * @return
 * @date [2019年06月02日上午21:29]
 */
@Slf4j
@Controller
@RequestMapping("/webapi")
public class WebApiController {
    @Autowired private IndexPageService indexPageService;

    @Autowired private GithubService githubService;

    /**
     * 功能说明：数据类型转换
     *
     * @params
     * @return <br>
     *     修改历史<br>
     *     [2019年10月26日 14:01:48 14:01] 创建方法by fengqingyang<br>
     */
    @RequestMapping(value = "/datatypeConvert", method = RequestMethod.POST)
    @ResponseBody
    @MethodMonitor
    public BaseResponse<String> dataConvertor(@RequestBody DataConvertorInput dataConvertorInput) {
        String output = null;
        String input = dataConvertorInput.getInput();
        try {
            switch (DataTypeConverterEnum.getDataTypeConverterEnumByType(
                    dataConvertorInput.getConvertorType())) {
                case JSONTOYAML:
                    output = YamlUtil.jsonToYaml(input);
                    break;
                case YAMLTOJSON:
                    output = YamlUtil.yamlToJson(input);
                    break;
                case YML2PROPERTIES:
                    output = YamlUtil.yml2Properties(input);
                    break;
                case PROPERTIES2YAML:
                    output = YamlUtil.properties2Yaml(input);
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            output = ex.getMessage();
            log.error("dataConvertor error:{}", ex.getMessage());
        }
        return new BaseResponse(output);
    }

    /**
     * 功能说明：获取首页信息
     *
     * @params
     * @return <br>
     *     修改历史<br>
     *     [2019年10月26日 14:01:37 14:01] 创建方法by fengqingyang<br>
     */
    @RequestMapping(value = "/getPageInfo", method = RequestMethod.POST)
    @ResponseBody
    @MethodMonitor
    public BaseResponse<List<IndexPageUrlInfoBean>> getPageInfo() {
        List<IndexPageUrlInfoBean> indexPageUrlInfoBeanList = indexPageService.getIndexPageInfo();
        return new BaseResponse(indexPageUrlInfoBeanList);
    }

    /**
     * 获取图片地址
     *
     * @params
     * @return <br>
     *     修改历史<br>
     *     [2019年10月26日 14:01:37 14:01] 创建方法by fengqingyang<br>
     */
    @RequestMapping(value = "/images", method = RequestMethod.POST)
    @ResponseBody
    @MethodMonitor
    public BaseResponse<String> getImageUrl(@RequestParam("Filedata") MultipartFile file) {
        BaseResponse<String> baseResponse = new BaseResponse<String>(null);
        long size = file.getSize();
        if (DataSize.ofMegabytes(5).compareTo(DataSize.ofBytes(size)) > 1) {
            baseResponse.setSuccess(false);
            baseResponse.setData("超过文件的最大5M的限制");
        } else {
            String fileName = file.getOriginalFilename();
            // 获取后缀
            String suffixName = fileName.substring(fileName.lastIndexOf("."));

            try {
                String uuid = DateUtil.format(new Date(), "yyyyMMddHHmmssSSS");
                String finalUrl = githubService.getUploadUrl(uuid + suffixName, file.getBytes());
                if (StringUtils.isEmpty(finalUrl)) {
                    baseResponse.setSuccess(false);
                    baseResponse.setData("内部服务错误");
                } else {
                    log.info("upload url is:{}", finalUrl);
                    baseResponse.setSuccess(true);
                    baseResponse.setData(finalUrl);
                }
            } catch (IOException e) {
                log.error("get file byte error:{}", e.getMessage());
                baseResponse.setSuccess(false);
                baseResponse.setData(e.getMessage());
            }
        }
        return baseResponse;
    }
}
