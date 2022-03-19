<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="Dao.studentDao" %>
<%
int n =Integer.parseInt(request.getParameter("sno"));
%>
<jsp:useBean id="obj" class="studentEntity.student"></jsp:useBean>
<jsp:setProperty property="s_no" name="obj" value="<%=n%>"/>

<%
studentDao.delete(obj);
response.sendRedirect("StudentForm.jsp");
%>
</body>
</html>