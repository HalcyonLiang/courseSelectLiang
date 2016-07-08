/**
 * Created by Chenwh on 2015-6-3 003.
 */
$(document).ready(function(){
    window.open("../");
    $("#addcol").dialog({
        title:"添加收藏",
        height:"auto",
        bgiframe: true,
        autoOpen: false,
        modal: true,
        draggable:true,
        resizeable:true,
        show:"slide",
        hide:"slide"
    });
    $("#add").click(function(){
        $("#addcol").dialog("open");
    });
    $("#answercheck").dialog({
        title:"添加作业条目",
        height:"auto",
        bgiframe: true,
        autoOpen: false,
        modal: true,
        draggable:true,
        resizeable:true,
        show:"slide",
        hide:"slide"
    });
    $("#info").dialog({
        title:"提示信息",
        height:"auto",
        bgiframe: true,
        autoOpen: false,
        modal: true,
        draggable:true,
        resizeable:true,
        show:"slide",
        hide:"slide"
    });
    $("#answer").click(function(){
        $("#answercheck").dialog("open");
    });
    $("#btn").mousedown(function(){
        addcol();
    });
    $("#btn2").mousedown(function(){
        addanswer();
    });
});

function addcol(){
    // var word=$("#btn").val();
    var col_url = $("#col_url").val();
    var col_name = $("#col_name").val();
    var col_type = $("#col_type").val();
    var data = "col_url="+col_url+"&col_name="+col_name+"&col_type="+col_type;
    //alert(data);
    $.ajax({
        type:"post",
        url:"studaddcollection.do",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        dataType:"json",
        data:data,
        success: function(json){
            $("#addcol").dialog("close");
            $("#info").dialog("open");
            $("#col_url").val("");
            $("#col_name").val("");
            $("#col_type").val("");
            //  p.html(json.resWord);
        },
        error:function(err){
            alert("信息不完整！请修正");
            console.log(err.responseText, 'failed' );
        }
    });
}

function addanswer(){
    // var word=$("#btn").val();
    var ans_url = $("#col_url").val();
    var data = "ans_url="+ans_url;
    //alert(data);
    $.ajax({
        type:"post",
        url:"uploadhomework.do",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        dataType:"json",
        data:data,
        success: function(json){
            $("#answercheck").dialog("close");
            $("#info").dialog("open");
            $("#ans_url").val("");
            //  p.html(json.resWord);
        },
        error:function(err){
            alert("信息不完整！请修正");
            console.log(err.responseText, 'failed' );
        }
    });
}

