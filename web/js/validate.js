function trim(s)
{
	return s.replace("/^\s*/" , "").replace("/\s*$/" , "");
}
function validate(){
	var error="";
	var exist=document.getElementById("exist").value;
	var username=trim(document.getElementById("account").value);
	var pass=trim(document.getElementById("password").value);
	var email=trim(document.getElementById("email").value);
	var nick=trim(document.getElementById("nickname").value);
	if(exist=="exist") return false;
	if(username==""||username==null)
	{
		error="请您输入用户名";
	}
	else if(!/^\w{6,20}$/.test(username))
	{
		error="用户名必须是字母和数字的组合,且长度在6到20之间";
	}
	else if(pass==""||pass==null)
	{
		error="请您输入密码";
	}
	else if(!/^\w{6,20}$/.test(pass))
	{
		error="密码必须是字母和数字的组合,且长度在6到20之间";
	}
	else if(nickname==""||nickname==null)
	{
		error="请您输入昵称";
	}
	else if(nickname.length<3||nickname.length>20)
	{
		error="昵称长度必须在3到20之间";
	}
	else if(email==""||email==null)
	{
		error="请您输入邮箱地址";
	}
	if(error=="")
	{ 
		return true;
	}
	else
	{
		$("#error").html(error);
		return false;
	}
  }
  function check()
  {
  	var username=trim(document.getElementById("account").value);
  	if(username==""||username==null)
	{
		return;
	}
	else if(!/^\w{6,20}$/.test(username))
	{
		return;
	}
	var callback=function(data)
	{
		if(data=="ok")
		{
			$("#exist").css("color","green");
			$("#exist").html("恭喜您,该用户名可以注册");
		}
		else
		{
			$("#exist").css("color","red");
			$("#exist").html("对不起,该用户名已被注册");
		}
	}
	$("#exist").css("color","blue");
	$("#exist").html("正在检验....请稍后");
	//远程调用DWR类
	Check.checkAccount(username,callback);
}