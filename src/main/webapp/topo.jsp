
<%
if(session.getAttribute("login") != "true") {

%>

<jsp:forward page="login.jsp"></jsp:forward>

<% } %>

