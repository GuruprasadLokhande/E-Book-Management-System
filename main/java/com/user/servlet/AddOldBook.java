package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.print.attribute.PrintJobAttribute;

import com.DAO.BookDAOImpl;
import com.DBMS.DBMSConnect;
import com.entity.bookDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/addoldbook")
@MultipartConfig
public class AddOldBook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String bookName = request.getParameter("bname");
			String author = request.getParameter("author");
			String price = request.getParameter("price");
			String categories = "Old";
			String status = "Active";
			Part part = request.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			String phoneNumber = request.getParameter("phone");

			String useremail = request.getParameter("user");
			
			
			bookDetails bd = new bookDetails(bookName, author, price, categories, status, fileName, useremail,
					phoneNumber);
//			System.out.print(bd);
			BookDAOImpl dao = new BookDAOImpl(DBMSConnect.getConn());

			boolean f = dao.addBooks(bd);
			HttpSession session = request.getSession();

			if (f) {
				String path = getServletContext().getRealPath("") + "books";
				File file = new File(path);
				part.write(path + File.separator + fileName);

				session.setAttribute("succMsg", "Book Added Successfully");
				response.sendRedirect("sellBook.jsp");
			} else {
				session.setAttribute("failMsg", "Somthing Wrong On Server");
				response.sendRedirect("sellBook.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
