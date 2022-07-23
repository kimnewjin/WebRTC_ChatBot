


<%
'	' 구글 API 음성인식 연동 / 2018-05-09/ 김유진
'	chkAgent =  LCase(request.servervariables("HTTP_USER_AGENT"))
'
'	Sql	=	"	Insert Into dbMember.dbo.tblMobileTemp(chkAgent) values ('"&chkAgent&"')"
'
'	Call executeSql(Sql)
	
	Call chkLogin(0)	
%>

<!doctype html>
<html lang="ko">
<head>
	<!--#include virtual="/common/asp/incMeta.asp"-->	
	<script language="javascript">
		function goLoginChk(){
			var frm = document.loginChk;

			frm.action  = "/member/login.asp";
			frm.submit();
		}

		function goTalking(){
			location.href='/soobakcChatBot/talking.asp';
		}
	</script>
</head>
<body>	
	<h2>mtest.soobakc.com</h2>
	<form name="loginChk" method="post">
		<input type="hidden" name="refer" value="/soobakcChatBot/">
	</form>
	<div style="width:100%;height:100%;border:1px solid;text-align:center;padding-top:30%;">
			<h5>수박씨랑 대화해보실래요?</h5>
			<%
				If userID = "" Then
			%>
				<span>이론 아직 로그인을 안하셨네요~ 로그인 부터 부탁드려요</span>
				<button onclick="goLoginChk();">로그인 하러 가기</button>
			<%
				Else
			%>
				<span><%=userName%>님 안녕하세요<br/>수박씨가 막 옹알이를 시작했어요<br/>많은 가르침 부탁드려요</span><br/>
				<button onclick="goTalking();">토킹하러 가기</button>
			<%
				End IF
			%>
	</div>

</body>
</html>
