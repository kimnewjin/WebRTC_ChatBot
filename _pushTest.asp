



<%
	serverKey ="AAAAVaHbSMc:APA91bFUbivhvV2FgZ3hxDs-3s-rVTAPFmBdpaXquhrCkH4B9CErZD255Ne0zTY2KIqfED1KaU09kmyqmOwBgY5PLnACZjKT20FE-mguLpCLgOKqGhUhQbOfIqoPzNiwIrE5laeKgnKU"
%>
<!doctype html>
<html lang="en">
 <head>
  <!--#include virtual="/common/asp/incMeta.asp"-->
  <title>Document</title>
 </head>
 <body>
  <script language="javascript">
	function getThisData(val){

			$.ajax({    
				 type : 'POST',   // get , post
				 url : 'https://fcm.googleapis.com/fcm/send',
				 data : {key : '<%=serverKey%>', TITLE : "Hello", BODY :"kimnew"},//{받을변수명 : 던질데이터},
				 dataType : 'html', // html, xml 등등 데이터 형태
				 success : function(tval){
							// 데이터 성공적으로 받을시 처리할 내역들    
				 alert(tval);
					  },
				 error:function(request,status,error){
				  alert('데이터 처리 오류입니다.');
				  return;
				 },
				 complete:function(){     
				 }
				  });

			}

			function goAction(){
				var frm = document.theForm;
				frm.action = "https://fcm.googleapis.com/fcm/send";
				frm.submit();
			}
  </script>
  <input type="button" name="푸시" onclick="getThisData();" value="푸시테스트">
<hr>
  <form name="theForm" method="post">
		<input type="text" name="ke1y" value="<%=serverKey%>">
		<input type="text" name="TITLE" value="푸시">
		<input type="text" name="BODY" value="메롱">
  </form>

<input type="button" name="푸시" onclick="goAction();" value="푸시폼전송">
 </body>

</html>
