$(document).ready(function(){
    $("#btn").mousedown(function(){

        Say();
    });
});

function Say(){
   // var word=$("#btn").val();
    var method = $("#method").val();
     var mediaid = $("#mediaid").val();
       var mediaurl = $("#mediaurl").val();
        var medianame = $("#medianame").val();
          var starttime = $("#start2").val();
          var endtime = $("#end2").val();
        var category1 = $("#category1").val();
         var category2 = $("#category2").val();
          var category3 = $("#category3").val();
          var category4 = $("#category4").val();
          var description = $("#desp").val();
    var data="method="+method+"&mediaid="+mediaid+"&mediaurl="+mediaurl+"&medianame="+medianame+"&starttime="+starttime+"&endtime="+endtime+"&category1="+category1+"&category2="+category2+"&category3="+category3+"&category4="+category4+"&description="+description;
    //alert(data);
    $.ajax({
        type:"post",
        url:"tag.do",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        dataType:"json",
        data:data,
        success: function(json){

            //$("#iSay").html(json.resWord);


//alert("haole....");
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
            $("#addtag").dialog("close");
            $("#info").dialog("open");
            $("#start").val("");
            $("#start2").val("");
            $("#end").val("");
            $("#end2").val("");
          //  p.html(json.resWord);

        },
        error:function(err){
            alert("标签时间不全！请修正");
            console.log(err.responseText, 'failed' );
        }
    });
}
