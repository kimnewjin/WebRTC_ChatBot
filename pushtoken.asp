



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
<%=appType%>번 앱 접속<br/>

내  핸드폰의 토큰값은 아래와 같아요

<Strong style="color:red;">
	<%=token%>
</Strong>

<br/>

<%=Now()%>

<br/>


<input type="button" value="새창띠우기" onclick="javascript: window.open('https://m.soobakc.com');">
<input type="button" value="새로고침" onclick="location.reload();">

<br/><br/>
<h3 >
	<a href="pushSendTestForm.asp">푸시 테스트 보내러가기 </a>
</h3>