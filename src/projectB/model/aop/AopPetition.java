package projectB.model.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import projectB.model.login.LoginUtils;

@Aspect
public class AopPetition {
	@Around("execution(public * projectB.model..upload_*(..))")
	public Object checklogin(ProceedingJoinPoint jp) throws Throwable {
		System.out.println("upload_petition");
		
		RequestAttributes ra = RequestContextHolder.currentRequestAttributes();
		ServletRequestAttributes sra = (ServletRequestAttributes)ra;
		
		HttpServletRequest request = sra.getRequest();
		HttpSession session = request.getSession();
		
		System.out.println("id = " + LoginUtils.getLoginID(session));
		Object view = "redirect:/login/loginForm.aa";
		if(LoginUtils.isLogin(session)) {
			view = jp.proceed();
		}
		return view;
	}
	
	@Around("execution(public * projectB.model.answer..*(..))")
	public Object checklogin_answer(ProceedingJoinPoint jp) throws Throwable {
		System.out.println("checklogin_answer");
		
		RequestAttributes ra = RequestContextHolder.currentRequestAttributes();
		ServletRequestAttributes sra = (ServletRequestAttributes)ra;
		
		HttpServletRequest request = sra.getRequest();
		HttpSession session = request.getSession();
		
		System.out.println("id = " + LoginUtils.getLoginID(session));
		Object view = "redirect:/login/loginForm.aa";
		if(LoginUtils.isLogin(session, LoginUtils.ANSWER)) {
			view = jp.proceed();
		}
		return view;
	}
	
	@Around("execution(public * projectB.model.admin..*(..))")
	public Object checklogin_admin(ProceedingJoinPoint jp) throws Throwable {
		System.out.println("checklogin_answer");
		
		RequestAttributes ra = RequestContextHolder.currentRequestAttributes();
		ServletRequestAttributes sra = (ServletRequestAttributes)ra;
		
		HttpServletRequest request = sra.getRequest();
		HttpSession session = request.getSession();
		
		System.out.println("id = " + LoginUtils.getLoginID(session));
		Object view = "redirect:/login/loginForm.aa";
		if(LoginUtils.isLogin(session, LoginUtils.ADMIN)) {
			view = jp.proceed();
		}
		return view;
	}
}
