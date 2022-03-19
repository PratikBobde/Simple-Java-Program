<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="Dao.studentDao,studentEntity.student" %>
<%@page import="java.io.PrintWriter"%>
<% 
String sno = request.getParameter("s_no");
String sname = request.getParameter("s_name");
String sdob = request.getParameter("s_dob");
String sdoj = request.getParameter("s_doj");
student s = new student();
if(sno!="" && sname!="" && sdob!="" && sdoj!="")
{
	s.setS_no(Integer.parseInt(sno));
	s.setS_name(sname);
	s.setS_dob(sdob);
	s.setS_doj(sdoj);
	
	studentDao.update(s);
	response.sendRedirect("StudentForm.jsp");
}
else
{
	try{
		PrintWriter p = response.getWriter();
		p.print("Please fill the all fields");
	}
	catch(Exception e){
		
	}
	
}
%>
</body>
</html>