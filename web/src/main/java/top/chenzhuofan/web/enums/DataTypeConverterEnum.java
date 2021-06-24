package top.chenzhuofan.web.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

/**
 * 功能说明：
 *
 * @author fengqingyang
 * @return
 * @date [2019年06月02日上午21:30]
 */
@Slf4j
@Getter
@AllArgsConstructor
public enum DataTypeConverterEnum {
    JSONTOYAML(0),
    YAMLTOJSON(1),
    YML2PROPERTIES(2),
    PROPERTIES2YAML(3);
    private Integer type;

    /**
     * 功能说明：根据type获取DataTypeConverterEnum
     *
     * @params
     * @return <br>
     *     修改历史<br>
     *     [2019年06月02日 21:45:37 21:45] 创建方法by fengqingyang
     */
    public static DataTypeConverterEnum getDataTypeConverterEnumByType(Integer type) {
        for (DataTypeConverterEnum dataTypeConverterEnum : DataTypeConverterEnum.values()) {
            if (dataTypeConverterEnum.getType().equals(type)) {
                return dataTypeConverterEnum;
            }
        }
        return null;
    }
}
