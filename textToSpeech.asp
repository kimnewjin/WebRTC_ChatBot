


<%
	' 구글 API 음성인식 연동 / 2018-05-09/ 김유진

%>

<!doctype html>
<html lang="ko">
<head>
	<!--#include virtual="/common/asp/incMeta.asp"-->
	<script language="javascript">	
		function readText(){
			var chkText = $("input[name='chkText']").val();

			if (chkText == ""){
				alert('글씨를 입력하세요');
				$("input[name='chkText']").focus();
				return;
			}
			var speech = new SpeechSynthesisUtterance();
			speech.text = chkText;
			speech.lang = "ko-KR";
			speech.rate = 1
			speech.onend = function(event){
				consol.log("text to voice API:sysnthesis finished in"+event.elapsedTime+"seconds");
			};
			speechSynthesis.speak(speech);
		}

	
	</script>
</head>
<body>
	<input type="text" name="chkText" value="" style="width:100%">
	<br/>
	&nbsp;<button id="btn-mic" onclick="readText('1');">글씨 읽기</button>

	<br/>
	<button id="btn-mic" onclick="window.location.reload();">새로고침</button>

</body>
</html>
