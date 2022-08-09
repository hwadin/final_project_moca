package net.koreate.moca.common.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class LogAOPAdvice {

	@Around("execution(* net.koreate.moca.*.controller.*.*(..))")
	public Object controllerLog(ProceedingJoinPoint pjp) {

		log.info("Around [controller] Log START");
		log.info("==== controller name : " + pjp.getTarget());
		log.info("==== method name : " + pjp.getSignature().getName());
		log.info("==== method param : " + Arrays.toString(pjp.getArgs()));

		Object o = null;
		try {
			o = pjp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}

		if (o != null) {
			log.info("==== return Object : " + o);
			log.info("==== return Object String : " + o.toString());
		}

		log.info("Around [controller] Log END");
		return o;
	}

	@Around("execution(* net.koreate.moca.*.service.*.*(..))")
	public Object serviceLog(ProceedingJoinPoint pjp) {

		log.info("Around [service] Log START");
		log.info("==== service name : " + pjp.getTarget());
		log.info("==== method name : " + pjp.getSignature().getName());
		log.info("==== method param : " + Arrays.toString(pjp.getArgs()));

		Object o = null;
		try {
			o = pjp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}

		if (o != null) {
			log.info("==== return Object : " + o);
			log.info("==== return Object String : " + o.toString());
		}

		log.info("Around [service] Log END");
		return o;
	}

}
