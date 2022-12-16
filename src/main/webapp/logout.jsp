<jsp:include page="topo.jsp"></jsp:include>
<%@page import="controller.ServletSacola"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<sql:setDataSource var="bd" 
url="jdbc:mysql://localhost:3306/oliveiratrade"
user="root" 
password="andrey12"/>

<% session.invalidate(); %>
	
<% response.sendRedirect("login.jsp"); %>
</body>
</html>