<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%
	MultipartRequest mr = new MultipartRequest(request, request.getRealPath("/image"), 1024*1024*1024, "utf-8", new DefaultFileRenamePolicy());
%>