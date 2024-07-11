package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DBMS.DBMSConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			UserDAOImpl dao = new UserDAOImpl(DBMSConnect.getConn());
			HttpSession session = request.getSession();
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
//			System.out.print(email + " " + pass);
			
			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User us = new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				response.sendRedirect("admin/home.jsp");
			} else {
				
				User us = dao.login(email, password);
				if (us != null) {
					session.setAttribute("userobj", us);
					response.sendRedirect("index.jsp");
				} else {
					session.setAttribute("failMsg", "Email & Password Invalid");
					response.sendRedirect("login.jsp");

				}
				
				
				response.sendRedirect("home.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		
		}
	}
}
