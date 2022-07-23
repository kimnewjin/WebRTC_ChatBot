<%@ language="VBScript" %>

<%

Response.charset = "euc-kr"

Response.ContentType="text/html"

%>

<%

Dim randKey : randKey = ""

Dim id : id = request("id") '메시지를 받을 userID

Dim title : title = Request("title") 'push 메시지 타이틀


Dim message : message = Request("message") 'push 메시지 

'안드 푸시요청 URL

PushServerURL = "https://fcm.googleapis.com/fcm/send"'https://fcm.googleapis.com/v1/projects/mypush-8dffa/messages:send"'"https://gcm-http.googleapis.com/gcm/send"
'서버용APIKEY
'ApplicationAPIKey = "AAAAVaHbSMc:APA91bG_CidbP5R93yVPH6NBqKAUpQiotYuCHoZyy5O2wGZwZjHpcSLBVJsvFe_C9pASYJaqAVE1D28aDypZmwTjb6nemevWUYiWzRG8gYgfgN-jP7FwlH1OSLc8KjaT9pqFu_XNGAl0"
'token = "dch-A-miTweAqZjutXBcAr:APA91bEOseyMYxJpiBC07m3Er06af-YAI-oB0xk5wZpa4WRWzM6Rr6hU7394tF6t8Rt39HNruS6i7vIuPgFECQSHmHs87wWtAhyx0UvQNjMfN-prF8kRDuftJFRA8i2lRr-1zU2ITo5q"



ApplicationAPIKey = "AAAAVaHbSMc:APA91bG_CidbP5R93yVPH6NBqKAUpQiotYuCHoZyy5O2wGZwZjHpcSLBVJsvFe_C9pASYJaqAVE1D28aDypZmwTjb6nemevWUYiWzRG8gYgfgN-jP7FwlH1OSLc8KjaT9pqFu_XNGAl0"
token = "dch-A-miTweAqZjutXBcAr:APA91bF89LZVgeug4kFBGJSVdFSrorrDaXaD8Yj34AZp3H3g8GiBaZUUNNZ1Iy_n_rpwgDkzCq7-e--JX2AJBp9K2wvIbknbHk_26tJDaXpc6m429STlGpbC-4jti_gW23dcdz1CL8b_"


token = """"&token&""""

title = "푸시테스트"

message = "푸시메시지를 보냈습니다."

		Randomize
		popularRanNum = Int(Rnd() mod 100 )+1


randKey= popularRanNum



'// JSON 조합

'postJSONData = "" & _
' "{" & _
' "  ""to"" :  " & Token & " " & _
' ", ""data"": {" & _
' "               ""title"" : """ & title & """" & _
' "               , ""message"" : """ & message & """" & _
' "               , ""randKey"" : """ & randKey & """" & _
' "            }" & _
' "}"

 postJSONData = "" & _
"{" & _
" ""to"" : " & token & " " & _
", ""notification"": {" & _
" ""title"" : """ & title & """" & _
" , ""body"" : """ & message & """" & _
" , ""icon"" : """ & "ic_launcher"& """" & _
" , ""color"" : """ & "#rrggbb" & """" & _
" }" & _
" , ""data"": {" & _
" ""title"" : """ & title & """" & _
" , ""message"" : """ & message & """" & _
" , ""randKey"" : """ & randKey & """" & _
" }" & _
"}"




'// 전송

Response.write postJSONData

Set httpObj = Server.CreateObject("WinHttp.WinHttpRequest.5.1")

httpObj.open "POST" , PushServerURL, False

httpObj.SetRequestHeader "Content-Type", "application/json"

httpObj.SetRequestHeader "Authorization", "key=" & ApplicationAPIKey

httpObj.Send postJSONData

httpObj.WaitForResponse


Response.Write "<hr>"
Response.Write httpObj.Status

If httpObj.Status = "200" Then

'Response.Write("전송성공 : " & httpObj.ResponseText)

Response.write "{"&Chr(34)&"result"&Chr(34)&":"&Chr(34)&"전송성공"&Chr(34)&"}"

Else

'Response.Write("전송실패 : " & httpObj.ResponseText)

Response.write "{"&Chr(34)&"result"&Chr(34)&":"&Chr(34)&"false"&Chr(34)&"}"

End If

%>