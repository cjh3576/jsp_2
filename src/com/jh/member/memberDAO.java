package com.jh.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.jh.util.DBConnector;

public class memberDAO {
	//login
	public memberDTO memberLogin(memberDTO dto) throws Exception{
		memberDTO m = null;
		Connection con = DBConnector.getConnect();
		String sql = "select * from member where id=? and pw=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, dto.getId());
		st.setString(2, dto.getPw());
		
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			m= new memberDTO();
			m.setId(rs.getString("id"));
			m.setPw(rs.getString("pw"));
			m.setName(rs.getString("name"));
			m.setPhone(rs.getString("phone"));
			m.setEmail(rs.getString("email"));
			m.setAge(rs.getInt("age"));
		}
		DBConnector.disConnection(con, st, rs);
		
		return m;
	}
	
	
	//join
	public int memberJoin(memberDTO dto) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into member values(?,?,?,?,?,?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, dto.getId());
		st.setString(2, dto.getPw());
		st.setString(3, dto.getName());
		st.setInt(4, dto.getAge());
		st.setString(5, dto.getPhone());
		st.setString(6, dto.getEmail());
		
		int result = st.executeUpdate();
		DBConnector.disConnection(con, st);
		return result;
	}
}
