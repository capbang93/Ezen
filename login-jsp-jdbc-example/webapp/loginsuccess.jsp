<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="net.javaguides.login.database.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <jsp:useBean id="login" class="net.javaguides.login.bean.LoginBean" />
   <!--loginBean login = new loginBean();-->

   <jsp:setProperty property="*" name="login" />

<%
  LoginDao loginDao = new LoginDao();
   boolean status = loginDao.validate(login);
   if (status) {
	   response.sendRedirect("main.jsp");
       //out.print("<h1>You have logined successfully</h1>");
   }else {
	   response.sendRedirect("login.jsp");
	   //out.print("<h1>Id, pw incorrect</h1>");
   }
 %>
</body>
</html>