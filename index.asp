


<%
'	' ���� API �����ν� ���� / 2018-05-09/ ������
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
			<h5>���ھ��� ��ȭ�غ��Ƿ���?</h5>
			<%
				If userID = "" Then
			%>
				<span>�̷� ���� �α����� ���ϼ̳׿�~ �α��� ���� ��Ź�����</span>
				<button onclick="goLoginChk();">�α��� �Ϸ� ����</button>
			<%
				Else
			%>
				<span><%=userName%>�� �ȳ��ϼ���<br/>���ھ��� �� �˾��̸� �����߾��<br/>���� ����ħ ��Ź�����</span><br/>
				<button onclick="goTalking();">��ŷ�Ϸ� ����</button>
			<%
				End IF
			%>
	</div>

</body>
</html>
