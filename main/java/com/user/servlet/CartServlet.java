package com.user.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DBMS.DBMSConnect;
import com.entity.Cart;
import com.entity.bookDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int bid = Integer.parseInt(request.getParameter("bid"));
			int uid = Integer.parseInt(request.getParameter("uid"));

			BookDAOImpl dao1 = new BookDAOImpl(DBMSConnect.getConn());
			bookDetails bd = dao1.getBookById(bid);

			Cart cart = new Cart();
			cart.setBid(bid);
			cart.setUid(uid);

			cart.setBookName(bd.getBookName());
			cart.setAuthor(bd.getAuthor());
			cart.setPrice(Double.parseDouble(bd.getPrice()));
			cart.setTotalPrice(Double.parseDouble(bd.getPrice()));

			CartDAOImpl dao2 = new CartDAOImpl(DBMSConnect.getConn());
			boolean f = dao2.addCard(cart);

			HttpSession session = request.getSession();

			if (f) {
				request.setAttribute("addcart", "Book Added To Cart Successfully");
				
			} else {
				session.setAttribute("failcart", "Somthing Wrong On Server");
				
			}
			request.getRequestDispatcher("allNewBook.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
