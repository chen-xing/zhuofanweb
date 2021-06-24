package top.chenzhuofan.web.util;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.javaprop.JavaPropsFactory;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.fasterxml.jackson.dataformat.yaml.YAMLGenerator;
import com.fasterxml.jackson.dataformat.yaml.YAMLMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLParser;
import com.google.common.base.Joiner;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.CollectionUtils;
import org.yaml.snakeyaml.Yaml;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * 功能说明：
 *
 * @author fengqingyang
 * @return
 * @date [2019年06月01日上午20:11]
 */
@Slf4j
public class YamlUtil {

    /**
     * 功能说明：json转yaml
     *
     * @params
     * @return <br>
     *     修改历史<br>
     *     [2019年06月01日 20:22:18 20:22] 创建方法by fengqingyang
     */
    public static String jsonToYaml(String json) throws IOException {
        JsonNode jsonNodeTree = new ObjectMapper().readTree(json);
        String jsonAsYaml = new YAMLMapper().writeValueAsString(jsonNodeTree);
        return jsonAsYaml;
    }

    /**
     * 功能说明：yaml转json
     *
     * @params
     * @return <br>
     *     修改历史<br>
     *     [2019年06月01日 20:32:21 20:32] 创建方法by fengqingyang
     */
    public static String yamlToJson(String yaml) throws JsonProcessingException {
        Map map = new Yaml().loadAs(yaml, Map.class);
        return new ObjectMapper().writeValueAsString(map);
    }

    /**
     * 功能说明：yaml转properties
     *
     * @params
     * @return <br>
     *     修改历史<br>
     *     [2019年06月01日 20:56:20 20:56] 创建方法by fengqingyang
     */
    public static String yml2Properties(String yaml) {
        final String DOT = ".";
        List<String> lines = new LinkedList<>();
        try {
            YAMLFactory yamlFactory = new YAMLFactory();
            YAMLParser parser = yamlFactory.createParser(yaml);

            String key = "";
            String value = null;
            JsonToken token = parser.nextToken();
            while (token != null) {
                if (JsonToken.START_OBJECT.equals(token)) {
                    // do nothing
                } else if (JsonToken.FIELD_NAME.equals(token)) {
                    if (key.length() > 0) {
                        key = key + DOT;
                    }
                    key = key + parser.getCurrentName();

                    token = parser.nextToken();
                    if (JsonToken.START_OBJECT.equals(token)) {
                        continue;
                    }
                    value = parser.getText();
                    lines.add(key + "=" + value);

                    int dotOffset = key.lastIndexOf(DOT);
                    if (dotOffset > 0) {
                        key = key.substring(0, dotOffset);
                    }
                    value = null;
                } else if (JsonToken.END_OBJECT.equals(token)) {
                    int dotOffset = key.lastIndexOf(DOT);
                    if (dotOffset > 0) {
                        key = key.substring(0, dotOffset);
                    } else {
                        key = "";
                        lines.add("");
                    }
                }
                token = parser.nextToken();
            }
            parser.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if (!CollectionUtils.isEmpty(lines)) {
            String separator = System.getProperties().getProperty("line.separator");
            String result = Joiner.on(separator).join(lines);
            return result;
        }
        return null;
    }

    /**
     * 功能说明：properties转yaml
     *
     * @params
     * @return <br>
     *     修改历史<br>
     *     [2019年06月01日 21:28:02 21:28] 创建方法by fengqingyang
     */
    public static String properties2Yaml(String properties) {
        JsonParser parser = null;
        JavaPropsFactory factory = new JavaPropsFactory();
        try {
            parser = factory.createParser(properties);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            YAMLFactory yamlFactory = new YAMLFactory();
            YAMLGenerator generator =
                    yamlFactory.createGenerator(new OutputStreamWriter(byteArrayOutputStream));

            JsonToken token = parser.nextToken();

            while (token != null) {
                if (JsonToken.START_OBJECT.equals(token)) {
                    generator.writeStartObject();
                } else if (JsonToken.FIELD_NAME.equals(token)) {
                    generator.writeFieldName(parser.getCurrentName());
                } else if (JsonToken.VALUE_STRING.equals(token)) {
                    generator.writeString(parser.getText());
                } else if (JsonToken.END_OBJECT.equals(token)) {
                    generator.writeEndObject();
                }
                token = parser.nextToken();
            }
            parser.close();
            generator.flush();
            generator.close();

            return byteArrayOutputStream.toString();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        String json =
                "{\n"
                        + "  \"appId\": \"1111563841\",\n"
                        + "  \"businessScenario\": \"风清扬测试\",\n"
                        + "  \"configInfo\": \"{\\\"aa\\\":\\\"bb\\\"}\",\n"
                        + "  \"extendFieldBean\": {\n"
                        + "  \t\"extendField\":{\"PAAS\":\"xxx\"}\n"
                        + "  \t  },\n"
                        + "  \"initiatorAccountIdList\": [\n"
                        + "    {\n"
                        + "      \"accountId\": \"2a4d4cfd64204237bbd66f743231ef14\",\n"
                        + "      \"accountType\": 0\n"
                        + "    }\n"
                        + "  ],\n"
                        + "  \"payingPartyAccountList\": [\n"
                        + "    {\n"
                        + "      \"accountId\": \"9a579e5b53204ceb910139fb3175af74\",\n"
                        + "      \"accountType\": 2\n"
                        + "    }\n"
                        + "  ],\n"
                        + "  \"signValidity\": \"2018-12-13T08:54:35.574Z\"\n"
                        + "}";
        try {
            String yaml = jsonToYaml(json);
            //            System.out.println(yaml);
            String data = yamlToJson(yaml);
            System.out.println(data);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
