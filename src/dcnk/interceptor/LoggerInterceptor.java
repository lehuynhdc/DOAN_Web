package dcnk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import dcnk.entity.User;

public class LoggerInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	SessionFactory factory;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if(session.getAttribute("username")==null) {
			response.sendRedirect(request.getContextPath());
			return false;
		}
		else {
			if(session.getAttribute("role").equals("PQ2")) {
				response.sendRedirect(request.getContextPath()+"/home.htm");
				return false;
			}
		}
		return true;
	}
	
}
