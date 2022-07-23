<%
	wording = "수학 지수법칙에 대한 콕 강의 찾아 줘"

	splitWoriding = Split(wording," ")

	For i = 0 To Ubound(splitWoriding)
		word = Trim(splitWoriding(i))

		a = i - 1

		If a > -1 Then
			prewording = Trim(splitWoriding(a))
		Else 
			prewording = ""
		End If

		n = i + 1

		If n <= Ubound(splitWoriding) Then
			nextWording = Trim(splitWoriding(n))
		Else
			nextWording = ""
		End 

		Response.Write prewording&"|"&word&"|"&nextWording"<BR>"
	Next

%>