package top.chenzhuofan.web.util;

import java.util.UUID;

/**
 * 功能说明：TODO
 *
 * @author fengqingyang
 * @return
 * @date [2019年04月04日上午22:33]
 */
public class UUIDUtil {
    public static String getUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}
