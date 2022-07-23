




<!doctype html>
<html lang="ko">
<head>
	<!--#include virtual="/common/asp/incMeta.asp"-->
	<script language="javascript">
	/*	window.SpeechRecognition = window.SpeechRecognition || window.webketSpeechRecognition;

		const recognition = new SpeechRecognition();
		recognition.interimResults = true;*/
		
	function micOn(){
		
		if (typeof webkitSpeechRecognition == 'function'){
			var speechRecognizer = new webkitSpeechRecognition(); //webkitSpeechRecognition
		
			var isRecognizing = false;
			 var ignoreOnend = false;
			 var finalTranscript = '';
			speechRecognizer.continuous = true;
			speechRecognizer.interimResults = true;//interimResults 

			speechRecognizer.onstart = function() {
				alert(11);
				console.log('onstart', arguments);
				isRecognizing = true;
				
				$("#result").html("2222");
			};

			speechRecognizer.onerror = function(event) {
//				 console.log(event);
				alert('error');
				$("#result4").html(event);
			};

			speechRecognizer.onend = function() {
				 console.log('onend', arguments);
			    isRecognizing = false;

				 if (ignoreOnend) {
					return false;
				 }
    
				 if (!finalTranscript) {
					console.log('empty finalTranscript');
					return false;
				 }   
			};

			speechRecognizer.lang = 'en-US';//ko-KR
			speechRecognizer.start();	



			speechRecognizer.onresult = function(event){
				var interimTranscripts='';
				 if (typeof(event.results) == 'undefined') {
					speechRecognizer.onend = null;
					speechRecognizer.stop();
					return;
				 }

				for (var i = event.resultIndex;  i < event.results.length; i++){
					var transcript = event.results[i][0].transcript;
					if (event.results[i].isFinal)
					{
							finalTranscript += transcript;
					}else{
						interimTranscripts += transcript;
					}
				}
				var tt = finalTranscripts+'/'+interimTranscripts;
				$("#result").html(tt);
			};
			speechRecognizer.onerror = function(event){
			};
			
		}else{
			alert(2);
			$("#result").html("IF google chorme, please upgrade;");
		}
		
	}	
	</script>
</head>
<body>
	<div id="result" style="width:100%;height:50px;border:1px solid;">
	
	</div>
	<br/>
	&nbsp;<button id="btn-mic" onclick="micOn();">����ũOFF</button>
</body>
</html>
