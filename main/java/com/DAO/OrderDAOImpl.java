package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DBMS.DBMSConnect;
import com.entity.BookOrder;

public class OrderDAOImpl implements OrderDAO {
	 Connection conn=DBMSConnect.getConn();

	public OrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean saveOrder(List<BookOrder> blist) {
		boolean f = false;
        int id=0;
		try {
			String sql = "insert into bookorder (ordreid, username, email, address, phone, bookname, author, price, payment) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			conn.setAutoCommit(false);

			PreparedStatement ps = conn.prepareStatement(sql);
			for (BookOrder b : blist) {
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getUsername());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFullAddress());
				ps.setString(5, b.getPhoneno());
				ps.setString(6, b.getBookName());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				id = b.getId();
				ps.addBatch();
			}
			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);
            if(true)
            {
            	String sql1 = "delete from cart where uid=?";
    			conn.setAutoCommit(false);

    			PreparedStatement ps1 = conn.prepareStatement(sql1);
    			for (BookOrder b : blist) {
    				ps1.setInt(1, id);   			
    				
    				ps1.addBatch();
    			}
    			int[] count1 = ps1.executeBatch();
    			conn.commit();
    			f = true;
    			conn.setAutoCommit(true);
            }
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		
		
		
		return f;
	}

	@Override
	public List<BookOrder> getBook(String email) {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder o = null;
		try {
			String sql = "select * from bookorder where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new BookOrder();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAddress(rs.getString(5));
				o.setPhoneno(rs.getString(6));
				o.setBookName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
 		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookOrder> getAllBook() {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder o = null;
		try {
			String sql = "select * from bookorder";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new BookOrder();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAddress(rs.getString(5));
				o.setPhoneno(rs.getString(6));
				o.setBookName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
 		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
}
