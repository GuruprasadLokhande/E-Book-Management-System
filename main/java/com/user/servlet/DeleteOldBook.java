package com.user.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DBMS.DBMSConnect;
import com.entity.bookDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteoldbook")
public class DeleteOldBook extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			int id = Integer.parseInt(request.getParameter("id"));
			BookDAOImpl dao = new BookDAOImpl(DBMSConnect.getConn());

			boolean f = dao.deleteOldBook(email, "Old", id);
			HttpSession session = request.getSession();

			if (f) {
				session.setAttribute("succMsg", "Old Book Delete Successfully");
				response.sendRedirect("myPost.jsp");
			} else {
				session.setAttribute("failMsg", "Somthing Wrong On Server");
				response.sendRedirect("myPost.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
