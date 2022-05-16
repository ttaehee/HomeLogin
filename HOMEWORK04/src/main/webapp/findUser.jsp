<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "businessLogicLayer.UserVO " %>
<%@ page import= "businessLogicLayer.UserDAO " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>내 정보보기</title>
</head>
<body>
		
		<% request.setCharacterEncoding("euc-kr");;
		   String id=request.getParameter("id");
		
		if(id==null) {
		
		    id=(String)session.getAttribute("id");
		    System.out.println("findUser 시작\n session에 저장된 id 유무 확인 : " +id);
		}
		
		UserVO userVO=new UserDAO().findUser(id);
		
		if(userVO != null) { %>
			<li> 아이디:<%= userVO.getId() %>
			<li> 비밀번호:<%= userVO.getPassword()%>
	
			<li> 이름:<%= userVO.getName() %>
			<li> 성별:<%= userVO.getGender() %>
			<li> 생년월일:<%= userVO.getBirth() %>
			<li> 직업:<%= userVO.getJob() %>
			<li> 휴대폰:<%= userVO.getCellPhone() %>
			<li> 주소:<%= userVO.getAddress() %>
		<% }else {%>
			<%=id%>에 해당하는 data는 없습니다.
		<% } %>

		<p><p><a href='updateUserView.jsp'>내 정보 수정하기</a>
		<p><p><a href='addUserView.jsp'>뒤로</a>


</body>
</html>