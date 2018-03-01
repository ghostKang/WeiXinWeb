<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() +"://" +request.getServerName() + ":" +request.getServerPort() +path +"/";
%>

<%@page import="com.weixin.util.WxUtil" %>
<%@page import="java.util.Map" %>


<%

    String appId = "wx5a0619e89fc817df";
    String appSecret = "25fcfad8fc821c0294dbab2e3ba856b8";
    String timestamp = "";
    String nonceStr = "";
    String signature = "";

    String queryStr = request.getQueryString();
    String url = request.getScheme()+"://"+ request.getServerName()+request.getRequestURI();
    if(queryStr != null)
        url = url +"?"+queryStr;
    url = url.split("#")[0];
//WxUtil2 wxUtil = new WxUtil2();
    Map rMap = WxUtil.getShareParam(url,appId,appSecret);

    if(WxUtil.mapEntryIsNotNull(rMap,"timestamp"))
    {
        timestamp = rMap.get("timestamp").toString();
    }
    if(WxUtil.mapEntryIsNotNull(rMap,"nonceStr"))
    {
        nonceStr = rMap.get("nonceStr").toString();
    }
    if(WxUtil.mapEntryIsNotNull(rMap,"signature"))
    {
        signature = rMap.get("signature").toString();
    }

%>


<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>试驾斯柯达新明锐，赢取王者荣耀传奇皮肤！</title>
    <audio src="lib/music/music.mp3" id="music" loop></audio>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="lib/Swiper-3.4.2/dist/css/swiper.min.css">

    <!-- Demo styles -->
    <style>
        html, body {
            position: relative;
            height: 100%;
        }
        body {
            background: #eee;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color:#000;
            margin: 0;
            padding: 0;
        }
        .swiper-container {
            width: 100%;
            height: 100%;
        }
        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;

            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }
        .myInput{
            display: block;
            background-color:transparent;
            border:none;
            color: #eeeeee;
            height: 6.2%;width: 50%;
            font-family:黑体;
            font-size: medium;
            outline: none;
            caret-color:red
        }
        .mySelect{
            background-color:transparent;
            border:none;
            color: #eeeeee;
            height: 6.2%;width: 50%;
            font-family:黑体;
            font-size: medium;
            outline: none;
            caret-color:red
        }
        #code{
            background-color:transparent;
            border:none;
            color: #eeeeee;
            height: 6.2%;width: 40%;
            font-family:黑体;
            font-size: larger;
            outline: none;
            caret-color:red
        }
        #code{
            display: none;
        }
    </style>
