<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "java.util.Enumeration" %>
<%@ page import= "javax.servlet.*" %>
<%@ page import= "javax.servlet.http.*" %>
<%@ page import= "businessLogicLayer.UserDAO" %>
<%@ page import= "businessLogicLayer.UserVO " %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 완료</title>
</head>
<body>	
		<%
		
		request.setCharacterEncoding("euc-kr");
		System.out.println("addUser 시작");
		
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		String job=request.getParameter("job");		
		String address=request.getParameter("address");		
		
		Enumeration<String> en = request.getParameterNames();
		String  birth=" ";
		String  cellPhone=" ";
		
		while(en.hasMoreElements()) {
			String bnName=en.nextElement();
			
			if(bnName.equals("birth")) {
				String[] value=request.getParameterValues(bnName);
				
				for(int i=0;i<value.length;i++){
					String nop = i==(value.length-1)? " " :"/"  ;
					birth+=value[i]+nop;
		        }
			}
			
			if(bnName.equals("cellphone")) {
				String[] value=request.getParameterValues(bnName);
				
				for(int i=0;i<value.length;i++){
					String nop = i==(value.length-1)? " " :"-"  ;
					cellPhone+=value[i]+nop;
		        }
			}
			
		}
		

		UserVO userVO=new UserVO();
		userVO.setId(id);
		userVO.setPassword(password);
		userVO.setName(name);
		userVO.setGender(gender);
		userVO.setBirth(birth);
		userVO.setJob(job);
		userVO.setCellPhone(cellPhone);
		userVO.setAddress(address);
		
		UserDAO userDao=new UserDAO();
		userDao.addUser(userVO);
		
		session.setAttribute("id" ,id); 
		System.out.println("addUser 성공 : "+userVO);
		
		%>
		
		<%if(userVO.isActive()) { %>
		<%= userVO.getName()%> 님 환영합니다.
		<% session.setAttribute("id" ,userVO.getId());
		}else{ %>
		다시 가입해주세요.
		<% } %>
		
		<p><p><a href='findUser.html'>로그인</a>
		<p><p><a href='findUser.jsp'>회원정보 보기</a>


</body>
</html>