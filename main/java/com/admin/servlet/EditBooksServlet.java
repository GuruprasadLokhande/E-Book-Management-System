package com.admin.servlet;

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

@WebServlet("/editBooks")
public class EditBooksServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String bookName = request.getParameter("bname");
			String author = request.getParameter("author");
			String price = request.getParameter("price");
			String status = request.getParameter("status");

			bookDetails bd = new bookDetails();
			bd.setBookId(id);
			bd.setBookName(bookName);
			bd.setAuthor(author);
			bd.setPrice(price);
			bd.setStatus(status);

			BookDAOImpl dao = new BookDAOImpl(DBMSConnect.getConn());
			boolean f = dao.updateEditBook(bd);
			HttpSession session = request.getSession();

			if (f) {
				session.setAttribute("succMsg", "Book Update Successfully");
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
