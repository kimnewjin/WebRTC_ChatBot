

<%

	' 2020-11-09 /김유진
	apptype		= Trim(getData("appType"))
	'pushtitle	= Trim(getData("pushtitle"))
	'pushmsg		= Trim(getData("pushmsg"))

	pushTitle = apptype&"번앱 스케쥴러로 자동처리"
	pushMsg = apptype&"번앱 푸시야~얼레리 꼴레리 메롱"&Now()



	If apptype = "" Or pushtitle = "" Or pushmsg = "" Then
		Response.Write "필수정보가 입력되지 않았습니다"
		Response.end
	End If
	

	PushServerURL = "https://fcm.googleapis.com/fcm/send" '푸시메시지를 처리할  URL

	'파이어베이스 콘솔에서 발급받은 서버키
	Select Case apptype
		Case "1"
			ApplicationAPIKey = "AAAAVaHbSMc:APA91bG_CidbP5R93yVPH6NBqKAUpQiotYuCHoZyy5O2wGZwZjHpcSLBVJsvFe_C9pASYJaqAVE1D28aDypZmwTjb6nemevWUYiWzRG8gYgfgN-jP7FwlH1OSLc8KjaT9pqFu_XNGAl0"
		Case "2"
			ApplicationAPIKey = "AAAAYpUlHH8:APA91bFHaVqk47nohWmFrLdFtUiClJ9J5VqtJgCvEum3ASeiSYgM4slkxxXu0ZNrIsC-8JJxS5O9YhbrYqfqntomMPwhNll2EaBNng-0J-pJaJCDLncpBBigAaahJ8Aw67nQN73SExmH"
		Case Else
			ApplicationAPIKey = ""
	End Select


	If ApplicationAPIKey = "" Then
		Response.Write "앱 정보가 올바르지 않습니다."
		Response.end
	End If

	Set httpObj = Server.CreateObject("WinHttp.WinHttpRequest.5.1")
	httpObj.open "POST" , PushServerURL, False
	httpObj.SetRequestHeader "Content-Type", "application/json"
	httpObj.SetRequestHeader "Authorization", "key=" & ApplicationAPIKey
	
	'앱설치자 푸시발송대상자 선택
	Sql	=	"	Select  pushToken From dZone.dbo.tblkimnewAppPushTestTokenLog with(Nolock)	"	& vbCrlf &_
				"	Where appType = '"&apptype&"'	"	& vbCrlf &_
				"	Order by IDX Asc	"

	tokenArray = getRows(sql)

	getToken = ""
	postJSONDATASet = ""
	If IsArray(tokenArray) Then
		For i = 0 To Ubound(tokenArray,2)
			pushToken = Trim(tokenArray(0,i))

			Randomize
			popularRanNum = Int(Rnd() mod 100 )+1
			randKey= popularRanNum		'푸시 발송시 필요한 랜덤키 생성

			postJSONData = "" & _
				"{" & _
				" ""to"" : """ & pushToken & """ " & _
				", ""notification"": {" & _
				" ""title"" : """ & pushtitle & """" & _
				" , ""body"" : """ & pushmsg & """" & _
				" , ""icon"" : """ & "ic_launcher"& """" & _
				" , ""color"" : """ & "#rrggbb" & """" & _
				" }" & _
				" , ""data"": {" & _
				" ""title"" : """ & pushtitle & """" & _
				" , ""message"" : """ & pushmsg & """" & _
				" , ""randKey"" : """ & randKey & """" & _
				" }" & _
				"}"

				
				httpObj.Send postJSONData
				httpObj.WaitForResponse

				
				Response.Write "<hr>"
				Response.Write "푸시메시지발송결과값 : "&httpObj.Status




			 
			postJSONDATASet =  postJSONDATASet &postJSONData
			'getToken =  getToken &pushToken&","
		Next

		If getToken <> "" Then
			getToken = Left(getToken,Len(getToken)-1)
		End If
		
		getToken = Replace(getToken,",",""",""")
	End If


	
	
%>
<br/>
<a href="pushSendTestForm.asp">다시 푸시 보내기</a>