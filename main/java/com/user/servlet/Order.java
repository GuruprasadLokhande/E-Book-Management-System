package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.DAO.CartDAOImpl;
import com.DAO.OrderDAOImpl;
import com.DBMS.DBMSConnect;
import com.entity.BookOrder;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class Order extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();

			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("username");
			String email = request.getParameter("useremail");
			String phone = request.getParameter("userphone");
			String address = request.getParameter("useraddress");
			String landmark = request.getParameter("userlandmark");
			String city = request.getParameter("usercity");
			String state = request.getParameter("userstate");
			String pincode = request.getParameter("pincode");
			String payment = request.getParameter("payment");

			String addressFull = address + ", " + landmark + ", " + city + ", " + state + ", " + pincode;

//			System.out.println(name + ", " + email + ", " + phone + ", " + addressFull + ", " + payment);

			CartDAOImpl dao1 = new CartDAOImpl(DBMSConnect.getConn());
			List<Cart> clist = dao1.getBookByUser(id);

			if (clist.isEmpty()) {
				session.setAttribute("failMsg", "Please Add A Book In Cart");
				response.sendRedirect("cart.jsp");
			} else {
				OrderDAOImpl dao2 = new OrderDAOImpl(DBMSConnect.getConn());

				BookOrder o = null;
				Random r = new Random();
				ArrayList<BookOrder> orderlist = new ArrayList<BookOrder>();

				for (Cart c : clist) {
					o = new BookOrder();
					o.setOrderId("BOOK-OID-00" + r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhoneno(phone);
					o.setFullAddress(addressFull);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice() + "");
					o.setPaymentType(payment);
					o.setId(id);
					orderlist.add(o);

				}

				if ("notselect".equals(payment)) {
					session.setAttribute("failMsg", "Please Select The Payment Option");
					response.sendRedirect("cart.jsp");
				} else {
					// Process the order
					boolean f = dao2.saveOrder(orderlist);

					if (f) {
						response.sendRedirect("orderSucc.jsp");
					} else {
						session.setAttribute("failMsg", "Somthing Wrong On The Server");
						response.sendRedirect("cart.jsp");
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
