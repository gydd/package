package com.ssm.combine.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{
	private List<String> allowedPass;//允许controller列表（注入方式）
	/**
	 * 在Controller的处理方法之前被执行
	 * 执行一些初始化，权限判断，日志等处理
	 * 如果返回false 将不会执行Controller中的处理方法
	 * */
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp,
			Object object) throws Exception {
		
		//登录拦截器
		/*1判断session中是否有值，有值-----放行
		 *2session中没有值 ，判断请求是否是toLogin.do和login.do 如果是----放行
		 *3、跳转到toLogin.do
		 * */
		String path=req.getRequestURI().toString();
		HttpSession session = req.getSession();
		/*正常退出*/
		if(session.getAttribute("userInfo")!=null&&path.endsWith("loginOut.do"))
		{
			session.removeAttribute("userInfo");
			resp.sendRedirect("JSP/welcome/index.jsp");
			return false;
		}
		/*判断session中值是否存在*/
		if(session.getAttribute("userInfo")!=null)
		return true;//session中有值跳转(文件操作)
	
		/*通过允许列表(session未放置跳转)*/
		for (String allowed : getAllowedPass()) {
			if(path.endsWith(allowed))
				return true;
		}
		/*返回首页(session未放置跳转)*/
		resp.sendRedirect("index.jsp");
		return false;
	}
	/**
	 * 在Controller处理方法执行之后，在被渲染之前 执行
	 * 关闭，释放，处理一些Controller执行中需要的资源
	 * */
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}
	/**
	 * 在渲染器渲染后被执行
	 * 处理一个请求后的一些清理
	 * */
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	
	}
	public List<String> getAllowedPass() {
		return allowedPass;
	}
	public void setAllowedPass(List<String> allowedPass) {
		this.allowedPass = allowedPass;
	}
}
