<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>

 <form action="findUser.jsp" method="post"> 
        
        <table id="find" border="1">
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
        
        </tr>

        </form>
        </table>
        <input type="submit" value="내정보 보기">

</body>
</html>