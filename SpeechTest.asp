


<%
	' 구글 API 음성인식 연동 / 2018-05-09/ 김유진
	chkAgent =  LCase(request.servervariables("HTTP_USER_AGENT"))

	Sql	=	"	Insert Into dbMember.dbo.tblMobileTemp(chkAgent) values ('"&chkAgent&"')"

	Call executeSql(Sql)

%>

<!doctype html>
<html lang="ko">
<head>
	<!--#include virtual="/common/asp/incMeta.asp"-->
	<script language="javascript">	

		if (typeof(webkitSpeechRecognition) != 'function'){
			alert('지원하지 않는 브라우저입니다.');
		}

		var recognition = new window.webkitSpeechRecognition();
		var isRecognizing = false;
		var ignoreOnend = false;
		recognition.continuous = true;
		recognition.interimResults = true;//interimResults 
			recognition.onstart = function() {
				 console.log('Speech recognition service has started');
				 isRecognizing = true;
				 $("#result0").html("시작");
			};
			recognition.onend = function() {
				
				console.log('Speech recognition service disconnected');
				isRecognizing = false;
				 if (ignoreOnend) {
					return false;
				 }

				 if (window.getSelection) {
					window.getSelection().removeAllRanges();
					var range = document.createRange();
					range.selectNode(document.getElementById('result1'));
					window.getSelection().addRange(range);
				 }
				

			};

			recognition.onresult = function(event) {
				$("#result0").html(event.resultIndex);
					var interim_transcript = '';
					var final_transcript = '';					

					 for (var i = event.resultIndex; i < event.results.length; ++i) {
						  // Verify if the recognized text is the last with the isFinal property
						  if (event.results[i].isFinal) {
								final_transcript += event.results[i][0].transcript;
						  } else {
								interim_transcript += event.results[i][0].transcript;
						  }
					 }

				$("#result1").html(interim_transcript);
				$("#result2").html(final_transcript);
				$("#result3").html(event.results[0][0].transcript);

				 console.log("Interim: ", interim_transcript);

				 console.log("Final: ",final_transcript);

				 console.log("Simple: ", event.results[0][0].transcript);
			};
			
			recognition.onerror = function(event) {
			console.log('onerror', event);
				 if (event.error == 'no-speech') {
					ignoreOnend = true;
				 } else if (event.error == 'audio-capture') {
					ignoreOnend = true;
				 } else if (event.error == 'not-allowed') {
					ignoreOnend = true;
				 }
				$("#result4").html("에러"+event.error);
			
			};

	function micOn(langNo){		

		if (typeof webkitSpeechRecognition == 'function'){
			// 중국어 : cmn-Hans-CN
			// 영어 : en-US
			// 한국어 : ko-KR
			// 일본어 : ja-JP
			if (langNo == '1' ){
				recognition.lang = 'ko-KR';
			}else if(langNo == '2'){
				recognition.lang = 'cmn-Hans-CN';
			}else if(langNo == '3'){
				recognition.lang = 'ja-JP';
			}else if(langNo == '4'){
				recognition.lang = 'en-US';
			}
			
			recognition.start();
			ignoreOnend = false;

			
		
		}else{
			
			$("#result").html("IF google chorme, please upgrade;");
		}
		
	}	
	
	</script>
</head>
<body>
	<div id="result0" style="width:100%;height:50px;border:1px solid;">
	
	</div>
	<div id="result1" style="width:100%;height:50px;border:1px solid;">
	
	</div>
	<div id="result2" style="width:100%;height:50px;border:1px solid;">
	
	</div>
	<div id="result3" style="width:100%;height:50px;border:1px solid;">
	
	</div>
	<div id="result4" style="width:100%;height:50px;border:1px solid;">
	
	</div>
	<br/>
	&nbsp;<button id="btn-mic" onclick="micOn('1');">한국어 말하기</button>
	&nbsp;<button id="btn-mic" onclick="micOn('2');">중국어 말하기</button>
	&nbsp;<button id="btn-mic" onclick="micOn('3');">일본어 말하기</button>
	&nbsp;<button id="btn-mic" onclick="micOn('4');">영어 말하기</button>
	<br/>
	<button id="btn-mic" onclick="window.location.reload();">새로고침</button>

</body>
</html>
