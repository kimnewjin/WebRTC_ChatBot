



<%
	appType	= getData("appType") 
	token		= getData("token")


	If token <> "" Then
		Sql	=	"	Select top 1 pushToken From dZone.dbo.tblkimnewAppPushTestTokenLog with(Nolock)	" & vbCrlf &_
					"	Where pushToken =	'"&token&"' And appType ='"&appType&"'	"
		tokenArray = getrows(sql)

		If Not IsArray(tokenArray) Then
			Sql = "	Insert Into dZone.dbo.tblkimnewAppPushTestTokenLog	(	"& vbCrlf &_
					"		appType, pushtoken	"& vbCrlf &_
					"	)	 values (	"& vbCrlf &_
					"		'"&appType&"','"&token&"'	"& vbCrlf &_
					"	)	"

			Call executeSql(Sql)
		End IF
	End IF


%>
<%=appType%>�� �� ����<br/>

��  �ڵ����� ��ū���� �Ʒ��� ���ƿ�

<Strong style="color:red;">
	<%=token%>
</Strong>

<br/>

<%=Now()%>

<br/>


<input type="button" value="��â����" onclick="javascript: window.open('https://m.soobakc.com');">
<input type="button" value="���ΰ�ħ" onclick="location.reload();">

<br/><br/>
<h3 >
	<a href="pushSendTestForm.asp">Ǫ�� �׽�Ʈ ���������� </a>
</h3>