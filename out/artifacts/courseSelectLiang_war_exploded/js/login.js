$(document).ready(function(){
	$("#logindialog").dialog({
		title:"用户登录",
		height:"auto",
		bgiframe: true,
		autoOpen: true,
		modal: true,
		draggable:true,
		resizeable:true,
		show:"slide",
		hide:"slide"
		/*buttons: {
			'打开': function() {
				$("#message").html("对话框已打开");
			},
			'取消': function() {
				$(this).dialog('close');
			}
		},
		close: function(event) {
			//$(':text').val('');
		}*/
	});
	$("#login").click(function(){
		if(document.getElementById("account").value.length==0){
			alert("请输入用户名!");
			window.location.href='login.jsp';
			return false;
		}
		if(document.getElementById("password").value.length==0){
			alert("请输入密码!");
			window.location.href='login.jsp';
			return false;
		}
	});
	$("#message").css("color","red");
});