package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

import com.DAO.UserDAOImpl;
import com.DBMS.DBMSConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String name = request.getParameter("fname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String password = request.getParameter("password");
			String check = request.getParameter("check");

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setPassword(password);

			HttpSession session = request.getSession();
			if (check != null) {
				UserDAOImpl dao = new UserDAOImpl(DBMSConnect.getConn());
				boolean f2 = dao.checkUser(email);
				if (f2) {
					boolean f = dao.userRegister(us);

					if (f) {
						session.setAttribute("succMsg", "User Registration Successfully");
						response.sendRedirect("register.jsp");
					} else {
						session.setAttribute("failMsg", "Somthing Wrong On Server");
						response.sendRedirect("register.jsp");
					}
				} else {
					session.setAttribute("failMsg", "The User Is Alreday Exist Try With Another Email");
					response.sendRedirect("register.jsp");
				}
			} else {
				session.setAttribute("failMsg", "Agree The Terms & Conditions");
				response.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
			e.printStackTrace();
		}
	}
}
