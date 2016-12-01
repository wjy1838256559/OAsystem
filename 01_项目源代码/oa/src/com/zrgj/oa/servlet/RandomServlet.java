package com.zrgj.oa.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zrgj.oa.util.VerifyCodeUtils;

/**
 * @author song
 *
 *	功能:获取随机验证码图片
 *
 * 	2016-11-18
 */
public class RandomServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setHeader("Pragma", "No-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);  
        response.setContentType("image/jpeg");  
          
        //生成随机字串  
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4);  
        //存入会话session  
        HttpSession session = request.getSession(true);  
        session.setAttribute("rand", verifyCode.toLowerCase());  
        //生成图片
        int w = 200, h = 80;  
        VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode); 
	}

}
