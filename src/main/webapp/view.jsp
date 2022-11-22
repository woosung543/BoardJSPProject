<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.example.dao.BoardDAO" %>
<%@ page import="com.example.bean.BoardVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    BoardDAO boardDAO = new BoardDAO();
    String id=request.getParameter("id");
    BoardVO u=boardDAO.getBoard(Integer.parseInt(id));
    request.setAttribute("vo", u);
%>
    <h1>게시글 정보 보기</h1>

<table>
    <tr><td>Title:</td><td>${vo.getTitle()}</td></tr>
    <tr><td>Writer:</td><td>${vo.getWriter()}</td></tr>
    <tr><td>Photo:</td><td><c:if test="${vo.getPhoto() ne ''}"><br />
        <img src="${pageContext.request.contextPath }/upload/${vo.getPhoto()}" class="photo"></c:if></td></tr>

    <tr><td>Content:</td><td>${vo.getContent()}</td></tr>
    <tr><td>Writer:</td><td>${vo.getWriter()}</td></tr>
</table>
    <button type = "button" onclick ="history.back()">뒤로 가기</button>
    <button type = "button" onclick ="location.href='editform.jsp?id=${vo.getSeq()}'">수정 하기</button>

</body>
</html>
