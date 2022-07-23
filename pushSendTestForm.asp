<%
	startTime = timer()
%>

<%


'------------------------------------------------------------------------------------------------
' request | 넘겨져온 모든값 : Call printRequestValue()
'------------------------------------------------------------------------------------------------




'------------------------------------------------------------------------------------------------
' logic
'------------------------------------------------------------------------------------------------
%>
<!doctype html>
<html lang="ko">
<head>
	<!--#include virtual="/common/asp/incMeta.asp"-->
	<Script language="javascript">
		function goAction(){
			var frm = document.theForm;
			var apptype = $("input[name='apptype']:checked").val();

			if (apptype == undefined){
				alert('푸시메시지를 발송 할 앱을 선택하세요.');
				$("input[name='apptype']").focus();
				return;
			}
			var pushtitle = $("input[name='pushtitle']").val();

			if (pushtitle == ""){
				alert('푸시메시지 타이틀을 입력하세요');
				return;
			}
			var pushmsg = $("input[name='pushmsg']").val();

			if (pushtitle == ""){
				alert('푸시메시지 내용을 입력하세요');
				return;
			}

			frm.action = "pushSendTestAction.asp";
			frm.submit();
		}
	</Script>
</head>
<body id="layoutMain">
	<div>
	<Strong style="font-size:25px;">□푸시메시지 발송 테스트하기□</Strong>
	<h2>
		여기는 https://m.soobakc.com/soobakcChatBot/pushSendTestForm.asp 에요
	</h2>
	<br/><br/><br/><br/>
	<form name="theForm" method="post">
		<table border= "1" >
			<tr>
				<th>앱 선택하기</th>
				<td>
					<input type="radio" name="apptype" value="1"> 1번앱
					<input type="radio" name="apptype" value="2"> 2번앱
				</td>
			</tr>
			<tr>
				<th>푸시제목입력</th>
				<td><input type="text" name="pushtitle" value=""></td>
			</tr>
			<tr>
				<th>푸시내용</th>
				<td><input type="text" name="pushmsg" value=""></td>
			</tr>
		</table>
	</form>
	<input type="button" value="푸시발송하기" onclick= "goAction();">
	</div>
	<br/>
	<hr>
	<div>
		<a href="https://m1.soobakc.com/common/asp/fileDownLoad.asp?f=푸시테스트1번앱_20210122.apk&d=mobile/appTest">[1번 앱 다운로드 받기]</a><br/>
		<a href="https://m1.soobakc.com/common/asp/fileDownLoad.asp?f=푸시테스트2번앱.apk&d=mobile/appTest">[2번 앱 다운로드 받기]</a><br/>
		<hr>
		<br/>
		<br/>
		<br/>
		아래 링크된 1번앱과 2번앱을 다운로드하신 후 설치해주세요.<br/>
		앱을 1회이상 실행시켜 설치된 기기의 토큰값이 추출되어야 합니다.<br/>
		본 페이지에서 발송앱 대상을 선택하시고 간략히 메시지를 입력하여 테스트하시면 됩니다<br/>
		김유진CP 개인 계정으로 설정된 앱입니다
	</div>
</body>
</html>
