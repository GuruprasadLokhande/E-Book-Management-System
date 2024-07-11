package com.admin.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DBMS.DBMSConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class DeleteBooks extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			BookDAOImpl dao = new BookDAOImpl(DBMSConnect.getConn());
			boolean f = dao.deleteBook(id);
			HttpSession session = request.getSession();

			if (f) {
				session.setAttribute("succMsg", "Book Delete Successfully");
				response.sendRedirect("admin/allBooks.jsp");
			} else {
				session.setAttribute("failMsg", "Somthing Wrong On Server");
				response.sendRedirect("admin/allBooks.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
