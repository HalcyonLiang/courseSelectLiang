/**
 * Created by Chenwh on 2015-5-14 014.
 */
 $(document).ready(function(e) {
     $('register-form').validate({
         //验证无效时的处理代码
         invalidHandler:function(e,validator){
             var errors = validator.numberOfInvalids();
             if(errors){
                 var message = errors == 1
                    ?'在表单中有一个错误，已被高亮显示'
                    :'在表单中'+errors+'处错误'
                 $("div.error span").html(meaasge);
                 $("div.error").show();
             }
             else{
                 $("div.error").hide();
             }
         },
         //验证规则
         rules: {
             //学号验证方法
             stud_id: {
                 required: true,
                 byteRangeLength: [9, 9]
             },
             //密码验证
             password: {
                 required: true,
                 isPassword: true
             },
             //重新输入密码验证
             repassword: {
                 required: true,
                 isPassword: true,
                 equalTo: "input[name=password]"
             },
             //姓名校验
             name: {
                 required: true,
                 stringCheck: true,
                 byteRangeLength: [4, 10]
             },
             //邮件验证
             email: {
                 required: true,
                 email: true
             },
             //班级验证
             class_name: {
                 required: true,
                 byteRangeLength: [8, 8]
             }
         },
         //设置错误信息
         messages: {
             //学号验证错误消息
             stud_id: {
                 required: "请填写学号",
                 byteRangeLength: "学号必须是9位"
             },
             //密码错误消息
             password: {
                 required: "请填写密码"
             },
             repassword: {
                 required: "请填写与密码子段相同的密码",
                 equalTo: "必须与密码文本框相同的密码"
             },
             //姓名错误消息
             name: {
                 required: "请填写您的真实姓名",
                 stringCheck: "姓名只能包含中文字、英文字母、数字和下划线"
             },
             //邮箱错误消息
             email: {
                 required: "请输入一个Email地址",
                 email: "请输入一个有效地Email地址（格式：example@example.com）"
             },
             //班级错误消息
             class_name: {
                 required: "请填写班级名",
                 byteRangeLength: "请输入正确的班级名（格式：软日1205）"
             }
        }
    });
});
