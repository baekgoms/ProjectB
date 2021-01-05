<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.rosuda.REngine.Rserve.RConnection" %>
<%@ page import="org.rosuda.REngine.REXP" %>
    
<%
   RConnection conn = new RConnection();
   REXP x = conn.eval("R.version.string");

   
%>    
<h1>R 버전 => <%=x.asString() %></h1>