</head>
<body style="height: 100%;width: 100%">
<div class="swiper-container" style="height: 100%;width: 100%;position: absolute;left: 0;top: 0">
    <div class="swiper-wrapper" style="height: 100%;width: 100%;position: absolute;left: 0;top: 0">
        <div class="swiper-slide" style="position: relative;height: 100%;width: 100%;left: 0;top: 0">
            <img id="img1_1" src="lib/image/1.png" style="height: 100%;width: 100%;position: absolute;z-index: 1;left: 0;top: 0">
            <img id="img1_2" src="lib/image/1-1.png" style="height: 80%;width: 100%;position: absolute;z-index: 2;top: -8%;left:0;display: none;">
            <img id="img1_3" src="lib/image/1-2.png" style="height: 28%;width: 120%;position: absolute;z-index: 3;top: 38%;position:absolute;left:-100%">
            <img id="img1_4" src="lib/image/1-3.png" style="height: 13%;width: 80%;position: absolute;z-index: 4;top: 57%;position:absolute;right:-100%">
            <img id="img1_5" src="lib/image/1-4.png" style="height: 30%;width: 120%;position: absolute;z-index: 2;top: 55%;left:-18%;position:absolute;">
        </div>
        <div id="div2" class="swiper-slide" style="position: relative;height: 100%;width: 100%;left: 0;top: 0">
            <img id="img2_1" src="lib/image/1.png" style="height: 100%;width: 100%;position: absolute;z-index: 1;left: 0;top: 0">
            <img id="img2_2" src="lib/image/2_2.png" style="height: 20%;width: 65%;position: absolute;z-index: 3;top: 3%;position:absolute;left:-100%">
            <img id="img2_3" src="lib/image/2_1.png" style="height: 40%;width: 100%;position: absolute;z-index: 2;top: 21%;position:absolute;right:-100%">
            <img id="img2_4" src="lib/image/2_3.png" style="height: 37%;width: 100%;position: absolute;z-index: 3;top: 58%;display: none;">
            <img id="img2_5" src="lib/image/2_4.png" style="height: 10%;width: 100%;position: absolute;z-index: 2;top: 87%;left:0%">
        </div>
        <div id="div3" class="swiper-slide" style="position: relative;height: 100%;width: 100%;left: 0;top: 0">
            <img id="img3_1" src="lib/image/1.png" style="height: 100%;width: 100%;position: absolute;z-index: 1;left: 0;top: 0">
            <img id="img3_2" src="lib/image/3_6.png" style="height: 18%;width: 100%;position: absolute;z-index: 3;top: 4%;left: -100%">
            <img id="img3_3" src="lib/image/3_1.png" style="height: 38%;width: 100%;position: absolute;z-index: 2;top: 9.5%;left: 0;display: none">
            <img id="img3_4" src="lib/image/3_5.png" style="height: 20%;width: 100%;position: absolute;z-index: 3;top: 37%;right: -100%">
            <img id="img3_5" src="lib/image/3_2.png" style="height: 20%;width: 100%;position: absolute;z-index: 2;top: 47.48%;left: 0;display: none">
            <img id="img3_6" src="lib/image/3_4.png" style="height: 20%;width: 100%;position: absolute;z-index: 3;top: 63%;left: 0;display: none">
            <img id="img3_7" src="lib/image/3_3.png" style="height: 26%;width: 100%;position: absolute;z-index: 2;top: 67.35%;left: 0;display: none">
            <img id="img3_8" src="lib/image/3_7.png" style="height: 10%;width: 100%;position: absolute;z-index: 3;top: 87%;left: 0">
        </div>
        <div class="swiper-slide" style="height: 100%;width: 100%;position: relative;left: 0;top: 0">
            <img src="lib/image/4.jpg" style="height: 100%;width: 100%;position: absolute;z-index: 1;left: 0;top: 0">
            <img src="lib/image/4_2.png" style="z-index: 2;position: absolute;top: 53%;left: 68%;height: 14%;width: 25%" onclick="doSubmit();">
            <select type="text" id="store" name="store" class="mySelect" style="top: 45.5%;left: 38%;z-index: 2;position: absolute">
                <option value=""></option>
                <option value="1">成都国跃</option>
                <option value="2">四川申蓉</option>
                <option value="3">成都品信</option>
                <option value="4">成都艾潇</option>
                <option value="5">成都运通</option>
                <option value="6">成都锦宇</option>
            </select>
            <input type="text" id="name" name="name" class="myInput" style="top: 29.3%;left: 38%;z-index: 2;position: absolute">
            <input type="text" id="phone" name="phone" class="myInput" style="top: 37%;left: 38%;z-index: 2;position: absolute">
        </div>
        <div class="swiper-slide" style="height: 100%;width: 100%;position: relative;left: 0;top: 0">
            <img src="lib/image/5.jpg" style="height: 100%;width: 100%;position: absolute;z-index: 1;left: 0;top: 0">
            <div style="height: 200px;width: 200px;position: inherit;left: 0%;top: -18%;background-color: transparent">
                <img src="lib/image/circle.png" class="circle" id="circle" style="height: 100%;width: 100%;position: absolute;z-index: 2;left: 0;top: 0">
                <img src="lib/image/5_1.png" class="circle" id="circle1" style="height: 30%;width: 30%;position: absolute;z-index: 3;top: 35%;left: 35%">
            </div>
            <div style="height: 7%;width: 70%;position: absolute;left: 18%;top: 60%;background-color: transparent">
                <img src="lib/image/code1.png" class="code" style="height: 100%;width: 85%;position: absolute;z-index: 2;top: 0;left: 5%">
                <input type="text" id="code" class="code" style="height: 100%;width: 65%;position: absolute;z-index: 2;top: 0;left: 32%" disabled>
            </div>
        </div>
    </div>
    <!-- 分页器 -->
    <div class="swiper-pagination"></div>
</div>

<!-- Swiper JS -->
<script type="text/javascript" src="lib/Swiper-3.4.2/dist/js/swiper.min.js"></script>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.rotate.min.js"></script>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.easing.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>

