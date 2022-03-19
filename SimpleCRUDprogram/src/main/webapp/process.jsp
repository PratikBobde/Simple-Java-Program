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
<jsp:useBean id="obj" class="studentEntity.student"></jsp:useBean>
<jsp:setProperty property="*" name="obj"/>

<%
int i = studentDao.save(obj);
%>
</body>
</html>