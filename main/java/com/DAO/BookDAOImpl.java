package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.PrintJobAttribute;


import com.DBMS.DBMSConnect;
import com.entity.bookDetails;

public class BookDAOImpl implements BookDAO {

	 Connection conn=DBMSConnect.getConn();

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBooks(bookDetails b) {
		boolean f = false;
		try {
			String sql = "insert into bookdetails(bookname, author, price, bookcategory, status, photo, useremail) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<bookDetails> getAllBook() {

		List<bookDetails> list = new ArrayList<bookDetails>();
		bookDetails bd = null;

		try {
			String sql = "select * from bookdetails where bookcategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bd = new bookDetails();
				bd.setBookId(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getString(4));
				bd.setBookCategory(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhotoName(rs.getString(7));
				bd.setEmail(rs.getString(8));

				list.add(bd);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public bookDetails getBookById(int id) {
		bookDetails bd = null;
		try {
			String sql = "select * from bookdetails where bookid =?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				bd = new bookDetails();

				bd.setBookId(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getString(4));
				bd.setBookCategory(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhotoName(rs.getString(7));
				bd.setEmail(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bd;
	}

	@Override
	public boolean updateEditBook(bookDetails b) {
		boolean f = false;

		try {
			String sql = "update bookdetails set bookname=?, author=?, price=?, status=? where bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean deleteBook(int id) {
		boolean f = false;

		try {
			String sql = "delete from bookdetails where bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<bookDetails> getNewBook() {
		List<bookDetails> list = new ArrayList<>();
		bookDetails bd = null;

		try {
			String sql = "select * from bookdetails where bookcategory=? and status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			int i = 1;
			while (rs.next() && i <= 4) {
				bd = new bookDetails();
				bd.setBookId(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getString(4));
				bd.setBookCategory(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhotoName(rs.getString(7));
				bd.setEmail(rs.getString(8));

				list.add(bd);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<bookDetails> getRecentBook() {
		List<bookDetails> list = new ArrayList<>();
		bookDetails bd = null;

		try {
			String sql = "select * from bookdetails where status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();

			int i = 1;
			while (rs.next() && i <= 4) {
				bd = new bookDetails();
				bd.setBookId(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getString(4));
				bd.setBookCategory(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhotoName(rs.getString(7));
				bd.setEmail(rs.getString(8));

				list.add(bd);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<bookDetails> getOldBook() {
		List<bookDetails> list = new ArrayList<>();
		bookDetails bd = null;

		try {
			String sql = "select * from bookdetails where bookcategory=? and status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			int i = 1;
			while (rs.next() && i <= 4) {
				bd = new bookDetails();
				bd.setBookId(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getString(4));
				bd.setBookCategory(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhotoName(rs.getString(7));
				bd.setEmail(rs.getString(8));

				list.add(bd);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<bookDetails> allRecentBook() {
		List<bookDetails> list = new ArrayList<>();
		bookDetails bd = null;

		try {
			String sql = "select * from bookdetails where status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				bd = new bookDetails();
				bd.setBookId(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getString(4));
				bd.setBookCategory(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhotoName(rs.getString(7));
				bd.setEmail(rs.getString(8));

				list.add(bd);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<bookDetails> allNewBook() {
		List<bookDetails> list = new ArrayList<>();
		bookDetails bd = null;

		try {
			String sql = "select * from bookdetails where bookcategory=? and status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				bd = new bookDetails();
				bd.setBookId(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getString(4));
				bd.setBookCategory(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhotoName(rs.getString(7));
				bd.setEmail(rs.getString(8));

				list.add(bd);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<bookDetails> allOldBook() {
		List<bookDetails> list = new ArrayList<>();
		bookDetails bd = null;

		try {
			String sql = "select * from bookdetails where bookcategory=? and status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				bd = new bookDetails();
				bd.setBookId(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getString(4));
				bd.setBookCategory(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhotoName(rs.getString(7));
				bd.setEmail(rs.getString(8));

				list.add(bd);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<bookDetails> getAllOldBook(String email) {
		List<bookDetails> list = new ArrayList<bookDetails>();
		bookDetails bd = null;

		try {
			String sql = "select * from bookdetails where bookcategory=? and useremail=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bd = new bookDetails();
				bd.setBookId(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getString(4));
				bd.setBookCategory(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhotoName(rs.getString(7));
				bd.setEmail(rs.getString(8));

				list.add(bd);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deleteOldBook(String email, String cate, int id) {
		boolean f = false;

		try {
			String sql = "delete from bookdetails where bookcategory=? and useremail=? and bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);
			ps.setInt(3, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<bookDetails> getBookBySearch(String ch) {
		List<bookDetails> list = new ArrayList<bookDetails>();
		bookDetails bd = null;

		try {
			String sql = "select * from bookdetails where bookname like ? or author like ? or bookcategory like ? and status like ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bd = new bookDetails();
				bd.setBookId(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getString(4));
				bd.setBookCategory(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhotoName(rs.getString(7));
				bd.setEmail(rs.getString(8));

				list.add(bd);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
