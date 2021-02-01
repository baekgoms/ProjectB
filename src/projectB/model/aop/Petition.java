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
public class Petition {
	@Around("execution(public * projectB.model..upload_*(..))")
	public Object checklogin(ProceedingJoinPoint jp) throws Throwable {
		System.out.println("upload_petition");
		
		RequestAttributes ra = RequestContextHolder.currentRequestAttributes();
		ServletRequestAttributes sra = (ServletRequestAttributes)ra;
		
		HttpServletRequest request = sra.getRequest();
		HttpSession session = request.getSession();
		
		Object view = "redirect:/login/loginForm.aa";
		if(LoginUtils.isLogin(session)) {
			view = jp.proceed();
		}
		return view;
	}
}
