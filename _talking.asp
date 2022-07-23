


<%
'	' 구글 API 음성인식 연동 / 2018-05-09/ 김유진
	chkAgent =  LCase(request.servervariables("HTTP_USER_AGENT"))
	Call chkLogin(1)	
	Sql	=	"	Insert Into dbMember.dbo.tblMobileTemp(userID, chkAgent, regDate, regDay) values ('"&userID&"','"&chkAgent&"',getDate(), getDate())"

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


				 $.ajax({    
					 type : 'POST',   // get , post
					 url : 'soobakcTalking.asp',
					 data : {talking : escape(final_transcript)},//{받을변수명 : 던질데이터},
					 dataType : 'html', // html, xml 등등 데이터 형태
					 success : function(tval){
								// 데이터 성공적으로 받을시 처리할 내역들    
						
								$("#result3").html(tval);
								var speech = new SpeechSynthesisUtterance();
								speech.text = tval;
								speech.lang = "ko-KR";
								speech.rate = 1
								speech.onend = function(event){
									consol.log("text to voice API:sysnthesis finished in"+event.elapsedTime+"seconds");
								};
								speechSynthesis.speak(speech);
					 },
					 error:function(request,status,error){
					  alert('데이터 처리 오류입니다.');
					  return;
					 },
					 complete:function(){     
					 }
				  });




			};
			
			recognition.onerror = function(event) {
			console.log('onerror', event);
				 if (event.error == 'no-speech') {
					$("#result3").html('답답해요 말 좀 하세요');
				 } else if (event.error == 'audio-capture') {
					$("#result3").html('안들려요');
				 } else if (event.error == 'not-allowed') {
					ignoreOnend = true;
					$("#result3").html(' 여기선 안되요');
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
	<div id="result2" style="width:100%;height:50px;border:1px solid;">
	
	</div>
	<div id="result3" style="width:100%;height:50px;border:1px solid;">
	
	</div>
	
	<br/>
	&nbsp;<button id="btn-mic" onclick="micOn('1');">수박씨랑 대화하기</button>
	<br/>
	<button id="btn-mic" onclick="window.location.reload();">새로고침</button>

</body>
</html>
