



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
				 data : {key : '<%=serverKey%>', TITLE : "Hello", BODY :"kimnew"},//{���������� : ����������},
				 dataType : 'html', // html, xml ��� ������ ����
				 success : function(tval){
							// ������ ���������� ������ ó���� ������    
				 alert(tval);
					  },
				 error:function(request,status,error){
				  alert('������ ó�� �����Դϴ�.');
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
  <input type="button" name="Ǫ��" onclick="getThisData();" value="Ǫ���׽�Ʈ">
<hr>
  <form name="theForm" method="post">
		<input type="text" name="ke1y" value="<%=serverKey%>">
		<input type="text" name="TITLE" value="Ǫ��">
		<input type="text" name="BODY" value="�޷�">
  </form>

<input type="button" name="Ǫ��" onclick="goAction();" value="Ǫ��������">
 </body>

</html>
