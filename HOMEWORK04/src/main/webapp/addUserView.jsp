<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>

        <% request.setCharacterEncoding("euc-kr"); %>
        <form action="addUser.jsp" method="post">
        
        <table id="add" border="1">
        <tr>
        <th>��������</th>
        <td colspan="4"align="right">
                <input type="button" value="?">����
            </td>
        </tr>
        <tr>
            <th>*���̵�</th>
            <td>
                <input type="text" name="id">
            </td>
            <th>*��й�ȣ</th>
            <td>
                <input type="text" name="password">
            </td>
        </tr>
        <tr>
             <th>*�̸�(�ѱ۽Ǹ�)</th>
             <td colspan="4"><input type="text" name="name"></td>
        </tr>
        <tr>
             <th>*����</th>
             <td colspan="4"><input type="radio" name="gender" checked="checked" value="��">�� <input type="radio" name="gender" value="��">��</td>
        </tr>
        <tr>
             <th>*�������</th>
             <td colspan="4"><input type="text" name="birth">��
                   <select name="birth">
                       <option value="none">����</option>
                       
                       <% for(int i=1; i<13; i++){ %>
                       <option value="<%= i %>"> <%= i %> </option>
                       <%} %>
                   </select>��
                   <select name="birth">
                       <option value="none">����</option>
                       
                       <% for(int i=1; i<32; i++){ %>
                       <option value="<%= i %>"> <%= i %> </option>
                       <%} %>
                   </select>��
             </td>
        </tr>
        <tr>
             <th>*����</th>
             <td colspan="4"><select name="job">
                   <option value="none">�����ϼ���.</option>
                   <option value="developer">������</option>
                   <option value="jobless">����</option>
        </tr>
        
        <tr>
             <th rowspan="1">*����ó</th>
             <td colspan="4">
                 �޴���   <input type="text" size="3" name="cellphone">-<input type="text" size="4" name="cellphone">-<input type="text" size="4" name="cellphone">
             </td>
        </tr>
       
        <tr>
             <th>*������ �ּ�</th>
             <td colspan="4">
                 <input type="text" name="address">
             </td>
        </tr>
        
        </form>

        <tbody>
            <tr>
            </tr>
        </tbody>
        </table>
        <input type="submit" value="ȸ������">

</body>
</html>