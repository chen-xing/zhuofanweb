package top.chenzhuofan.web.util.aop;

import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.UUID;

/**
 * 功能说明：
 *
 * @return <br>
 *     修改历史：<br>
 *     1.[2018年05月04日上午13:51] 创建方法 by chenxing
 */
@Aspect
@Component
@Slf4j
public class MethodMonitorAspect {

    private final Gson gson = new Gson();

    /** 定义一个切入点 */
    @Pointcut("@annotation(top.chenzhuofan.web.util.aop.MethodMonitor)")
    private void methodMonitorAspect() {}

    /**
     * 功能说明：
     *
     * @return <br>
     *     修改历史<br>
     *     [2018年12月05日 10:15:56 10:15] 创建方法by fengqingyang
     * @params
     */
    @Around("methodMonitorAspect()")
    public Object methodMonitor(ProceedingJoinPoint pjp) throws Throwable {
        String contextId = UUID.randomUUID().toString().replace("-", "");

        // 方法通知前获取时间,为什么要记录这个时间呢？当然是用来计算模块执行时间的
        long start = System.currentTimeMillis();
        long end = 0L;
        // 拦截的实体类，就是当前正在执行的方法
        Object target = pjp.getTarget();

        Signature sig = pjp.getSignature();
        // 拦截的方法名称
        String methodName = sig.getName();
        // 拦截的方法参数
        Object[] args = pjp.getArgs();
        if (null != args && args.length == 1) {
            Object model = args[0];
            log.info(
                    "【contextId:{}】 target：{} method： {} 调用的参数是 {} ",
                    contextId,
                    target,
                    methodName,
                    gson.toJson(model));
        }
        // 拦截的参数类型
        MethodSignature msig = null;
        if (!(sig instanceof MethodSignature)) {
            throw new IllegalArgumentException("该注解只能用于方法");
        }
        msig = (MethodSignature) sig;
        Class[] parameterTypes = msig.getMethod().getParameterTypes();

        Object object = null;
        // 获得被拦截的方法
        Method method = null;
        try {
            method = target.getClass().getMethod(methodName, parameterTypes);
        } catch (NoSuchMethodException e) {
            //  Auto-generated catch block
            log.warn("methodMonitor error {}", e);
        } catch (SecurityException e) {
            //  Auto-generated catch block
            log.warn("methodMonitor error {}", e);
        }

        if (null != method) {
            // 判断是否包含自定义的注解，说明一下这里的SystemLog就是我自己自定义的注解
            if (method.isAnnotationPresent(MethodMonitor.class)) {
                MethodMonitor methodMonitor = method.getAnnotation(MethodMonitor.class);
                try {
                    object = pjp.proceed();
                } catch (Throwable e) {
                    log.warn("【contextId:{}】 method proceed error {}", contextId, e.getMessage());
                    log.warn(
                            "【contextId:{}】 method {} param {}",
                            contextId,
                            methodName,
                            gson.toJson(args));
                    throw e;
                } finally {
                    end = System.currentTimeMillis();

                    String result = "";
                    if (null != object) {
                        result = gson.toJson(object);
                    }
                    // : 2017/2/28 日志记载
                    log.info(
                            "【contextId:{}】 target：{} method： {} 执行的结果是:{} cost {} ms",
                            contextId,
                            target,
                            methodName,
                            result,
                            (end - start));
                }
            } else { // 没有包含注解
                object = pjp.proceed();
            }
        } else { // 不需要拦截直接执行
            object = pjp.proceed();
        }
        return object;
    }
}
