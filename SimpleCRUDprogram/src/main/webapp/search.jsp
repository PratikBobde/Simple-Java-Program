<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="StudentForm.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@page import="studentEntity.student,Dao.studentDao,java.util.*" %>
<%
String sid= request.getParameter("search");
student s = null;
	if(sid!="")
	{
		int id = Integer.parseInt(sid);
		s = studentDao.search(id);
		if(s==null)
		{
			out.print("data not available");
		}
		else{
		int sno = s.getS_no();
		String sname = s.getS_name();
		String sdob = s.getS_dob();
		String sdoj = s.getS_doj();
%>
		<div class="viewData">
            <table>
                <tr>
                    <th>Student No</th>
                    <th>Student Name</th>
                    <th>Student DOB</th>
                    <th>Student DOJ</th>
                    <th>Update/Delete</th>
                </tr>
                
                <tr>
                    <td><%=sno%></td>
                    <td><%=sname%></td>
                    <td><%=sdob%></td>
                    <td><%=sdoj%></td>
                    <td><a href="editStudent.jsp?sno=<%=sno%>">Edit</a>/<a href="deleteStudent.jsp?sno=<%=sno%>">Delete</a></td>    
                </tr>
            </table>
        </div>
        
  <%
		}}
	else{
		out.print("please Enter the student no....");
	}
	
%>
</body>
</html>