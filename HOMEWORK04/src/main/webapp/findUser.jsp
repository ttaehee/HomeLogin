<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "businessLogicLayer.UserVO " %>
<%@ page import= "businessLogicLayer.UserDAO " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� ��������</title>
</head>
<body>
		
		<% request.setCharacterEncoding("euc-kr");;
		   String id=request.getParameter("id");
		
		if(id==null) {
		
		    id=(String)session.getAttribute("id");
		    System.out.println("findUser ����\n session�� ����� id ���� Ȯ�� : " +id);
		}
		
		UserVO userVO=new UserDAO().findUser(id);
		
		if(userVO != null) { %>
			<li> ���̵�:<%= userVO.getId() %>
			<li> ��й�ȣ:<%= userVO.getPassword()%>
	
			<li> �̸�:<%= userVO.getName() %>
			<li> ����:<%= userVO.getGender() %>
			<li> �������:<%= userVO.getBirth() %>
			<li> ����:<%= userVO.getJob() %>
			<li> �޴���:<%= userVO.getCellPhone() %>
			<li> �ּ�:<%= userVO.getAddress() %>
		<% }else {%>
			<%=id%>�� �ش��ϴ� data�� �����ϴ�.
		<% } %>

		<p><p><a href='updateUserView.jsp'>�� ���� �����ϱ�</a>
		<p><p><a href='addUserView.jsp'>�ڷ�</a>


</body>
</html>