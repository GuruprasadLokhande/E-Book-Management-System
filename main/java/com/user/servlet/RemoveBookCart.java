package com.user.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DBMS.DBMSConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeBook")
public class RemoveBookCart extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int bid = Integer.parseInt(request.getParameter("bid"));
			int uid = Integer.parseInt(request.getParameter("uid"));
			int cid = Integer.parseInt(request.getParameter("cid"));


			CartDAOImpl dao = new CartDAOImpl(DBMSConnect.getConn());
			boolean f = dao.deleteBook(bid, uid, cid);
			HttpSession session = request.getSession();

			if (f) {
				session.setAttribute("succMsg", "Book Remove From Cart Successfully");
				response.sendRedirect("cart.jsp");
			} else {
				session.setAttribute("failMsg", "Somthing Wrong On Server");
				response.sendRedirect("cart.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
