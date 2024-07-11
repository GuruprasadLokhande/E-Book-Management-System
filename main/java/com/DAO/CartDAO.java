package com.DAO;

import java.util.List;

import com.entity.Cart;
import com.entity.bookDetails;

public interface CartDAO {
	public boolean addCard(Cart c);
	
	public List<Cart> getBookByUser(int userId);
	
	public boolean deleteBook(int bid, int uid, int cid);
	
}
