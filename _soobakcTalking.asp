


<%
	talking = unescape(checkData(getData("talking")))

	talking = Replace(talking," ","")

	

	Select Case talking
		Case "수박씨안녕"
			answer = " 네 안녕하세요 김뉴님! 무엇을 도와드릴깝쇼?"
		Case "안녕"
			answer = " 네 안녕하세요 김뉴님!  무엇을 도와드릴깝쇼?"
		Case "심심해"
			answer = " 심심하면 심청전 보세요"
		Case "짜증나"
			answer = " 짜증나면 짜장면 드세요"
		Case Else
			answer = " 뭔소리 하는지 모르겠어요"
	End Select

	 Response.Write answer


%>