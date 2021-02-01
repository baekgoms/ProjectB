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
	@Around("execution(public * projectB.model.petition..upload_petition(..))")
	public Object checklogin(ProceedingJoinPoint jp) throws Throwable {
		System.out.println("upload_petition");
		
		//request 객체 사용 방법
		RequestAttributes ra = RequestContextHolder.currentRequestAttributes();
		ServletRequestAttributes sra = (ServletRequestAttributes)ra;
		
		HttpServletRequest request = sra.getRequest();
		HttpSession session = request.getSession();
		Object view = "redirect:/login/loginForm.aa";
		if(LoginUtils.isLogin(session)) {
			view = jp.proceed(); //가던길 가라. 정상이동!
		}
		return view;
	}
}