<script>
    /*
    jQuery(function(){
        $("#circle1").hide();// 没点提交就隐藏抽奖
    });*/

    //--创建页面监听，等待微信端页面加载完毕 触发音频播放
    document.addEventListener('DOMContentLoaded', function () {
        function musicAutoPlay() {
            var music = document.getElementById('music');
            music.play();
            document.addEventListener("WeixinJSBridgeReady", function () {
                music.play();
            }, false);
        }
        musicAutoPlay();
    });
    //--创建触摸监听，当浏览器打开页面时，触摸屏幕触发事件，进行音频播放
    /*document.addEventListener('touchstart', function () {
        function musicAutoPlay() {
            var music = document.getElementById('music');
            music.play();
        }
        musicAutoPlay();
    });*/

    //重写alert，禁止显示ip
    window.alert = function alertw(name){
        var iframe = document.createElement("IFRAME");
        iframe.style.display="none";
        iframe.setAttribute("src", 'data:text/plain,');
        document.documentElement.appendChild(iframe);
        window.frames[0].window.alert(name);
        iframe.parentNode.removeChild(iframe);
    };

    //prompt，禁止显示ip
    /*window.prompt = function promptw(name){
        var iframe2 = document.createElement("IFRAME");
        iframe2.style.display="none";
        iframe2.setAttribute("src", 'data:text/plain,');
        document.documentElement.appendChild(iframe2);
        window.frames[0].window.prompt(name);
        iframe2.parentNode.removeChild(iframe2);
    };*/

    var dataForWeixin={
        appId:"",
        MsgImg:"lib/image/circle.png",//消息图片路径
        TLImg:"lib/image/circle.png",//时间线图路径
        url:"http://localhost:8080/",//分享url路径
        title:"试驾斯柯达新明锐，赢取王者荣耀传奇皮肤！",//标题
        desc:"测试",//描述
        fakeid:"",
        callback:function(){}
    };

    jQuery(function(){

        var music = document.getElementById("music");

        var swiper = new Swiper('.swiper-container', {
            pagination: '.swiper-pagination',
            paginationClickable: true,
            direction: 'vertical',
            onInit: function(swiper){
//                music.play();
                $("#img1_3").animate({left:'3%'});
                $("#img1_4").animate({right:'5%'});
                $("#img1_2").fadeIn(800);
            },
            onSlideChangeEnd: function(swiper){
//                music.play();
                var index = swiper.activeIndex;// 当前下标
                if(index==0){
                    $("#img1_3").animate({left:'3%'});
                    $("#img1_4").animate({right:'5%'});
                    $("#img1_2").fadeIn(800);
                }
                if(index==1){
                    $("#img1_3").css('left','-100%');
                    $("#img1_4").css('right','-100%');
                    $("#img1_2").hide();

                    $("#img2_2").animate({left:'7%'});
                    $("#img2_3").animate({right:'-2%'});
                    $("#img2_4").fadeIn(800);
                }
                if(index==0||index==2){
                    $("#img2_2").css('left','-100%');
                    $("#img2_3").css('right','-100%');
                    $("#img2_4").hide();
                }
                if(index==2){
                    $("#img3_2").animate({left:'0%'});
                    $("#img3_3").slideDown(800);
                    $("#img3_4").animate({right:'0%'});
                    $("#img3_5").slideDown(800);
                    $("#img3_6").fadeIn(800);
                    $("#img3_7").slideDown(800);
                }
                if(index==1||index==3){
                    $("#img3_2").css('left','-100%');
                    $("#img3_3").slideUp();
                    $("#img3_4").css('right','-100%');
                    $("#img3_5").slideUp();
                    $("#img3_6").hide();
                    $("#img3_7").slideUp();
                }
            }
        });

    });

    /*var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true,
        direction: 'vertical'
    });*/

    $(".circle").rotate({
        bind:
            {
                click: function(){
                    //提示用户输入手机号
                    var drawPhone;
                    layer.prompt({title: '请输入注册手机号：', formType: 1}, function(text, index){
                        drawPhone = text;
                        layer.close(index);
                        if (drawPhone != null && drawPhone != ""){
                            $.ajax({
                                type:'post',
                                url:'submitController/checkDrawPhone',
                                data:{
                                    phone:drawPhone
                                },
                                success:function(data){
                                    $("#circle").attr('src','lib/image/circle.png');
                                    // 提示已抽奖
                                    if(data == "pleaseRegister"){// 记录是否提交
                                        alert("您还未报名，请先报名提交！");
                                        return;
                                    }
                                    if(data == "alreadyDraw"){// 已提交已抽奖
                                        alert("您已抽奖，请下次再来！");
                                        return;
                                    }
                                    $("#circle").rotate({ angle:0,animateTo:9000,easing: $.easing.easeOutBack() });
                                    //将该用户的抽奖状态改为已抽奖
                                    $.ajax({
                                        type:'post',
                                        url:'submitController/changeState',
                                        data:{
                                            phone:drawPhone
                                        }
                                    });
                                    setTimeout(function(){
                                        // 是否中奖
                                        isWin(drawPhone);
                                    },1000);
                                }
                            });
                        }
                    });
                }
            }
    });

    // 判断是否中奖
    function isWin(drawPhone){
        var hours = new Date().getHours();// 系统当前小时
        var cz = 0;// 抽中皮肤量，开始为0，抽中一个记录一个
        var all = 120;// 总皮肤
        var winArr =new Array([6]);// 中奖数组（存放中奖的数字）

        // 获取抽中个数
        $.ajax({
            type:'post',
            url:'submitController/getCz',
            success:function(data){
                // 抽中个数
                cz = parseInt(data);
            }

        });
        /*if(hours>=0 && hours<11){
            // 0:00到11:00 剩三个10/1000，两个5/1000，一个1/1000

            /!*
            * 先获取上午抽中的皮肤数量，来改变中奖率
            * cz = ;
            *!/
            all = 3;// 上午共3个

        }else if(hours>11 && hours<13){
            // 11：00到13:00 剩六个50/1000，五个40/1000，四个30/1000，三个10/1000，两个5/1000，一个1/1000

            /!*
             * 先获取中午抽中的皮肤数量，来改变中奖率
             * cz = ;
             *!/
            all = 6;// 中午共6个

        }else{
            // 13:00到23:59 剩三个10/1000，两个5/1000，一个1/1000
            /!*
             * 先获取下午抽中的皮肤数量，来改变中奖率
             * cz = ;
             *!/
            all = 3;// 下午共3个

        }*/

        // 剩余皮肤数（number为7是测试数据）
        var number = 7;
        // 中奖数组添加中奖数字
        winArrGetNum(number,winArr);
        // 获取抽到的中奖数字
        var getNum = randomNum(number);
        //alert("number:"+number+"  zjArr:"+zjArr+"  getNum:"+getNum);
        // 点击抽奖后更换图片
        updateImg(winArr,getNum,drawPhone,cz,all);

    }

    // 抽奖人获取的数字
    function randomNum(number){
        var minNum = 1;
        var maxNum = 1000;
        if(number==1){
        }else if(number==2){
            maxNum = 200;
        }else if(number==3||number==4){
            maxNum = 100;
        }else if(number==5){
            maxNum = 25;
        }else if(number==6){
            maxNum = 20;
        }else if(number==7){
            maxNum = 5;
        }
        return parseInt(Math.random()*(maxNum-minNum+1)+minNum);
    }

    // 中奖数组装入中奖数字
    function winArrGetNum(number,winArr){
        if(number==1){
            winArr[0]=500;// 千分之一
        }else if(number==2){
            winArr[0]=100;// 两百分之一
        }else if(number==3){
            winArr[0]=50;// 百分之一
        }else if(number==4){
            winArr[0]=30;// 百分之三
            winArr[1]=60;
            winArr[2]=90;
        }else if(number==5){
            winArr[0]=20;// 二十五分之一
        }else if(number==6){
            winArr[0]=10;// 二十分之一
        }else if(number==7){
            winArr[0]=3;// 五分之一
        }
    }

    // 是否中奖信息
    function updateImg(winArr,winNum,drawPhone,cz,all){
        $("#circle1").hide();
        // 抽中数量=总数或者没抽中，提示没中奖
        if(cz==all||winArr.indexOf(winNum)==-1){
            $("#circle").attr('src','lib/image/5_3.png');
        }else{
            //更改中奖信息，并将中奖人信息存入中奖者表
            $.ajax({
                type:'post',
                url:'submitController/changeWinMessage',
                async:false,
                data:{
                    phone:drawPhone
                }
            });
            //显示中奖图片和兑换码
            $("#circle").attr('src','lib/image/5_2.png');
            // 兑换码
            $(".code").show();
            $.ajax({
                type:'post',
                url:'submitController/selectRewardCode',
                data:{
                    phone:drawPhone
                },
                success:function(data){
                    // 奖品编号
                    $("#code").val(data);
                }

            });
        }
    }

    // 提交按钮
    function doSubmit(){
        var name = $.trim($("#name").val());// 姓名
        var phone = $.trim($("#phone").val());// 电话
        var store = $("#store").val();// 预约门店
        if(name==''){
            alert("姓名不能为空！");
            $('#name').focus();
            return;
        }
        if(phone==''){
            alert("电话不能为空！");
            $('#phone').focus();
            return;
        }else{
            if(isPhoneNo(phone) == false) {
                alert('手机号码格式不正确！');
                $('#phone').focus();
                return;
            }
        }
        if(store==''){
            alert('请选择预约门店！');
            return;
        }

        $.ajax({
            type:'post',
            url:'submitController/addCustomer',
            data:{
                name:name,
                phone:phone,
                store:store
            },
            success:function(data){
                // 返回提交信息
                if(data=='checkFailed'){
                    alert('该手机号已注册！');
                }
                if(data=='true'){
                    alert('注册成功！开始抽奖吧！');
                }
                if(data=='false'){
                    alert('注册失败！');
                    return;
                }
            }
        });
        $("#circle").attr('src','lib/image/circle.png');
    }

    // 验证手机号方法
    function isPhoneNo(phone) {
        var pattern = /^1[34578]\d{9}$/;
        return pattern.test(phone);
    }

