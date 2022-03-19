package Dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.connector.Response;

import studentEntity.student;

public class studentDao {

	
	public static int save(student s) throws SQLException, ClassNotFoundException
	{
		int status = 0;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/student_data","root","root");
		PreparedStatement s1 = con.prepareStatement("insert into student (STUDENT_NAME, STUDENT_DOB, STUDENT_DOJ) values(?,?,?)");
		s1.setString(1,s.getS_name());
		s1.setString(2,s.getS_dob());
		s1.setString(3,s.getS_doj());
		
		status =s1.executeUpdate();
		con.close();
		return status;
	}
	
	public static List<student> view() throws ClassNotFoundException, SQLException
	{
		List<student> list = new ArrayList<student>();
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/student_data","root","root");
		Statement stat = con.createStatement();
		ResultSet rs = stat.executeQuery("select * from student");
		
		while(rs.next())
		{
			student s = new student();
			s.setS_no(rs.getInt("STUDENT_NO"));
			s.setS_name(rs.getString("STUDENT_NAME"));
			s.setS_dob(rs.getString("STUDENT_DOB"));
			s.setS_doj(rs.getString("STUDENT_DOJ"));
			list.add(s);

		}
		
		return list;
	}
	
	public static int delete(student s) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/student_data","root","root");
		PreparedStatement ps = con.prepareStatement("delete from student where STUDENT_NO=?");
		ps.setInt(1,s.getS_no());
		ps.executeUpdate();
		return 0;
	}
	
	public static student getRecordById(int id) throws ClassNotFoundException, SQLException
	{
		student s = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/student_data","root","root");
		PreparedStatement ps = con.prepareStatement("select * from student where STUDENT_NO=?");
		ps.setInt(1,id);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			s=new student();
			s.setS_no(rs.getInt("STUDENT_NO"));
			s.setS_name(rs.getString("STUDENT_NAME"));
			s.setS_dob(rs.getString("STUDENT_DOB"));
			s.setS_doj(rs.getString("STUDENT_DOJ"));
		}
		return s;
	}
	
	public static int update(student s) throws ClassNotFoundException, SQLException
	{
		int status = 0;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/student_data","root","root");
		PreparedStatement s1 = con.prepareStatement("update student set STUDENT_NAME=?, STUDENT_DOB=?, STUDENT_DOJ=? where STUDENT_NO=?");
		s1.setString(1,s.getS_name());
		s1.setString(2,s.getS_dob());
		s1.setString(3,s.getS_doj());
		s1.setInt(4,s.getS_no());
		
		status =s1.executeUpdate();
		con.close();
		return status;
		
	}
	
	public static student search(int sno) throws ClassNotFoundException, SQLException
	{
		student s = null;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/student_data","root","root");
		
		PreparedStatement ps = con.prepareStatement("select * from student where STUDENT_NO=?");
		ps.setInt(1,sno);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			s=new student();
			s.setS_no(rs.getInt("STUDENT_NO"));
			s.setS_name(rs.getString("STUDENT_NAME"));
			s.setS_dob(rs.getString("STUDENT_DOB"));
			s.setS_doj(rs.getString("STUDENT_DOJ"));
			return s;
		}
		else {
			return s;
		}
		
	}
	
}
