<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
</head>
<body>

        <% request.setCharacterEncoding("euc-kr"); %>
        <form action="addUser.jsp" method="post">
        
        <table id="add" border="1">
        <tr>
        <th>개인정보</th>
        <td colspan="4"align="right">
                <input type="button" value="?">도움말
            </td>
        </tr>
        <tr>
            <th>*아이디</th>
            <td>
                <input type="text" name="id">
            </td>
            <th>*비밀번호</th>
            <td>
                <input type="text" name="password">
            </td>
        </tr>
        <tr>
             <th>*이름(한글실명)</th>
             <td colspan="4"><input type="text" name="name"></td>
        </tr>
        <tr>
             <th>*성별</th>
             <td colspan="4"><input type="radio" name="gender" checked="checked" value="남">남 <input type="radio" name="gender" value="여">여</td>
        </tr>
        <tr>
             <th>*생년월일</th>
             <td colspan="4"><input type="text" name="birth">년
                   <select name="birth">
                       <option value="none">선택</option>
                       
                       <% for(int i=1; i<13; i++){ %>
                       <option value="<%= i %>"> <%= i %> </option>
                       <%} %>
                   </select>월
                   <select name="birth">
                       <option value="none">선택</option>
                       
                       <% for(int i=1; i<32; i++){ %>
                       <option value="<%= i %>"> <%= i %> </option>
                       <%} %>
                   </select>일
             </td>
        </tr>
        <tr>
             <th>*직업</th>
             <td colspan="4"><select name="job">
                   <option value="none">선택하세요.</option>
                   <option value="developer">개발자</option>
                   <option value="jobless">무직</option>
        </tr>
        
        <tr>
             <th rowspan="1">*연락처</th>
             <td colspan="4">
                 휴대폰   <input type="text" size="3" name="cellphone">-<input type="text" size="4" name="cellphone">-<input type="text" size="4" name="cellphone">
             </td>
        </tr>
       
        <tr>
             <th>*거주지 주소</th>
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
        <input type="submit" value="회원가입">

</body>
</html>