</script>

</body>


<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script type="text/javascript">


    var _img = 'http://cdskd.qlzhx.cn/lib/image/share.jpg';
    var _content = '到店试驾明锐家族车型可现场抽取288元史诗级皮肤';
    var _title = '试驾斯柯达新明锐，赢取王者荣耀传奇皮肤！';
    var _lineLink = location.href.split('#')[0];


    var currUrl = _lineLink;
    //   alert('<%=url%>');
    // debugger;
    var tcurrUrl = encodeURIComponent(currUrl);


    wx.config({
        debug: false,
        appId: "<%=appId%>",
        timestamp:"<%=timestamp%>",
        nonceStr: "<%=nonceStr%>",
        signature: "<%=signature%>",
        jsApiList: ['checkJsApi','onMenuShareTimeline','onMenuShareAppMessage','onMenuShareQQ','onMenuShareWeibo','onMenuShareQZone']
    });

    wx.ready(function () {
        var imgUrl = _img;

        var descContent = _content;// 'share test desc';
        var shareTitle = _title;//'share test title';//$(document).attr("title");//'{$article.title}';
        var lineLink = _lineLink;//'{$signPackage.rawString}';

        //  alert(lineLink);
        //分享到朋友圈
        wx.onMenuShareTimeline({
            title: shareTitle, // 分享标题
            //  desc: descContent, // 分享描述
            link: lineLink, // 分享链接
            imgUrl: imgUrl, // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
                //   alert("分享成功");


            },
            cancel: function () {
                // 用户取消分享后执行的回调函数

            }
        });

        wx.onMenuShareAppMessage({
            title: shareTitle, // 分享标题
            desc: descContent, // 分享描述
            link: lineLink, // 分享链接
            imgUrl: imgUrl, // 分享图标
            type: 'link', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });

        wx.onMenuShareQQ({
            title: shareTitle, // 分享标题
            desc: descContent, // 分享描述
            link: lineLink, // 分享链接
            imgUrl: imgUrl, // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });

        wx.onMenuShareWeibo({
            title: shareTitle, // 分享标题
            desc: descContent, // 分享描述
            link: lineLink, // 分享链接
            imgUrl: imgUrl, // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
        wx.onMenuShareQZone({
            title: shareTitle, // 分享标题
            desc: descContent, // 分享描述
            link: lineLink, // 分享链接
            imgUrl: imgUrl, // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });

    })

</script>
</html>
