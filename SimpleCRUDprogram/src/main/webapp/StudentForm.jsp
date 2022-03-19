<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="StudentForm.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form class="s_form" action="process" method="post">
            <h1>Student Details</h1><br>
            <table>
                <tr>
                    <td><label>
                        Student Name:
                        </label>
                        </td>
                    <td>
                        <input type="text" name="s_name" placeholder="Enter Name"/>
                    </td>
                </tr>
               <tr>
                    <td><label>
                        Student DOB:
                        </label></td>
                    <td>
                        <input type="date" name="s_dob" placeholder="Enter DOB"/>
                    </td>
                </tr>
                <tr>
                    <td><label>
                        Student DOJ:
                        </label></td>
                    <td>
                        <input type="date" name="s_doj" placeholder="Enter DOJ"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input class="btn" type="submit" name="insert" value="SAVE"/>
                    </td>
                </tr>
            </table>
	   </form>
	   
	   <%@page import="Dao.studentDao,studentEntity.student,java.util.*" %>
	   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
        <%
        	List<student> list =studentDao.view();
        	request.setAttribute("list",list);
        %>
        <form action="search.jsp" method="post">
        	<div class="viewData">
        	<input type="text" name="search"/>
        	<button type="submit" name="search">Search</button>
        	</div>
        </form>
        
        <div class="viewData">
            <table>
                <tr>
                    <th>Student No</th>
                    <th>Student Name</th>
                    <th>Student DOB</th>
                    <th>Student DOJ</th>
                    <th>Update/Delete</th>
                </tr>
                
                <c:forEach items="${list}" var="s"> 
                <tr>
                    <td>${s.getS_no()}</td>
                    <td>${s.getS_name()}</td>
                    <td>${s.getS_dob()}</td>
                    <td>${s.getS_doj()}</td>
                    <td><a href="editStudent.jsp?sno=${s.getS_no()}">Edit</a>/<a href="deleteStudent.jsp?sno=${s.getS_no()}">Delete</a></td>    
                </tr>
                </c:forEach>
            </table>
        </div>
</body>
</html>