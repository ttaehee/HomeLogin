<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="businessLogicLayer.UserVO" %>
<%@ page import="businessLogicLayer.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� ���� ����</title>
</head>
<body>
        <% request.setCharacterEncoding("euc-kr"); %>
        <form action="updateUser.jsp" method="get"> 
        
        <table id="add" border="1">
        <tr>
        <th>��������</th>
        <td colspan="4"align="right">
                <input type="button" value="?">����
            </td>
        </tr>
        <% UserVO userVO=new UserVO();
        userVO=new UserDAO().findUser((String)session.getAttribute("id"));
        %>
        <tr>
            <th>*���̵�</th>
            <td>
                <input type="text" name="id" value="<%= userVO.getId() %>">
            </td>
            <th>*��й�ȣ</th>
            <td>
                <input type="text" name="password" value="<%= userVO.getPassword() %>">
            </td>
        </tr>
        <tr>
             <th>*�̸�(�ѱ۽Ǹ�)</th>
             <td colspan="4"><input type="text" name="name" value="<%= userVO.getName() %>"></td>
        </tr>
        <tr>
             <th>*����</th>
             <%if(userVO.getGender()=="��"){ %>
             <td colspan="4"><input type="radio" name="gender" checked="checked" value="��">�� <input type="radio" name="gender" value="��">��</td>
             <% }else{ %>
             <td colspan="4"><input type="radio" name="gender" value="��">�� <input type="radio" name="gender"  checked="checked" value="��">��</td>
             <% } %>
        </tr>
        <tr>
             <th>*�������</th>
             <% String[] arrBirth=userVO.getBirth().split("/"); %>
             <td colspan="4"><input type="text" name="birth" value="<%= arrBirth[0] %>">��
                   <select name="birth">
                       <option value="<%= arrBirth[1] %>"><%= arrBirth[1] %></option>
                       
                       <% for(int i=1; i<13; i++){ %>
                       <option value="<%= i %>"> <%= i %> </option>
                       <%} %>
                   </select>��
                   <select name="birth">
                       <option value="<%= arrBirth[2] %>"><%= arrBirth[2] %></option>
                       
                       <% for(int i=1; i<32; i++){ %>
                       <option value="<%= i %>"> <%= i %> </option>
                       <%} %>
                   </select>��
             </td>
        </tr>
        <tr>
             <th>*����</th>
             <td colspan="4"><select name="job">
                   <option value=<%= userVO.getJob() %>><%= userVO.getJob() %></option>
                   <option value="developer">������</option>
                   <option value="jobless">����</option>
             </select>
             </td>
        </tr>
        
        <tr>
             <th rowspan="1">*����ó</th>
             <td colspan="4">  
             <% String[] arrPhone=userVO.getCellPhone().split("-"); %>
                 �޴���<input type="text" size="3" name="cellphone" value="<%=arrPhone[0]%>">-
                 <input type="text" size="4" name="cellphone" value="<%=arrPhone[1]%>">-
                 <input type="text" size="4" name="cellphone" value="<%=arrPhone[2]%>">
             </td>
        </tr>
       
        <tr>
             <th>*������ �ּ�</th>
             <td colspan="4">
                 <input type="text" name="address" value="<%= userVO.getAddress() %>">
             </td>
        </tr>
        </form>

        </table>
        <input type="submit" value="�����ϱ�">

</body>
</html>