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
<%@page import="Dao.studentDao,studentEntity.student" %>
<%
String id = request.getParameter("sno");
student s = studentDao.getRecordById(Integer.parseInt(id));
%>
<form class="s_form" action="editprocess.jsp" method="post">
            <h1>Student Details</h1><br>
            <table>
            	<tr>
                    <td><label>
                        Student No:
                        </label>
                        </td>
                    <td>
                        <input type="text" name="s_no" value="<%=s.getS_no()%>"/>
                    </td>
                </tr>
                <tr>
                    <td><label>
                        Student Name:
                        </label>
                        </td>
                    <td>
                        <input type="text" name="s_name" placeholder="Enter Name" value="<%=s.getS_name() %>"/>
                    </td>
                </tr>
               <tr>
                    <td><label>
                        Student DOB:
                        </label></td>
                    <td>
                        <input type="date" name="s_dob" placeholder="Enter DOB" value="<%=s.getS_dob() %>"/>
                    </td>
                </tr>
                <tr>
                    <td><label>
                        Student DOJ:
                        </label></td>
                    <td>
                        <input type="date" name="s_doj" placeholder="Enter DOJ" value="<%=s.getS_doj() %>"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input class="btn" type="submit" name="update" value="UPDATE"/>
                    </td>
                </tr>
            </table>
	   </form>
</body>
</html>