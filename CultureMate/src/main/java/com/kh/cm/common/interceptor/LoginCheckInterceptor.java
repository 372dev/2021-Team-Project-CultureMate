package com.kh.cm.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	
	/**
	 * 컨트롤러가 실행하기 전 수행하는 메소드
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("preHandle call");

		return super.preHandle(request, response, handler);
	}

	/**
	 * 컨트롤러가 실행된 후에 필요한 작업을 수행하는 메소드
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		log.info("postHandle call");
		
		super.postHandle(request, response, handler, modelAndView);
	}

	/**
	 * 컨트롤러의 처리가 끝나고 화면처리까지 모두 끝나면 실행되는 메소드
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable Exception ex) throws Exception {
		log.info("afterCompletion call");
		
		super.afterCompletion(request, response, handler, ex);
	}

	/**
	 * 비동기 요청 시 postHandle이랑 afterCompletion이 수행되지 않고 afterConcurrentHandlingStrated가 실행되는 메소드
	 */
	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		log.info("afterConcurrentHandlingStarted call");
		
		super.afterConcurrentHandlingStarted(request, response, handler);
	}
}
