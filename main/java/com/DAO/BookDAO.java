package com.DAO;

import java.util.List;

import com.entity.BookOrder;
import com.entity.bookDetails;

public interface BookDAO {
	public boolean addBooks(bookDetails b);
	
	public List<bookDetails> getAllBook();
		
	public bookDetails getBookById(int id);
	
	public boolean updateEditBook(bookDetails b);
	
	public boolean deleteBook(int id);
	
	public List<bookDetails> getNewBook();
	
	public List<bookDetails> getRecentBook();
	
	public List<bookDetails> getOldBook();
	
	public List<bookDetails> allRecentBook();
	
	public List<bookDetails> allNewBook();
	
	public List<bookDetails> allOldBook();
	
	public List<bookDetails> getAllOldBook(String email);
	
	public boolean deleteOldBook(String email, String cate, int id);
	
	public List<bookDetails> getBookBySearch(String ch); 

}
