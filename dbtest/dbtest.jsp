<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" import="java.util.*, java.sql.*" session="true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<htmL>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Select</title>
<link rel="stylesheet" type="text/css" href="contents.css">
</head>
<body>
<%
 Connection con = null;
 Statement stmt = null;
 ResultSet rs = null;
 
 String jdbcUrl ="jdbc:mysql://localhost/ezendb?useUnicode=true&characterEncoding=utf-8";
 String dbUser = "root";
 String dbPass = "ezen";

 

try {
     Class.forName("com.mysql.jdbc.Driver");
 } catch(ClassNotFoundException e) {
     out.println("mysql driver loading error!");

     out.println(e.toString());

     System.out.println("mysql driver loading error!");

     return;
     
 }
 
 
 
 try {
     con = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
 } catch(SQLException e) {
     out.println("mysql connection error!");
     out.println(e.toString());

     return;
 }

 %>
 <table>
 <tr>
 <td>1.직원아이디</td>
 <td>2.직원이름</td>
 <td>3.생년월일</td>
 <td>4.개발부서</td>
 <td>5.NCS능력명</td>
 <td>6.NCS레벨</td>
 <td>7.나이</td>
 </tr>
 <%

 try {
  stmt = con.createStatement();

  String query = "call get_employee_ncs_listbyid(1);"; //select * from employee;
  rs = stmt.executeQuery(query);

  while(rs.next()) {
   out.println("<tr>");
   out.println("<td>" + rs.getString(1) + "</td>");
   out.println("<td>" + rs.getString(2) + "</td>");
   out.println("<td>" + rs.getString(3) + "</td>");
   out.println("<td>" + rs.getString(4) + "</td>");
   out.println("<td>" + rs.getString(5) + "</td>");
   out.println("<td>" + rs.getString(6) + "</td>");
   out.println("<td>" + rs.getString(7) + "</td>");

   out.println("</tr>");
  }
 } catch(SQLException e ) {
  out.println(e.toString());
 }

 

 try {
  if(rs !=null) rs.close();
  if(stmt != null) stmt.close();
  if(con != null) con.close();
 } catch(SQLException e) {
  out.println(e.toString());
 }
%>
</table> 
</body>
</html>