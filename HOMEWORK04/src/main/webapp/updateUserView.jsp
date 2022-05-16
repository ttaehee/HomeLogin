<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="businessLogicLayer.UserVO" %>
<%@ page import="businessLogicLayer.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>내 정보 수정</title>
</head>
<body>
        <% request.setCharacterEncoding("euc-kr"); %>
        <form action="updateUser.jsp" method="get"> 
        
        <table id="add" border="1">
        <tr>
        <th>개인정보</th>
        <td colspan="4"align="right">
                <input type="button" value="?">도움말
            </td>
        </tr>
        <% UserVO userVO=new UserVO();
        userVO=new UserDAO().findUser((String)session.getAttribute("id"));
        %>
        <tr>
            <th>*아이디</th>
            <td>
                <input type="text" name="id" value="<%= userVO.getId() %>">
            </td>
            <th>*비밀번호</th>
            <td>
                <input type="text" name="password" value="<%= userVO.getPassword() %>">
            </td>
        </tr>
        <tr>
             <th>*이름(한글실명)</th>
             <td colspan="4"><input type="text" name="name" value="<%= userVO.getName() %>"></td>
        </tr>
        <tr>
             <th>*성별</th>
             <%if(userVO.getGender()=="남"){ %>
             <td colspan="4"><input type="radio" name="gender" checked="checked" value="남">남 <input type="radio" name="gender" value="여">여</td>
             <% }else{ %>
             <td colspan="4"><input type="radio" name="gender" value="남">남 <input type="radio" name="gender"  checked="checked" value="여">여</td>
             <% } %>
        </tr>
        <tr>
             <th>*생년월일</th>
             <% String[] arrBirth=userVO.getBirth().split("/"); %>
             <td colspan="4"><input type="text" name="birth" value="<%= arrBirth[0] %>">년
                   <select name="birth">
                       <option value="<%= arrBirth[1] %>"><%= arrBirth[1] %></option>
                       
                       <% for(int i=1; i<13; i++){ %>
                       <option value="<%= i %>"> <%= i %> </option>
                       <%} %>
                   </select>월
                   <select name="birth">
                       <option value="<%= arrBirth[2] %>"><%= arrBirth[2] %></option>
                       
                       <% for(int i=1; i<32; i++){ %>
                       <option value="<%= i %>"> <%= i %> </option>
                       <%} %>
                   </select>일
             </td>
        </tr>
        <tr>
             <th>*직업</th>
             <td colspan="4"><select name="job">
                   <option value=<%= userVO.getJob() %>><%= userVO.getJob() %></option>
                   <option value="developer">개발자</option>
                   <option value="jobless">무직</option>
             </select>
             </td>
        </tr>
        
        <tr>
             <th rowspan="1">*연락처</th>
             <td colspan="4">  
             <% String[] arrPhone=userVO.getCellPhone().split("-"); %>
                 휴대폰<input type="text" size="3" name="cellphone" value="<%=arrPhone[0]%>">-
                 <input type="text" size="4" name="cellphone" value="<%=arrPhone[1]%>">-
                 <input type="text" size="4" name="cellphone" value="<%=arrPhone[2]%>">
             </td>
        </tr>
       
        <tr>
             <th>*거주지 주소</th>
             <td colspan="4">
                 <input type="text" name="address" value="<%= userVO.getAddress() %>">
             </td>
        </tr>
        </form>

        </table>
        <input type="submit" value="수정하기">

</body>
</html>