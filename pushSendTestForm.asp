<%
	startTime = timer()
%>

<%


'------------------------------------------------------------------------------------------------
' request | �Ѱ����� ��簪 : Call printRequestValue()
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
				alert('Ǫ�ø޽����� �߼� �� ���� �����ϼ���.');
				$("input[name='apptype']").focus();
				return;
			}
			var pushtitle = $("input[name='pushtitle']").val();

			if (pushtitle == ""){
				alert('Ǫ�ø޽��� Ÿ��Ʋ�� �Է��ϼ���');
				return;
			}
			var pushmsg = $("input[name='pushmsg']").val();

			if (pushtitle == ""){
				alert('Ǫ�ø޽��� ������ �Է��ϼ���');
				return;
			}

			frm.action = "pushSendTestAction.asp";
			frm.submit();
		}
	</Script>
</head>
<body id="layoutMain">
	<div>
	<Strong style="font-size:25px;">��Ǫ�ø޽��� �߼� �׽�Ʈ�ϱ��</Strong>
	<h2>
		����� https://m.soobakc.com/soobakcChatBot/pushSendTestForm.asp ����
	</h2>
	<br/><br/><br/><br/>
	<form name="theForm" method="post">
		<table border= "1" >
			<tr>
				<th>�� �����ϱ�</th>
				<td>
					<input type="radio" name="apptype" value="1"> 1����
					<input type="radio" name="apptype" value="2"> 2����
				</td>
			</tr>
			<tr>
				<th>Ǫ�������Է�</th>
				<td><input type="text" name="pushtitle" value=""></td>
			</tr>
			<tr>
				<th>Ǫ�ó���</th>
				<td><input type="text" name="pushmsg" value=""></td>
			</tr>
		</table>
	</form>
	<input type="button" value="Ǫ�ù߼��ϱ�" onclick= "goAction();">
	</div>
	<br/>
	<hr>
	<div>
		<a href="https://m1.soobakc.com/common/asp/fileDownLoad.asp?f=Ǫ���׽�Ʈ1����_20210122.apk&d=mobile/appTest">[1�� �� �ٿ�ε� �ޱ�]</a><br/>
		<a href="https://m1.soobakc.com/common/asp/fileDownLoad.asp?f=Ǫ���׽�Ʈ2����.apk&d=mobile/appTest">[2�� �� �ٿ�ε� �ޱ�]</a><br/>
		<hr>
		<br/>
		<br/>
		<br/>
		�Ʒ� ��ũ�� 1���۰� 2������ �ٿ�ε��Ͻ� �� ��ġ���ּ���.<br/>
		���� 1ȸ�̻� ������� ��ġ�� ����� ��ū���� ����Ǿ�� �մϴ�.<br/>
		�� ���������� �߼۾� ����� �����Ͻð� ������ �޽����� �Է��Ͽ� �׽�Ʈ�Ͻø� �˴ϴ�<br/>
		������CP ���� �������� ������ ���Դϴ�
	</div>
</body>
</html>
