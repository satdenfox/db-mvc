package biz.denfox.web.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.hibernate.mapping.Join;
import org.springframework.stereotype.Component;
import sun.rmi.runtime.Log;

import java.util.logging.Logger;

@Component
@Aspect
public class LoggingAspect {

    Logger aspectLogger = Logger.getLogger(LoggingAspect.class.getName());


    @Pointcut("execution(* biz.denfox.web.controller.*.*(..))")
    private void controllerPackage() {};

    @Pointcut("execution(* biz.denfox.web.service.*.*(..))")
    private void servicePackage() {};

    @Pointcut("execution(* biz.denfox.web.dao.*.*(..))")
    private void daoPackage() {};

    @Pointcut("controllerPackage() || servicePackage() || daoPackage()")
    private void appFlow() {};


    @Before("appFlow()")
    public void processBeforeAdvice(JoinPoint joinPoint) {
        aspectLogger.info("===> Before Advice: Signature: " + joinPoint.getSignature());

        Object[] objects = joinPoint.getArgs();
        for (Object obj :
                objects) {
            aspectLogger.info("Arg:" + obj);
        }

    }

    @AfterReturning(pointcut = "appFlow()",
            returning = "result" )
    public void processAfterReturning(JoinPoint joinPoint, Object result) {
        aspectLogger.info("===> AfterReturning Advice: Signature: " + joinPoint.getSignature() +
                " Result: " + result);

    }


}
