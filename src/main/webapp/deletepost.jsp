<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO"%>
<%@page import="com.example.bean.BoardVO"%>
<%@ page import="com.example.util.FileUpload" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	BoardDAO boardDAO = new BoardDAO();
	String sid=request.getParameter("id");
	BoardVO u=boardDAO.getBoard(Integer.parseInt(sid));
	request.setAttribute("vo", u);

	if (sid != ""){
		int id = Integer.parseInt(sid);
//		BoardDAO boardDAO = new BoardDAO();
		// 업로드한 photo 파일 삭제
		String filename = boardDAO.getPhotoFilename(id);
		if(filename != null)
			FileUpload.deleteFile(request, filename);
		boardDAO.deleteBoard(u);
	}
	response.sendRedirect("posts.jsp");
%>