package top.chenzhuofan.web.util.aop;

import java.lang.annotation.*;

/**
 * 功能说明：
 *
 * @return <br>
 *     修改历史：<br>
 *     1.[2018年05月04日上午13:50] 创建方法 by chenxing
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface MethodMonitor {}
