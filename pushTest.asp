



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
	import '@firebase/messaging';

const config = {
  projectId: "team-5dd61",
  apiKey: "Your api key",
  messagingSenderId: "Your sender ID",
};

firebase.initializeApp(config);
const messaging = firebase.messaging()
messaging.usePublicVapidKey("Your Web push key");
Notification.requestPermission().then(function(permission) {
  if (permission === 'granted') {
    console.log('Notification permission granted.');
  } else {
    console.log('Unable to get permission to notify.');
  }
});
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
