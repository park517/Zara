package com.project.zara.aop;

import java.lang.reflect.Method;

import org.apache.ibatis.binding.MapperMethod.MethodSignature;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class LogAdvice {
	
	@Pointcut("execution(* com.project.zara.service..*.*(..))")
	private void cut() {
		
	}
	@Before("cut()")
	 public void before(JoinPoint joinPoint) {
		System.out.println("===============서비스 실행==================");
		System.out.println("메소드 이름 : "+joinPoint.getSignature().getName());
		System.out.println("파라미터");
		Object[] args = joinPoint.getArgs();
		for(Object obj : args) {
			System.out.println("type : "+obj.getClass().getSimpleName());
			System.out.println("value : "+obj);
		}
		System.out.println("-------------------------------------------");
	}
	
	@AfterReturning(value = "cut()", returning = "returnObj")
	public void after(JoinPoint joinPoint , Object returnObj) {
		System.out.println("==============="+joinPoint.getSignature().getName()+"종료==================");
		System.out.println("리턴값 : "+returnObj);
		System.out.println("-----------------------------------------------------------------");
	}
}
