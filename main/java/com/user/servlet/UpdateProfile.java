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

@WebServlet("/updateprofile")
public class UpdateProfile extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("fname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String password = request.getParameter("password");

			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);

			HttpSession session = request.getSession();

			UserDAOImpl dao = new UserDAOImpl(DBMSConnect.getConn());
			boolean f = dao.checkPass(id, password);

			if (f) {
				boolean f2 = dao.updateProfile(us);

				if (f) {
					session.setAttribute("succMsg", "User Profile Updation Successfully..!!");
					response.sendRedirect("editProfile.jsp");
				} else {
					session.setAttribute("failMsg", "Somthing Wrong On Server..!!");
					response.sendRedirect("editProfile.jsp");
				}
			} else {
				session.setAttribute("failMsg", "Please Enter The Correct Password..!!");
				response.sendRedirect("editProfile.jsp");
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}

	}
}
