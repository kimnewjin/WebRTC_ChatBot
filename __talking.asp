


<!doctype html>
<html lang="ko">
<head>
	<!--#include virtual="/common/asp/incMeta.asp"-->
	<script language="javascript">	

		if (typeof(webkitSpeechRecognition) != 'function'){
			alert('�������� �ʴ� �������Դϴ�.');
		}

		
		
		
			recognition.onstart = function() {
			/*	 console.log('Speech recognition service has started');
				 isRecognizing = true;
				 $("#result0").html("����");*/
			};
			recognition.onend = function() {
				
				console.log('Speech recognition service disconnected');
				isRecognizing = false;
				$("#result0").html("��");
				 if (ignoreOnend) {
					return false;
				 }

				/* if (window.getSelection) {
					window.getSelection().removeAllRanges();
					var range = document.createRange();
					range.selectNode(document.getElementById('result1'));
					window.getSelection().addRange(range);
				 }*/
				

			};
			
		


			
			recognition.onerror = function(event) {
				console.log('onerror', event);
				 if (event.error == 'no-speech') {
					$("#result3").html('����ؿ� �� �� �ϼ���');
				 } else if (event.error == 'audio-capture') {
					$("#result3").html('�ȵ����');
				 } else if (event.error == 'not-allowed') {
					ignoreOnend = true;
					$("#result3").html(' ���⼱ �ȵǿ�');
				 }
				$("#result4").html("����"+event.error);
			
			};

	function Answer(QuestionScript){
		
		  $.ajax({    
					 type : 'POST',   // get , post
					 url : 'soobakcTalking.asp',
					 data : {talking : escape(QuestionScript)},//{���������� : ����������},
					 dataType : 'html', // html, xml ��� ������ ����
					 success : function(tval){
						 var talkingWindowtext = $("#talkingWindow").html();

					 	 var myTalk = "<div style='text-align:right;'>���ھ� : "+ tval+"</div>";
						 $("#talkingWindow").append(myTalk);
								// ������ ���������� ������ ó���� ������    							
								var speech = new SpeechSynthesisUtterance();
								//alert(speech);
								speech.text = tval;
								speech.lang = "ko-KR";
								speech.rate = 1
								speech.onend = function(event){
									consol.log("text to voice API:sysnthesis finished in"+event.elapsedTime+"seconds");
								};
								speechSynthesis.speak(speech);
								micOn(1);
					 },
					 error:function(request,status,error){
					  alert('������ ó�� �����Դϴ�.');
					  return;
					 },
					 complete:function(){     
					 }
				  });


	}

	function micOn(langNo){		

		if (typeof webkitSpeechRecognition == 'function'){
			// �߱��� : cmn-Hans-CN 			// ���� : en-US
			// �ѱ��� : ko-KR 			// �Ϻ��� : ja-JP
			var recognition = new window.webkitSpeechRecognition();
			var isRecognizing = false;
			var ignoreOnend = false;
			recognition.continuous = true;
			recognition.interimResults = false;//interimResults 
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
			
			var final_transcript = '';	
			recognition.onresult = function(event) {
				//alert(typeof(event.resultIndex));
				var interim_transcript = '';							
				
					for (var i = event.resultIndex; i < event.results.length; ++i) {
						var transcript = event.results[i][0].transcript;		
						  if (event.results[i].isFinal) {
								final_transcript += transcript;
						  } else {
								interim_transcript +=  transcript;
						  }
					 }
					/* var talkingWindowtext = $("#talkingWindow").html();
					 alert(talkingWindowtext);*/

					 
					 //talkingWindowtext = talkingWindowtext + myTalk;
					 
					 if (typeof(event.results) == 'undefined') {
						recognition.onend = null;
						recognition.stop();
						return;
					 }else if (event.resultIndex == '0'){
						 var myTalk = "<div style='text-align:left;'><%=userName%> : "+ final_transcript+"</div>";
						 $("#talkingWindow").append(myTalk);
						 Answer(transcript);
						 return;
					 }
					 


					
			};

			
			
			

		}else{			
			$("#result").html("IF google chorme, please upgrade;");
		}
		
	}	

	function reload(){
		location.reload();
	}
	
	</script>
</head>
<body>	
	<div style="width:100%;height:100%;border:1px solid;text-align:center;padding-top:10%;">
			<h5>���ھ��� ��ȭ�غ��Ƿ���?</h5>
			<!--div id="result" style="width:80%;height:20px;border:1px solid;text-align:center;margin-left:10%;">
			</div-->
			<!--div id="result0" style="width:80%;height:20px;border:1px solid;text-align:center;margin-left:10%;">
			</div>
			<div id="result1" style="width:80%;height:20px;border:1px solid;text-align:center;margin-left:10%;">
			</div>
			<div id="result2" style="width:80%;height:20px;border:1px solid;text-align:center;margin-left:10%;">
			</div>
			<div id="result3" style="width:80%;height:20px;border:1px solid;text-align:center;margin-left:10%;">
			</div>
			<div id="result4" style="width:80%;height:20px;border:1px solid;text-align:center;margin-left:10%;">
			</div-->
			<div style="width:80%;height:40%;border:1px solid;text-align:center;margin-left:10%;" id="talkingWindow">
			</div>
			<div style="display:inline-block;float:left;margin-top:15px;margin-left:10%;">				
				<button onclick="reload();">���ΰ�ħ</button>
			</div>
			<div style="display:inline-block;float:right;margin-top:15px;margin-right:10%;">
				<button onclick="micOn(1);">���ϱ�</button>
			</div>
		
	</div>
</body>
</html>