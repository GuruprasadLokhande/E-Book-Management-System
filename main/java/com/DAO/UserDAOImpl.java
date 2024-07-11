package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DBMS.DBMSConnect;
import com.entity.User;

public class UserDAOImpl implements UserDAO {

	Connection conn = DBMSConnect.getConn();

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User us) {
		boolean f = false;

		try {
			String sql = "insert into user(name, email, phone, password) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setString(4, us.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public User login(String email, String password) {
		User us = null;

		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhone(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return us;
	}

	@Override
	public boolean checkPass(int id, String pass) {
		boolean f = false; // Assume password is incorrect initially

		try {
			String sql = "SELECT * FROM user WHERE id=? AND password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();

			// If the ResultSet has at least one row, the password is correct
			if (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean updateProfile(User us) {
		boolean f = false;

		try {
			String sql = "update user set name=?, email=?, phone=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setInt(4, us.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean checkUser(String email) {
		boolean f = true;
		try {
			String sql = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f= false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
