<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="businessLogicLayer.UserVO" %>
<%@ page import="businessLogicLayer.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� ���� ����</title>
</head>
<body>
        
        
        <%
        request.setCharacterEncoding("euc-kr");
        
        String id=request.getParameter("id");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		String job=request.getParameter("job");		
		String address=request.getParameter("address");		
		
		Enumeration<String> en = request.getParameterNames();
		String birth=" ";
		String cellPhone=" ";
	
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
		System.out.println("updateUser, DB�� update �� userVO : "+userVO);
		
		UserDAO userDao=new UserDAO();
		userDao.updateUser(userVO);
		
		%>
		
		<% if(userVO.isActive()) { %>
		     <%= userVO.getName() %> �� ���� ���� �Ϸ�Ǿ����ϴ�.
		     <% session.setAttribute("id", userVO.getId()); %>
		<% }else { %>
			�����Ұ�, �ٽ� �������ּ���.
		<% } %>
		
		<p><p><a href='findUser.jsp'>������ ����</a>


</body>
</html>