package com.niit.controller;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.GenericFilterBean;

public class CustomFilter extends GenericFilterBean {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletResponse resp = (HttpServletResponse) response;
		resp.setHeader("Set-Cookie", "SEARCH_SAMESITE=test; HttpOnly; Secure; SameSite=Strict");
		chain.doFilter(request, response);
	}

}
