<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
<table border="1" width="300" height="300" align= "center">
<center>
<span style="color: green; font-weight: bold;">변경할 비밀번호를 입력해주세요.</span> <br> <br>    
        <br> <br>
        
        
        <div style="text-align:center;">
            <tr>        
                <td>
                <center>
                    <form action="pass_change.do" method="post">
                 
                    <center>
                        <br>
                        <div>
                        <input type="hidden" value="${e_mail}" name="cEmail">
                            변경할 비밀번호 입력 : <input type = "password" name = "cPw"
                                                  placeholder = "비밀번호를 입력하세요." >
                        </div>                                        
 
                        <br> <br>
                        <button type="submit" name="submit">비밀번호 변경</button>
 
                        </div>
                    </td>
                </tr>
                    </center>
            </table>
        </form>
</center>
 
 
</body>
</html>