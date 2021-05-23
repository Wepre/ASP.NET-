<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Firstindex.aspx.cs" Inherits="HotelManage.Firstindex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, 
    user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>HOTEL WYU</title>
    <style>
        body,
        html {
            height: 100%;
        }

        body {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0;
	background-color: #212121;
        }

        .text-box {
            width: 700px;
            height: 400px;
            font-size: 4rem;
            font-weight: bold;
            text-transform: uppercase;
            position: relative;
            overflow: hidden;
            clip-path: url(#svgTextPath);
            color: white;
            background: #2fddc6;

        }

        .dot {
            display: inline-block;
            border-radius: 50%;
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0.9;
        }

        .dot:nth-child(1) {
            width: 150px;
            height: 150px;
            background: rgb(30, 207, 148);
            z-index: 8;
            transform: translateX(-175px) translateY(-175px);
        }

        .dot:nth-child(2) {
            width: 300px;
            height: 300px;
            background: rgb(28, 204, 195);
            z-index: 7;
            transform: translateX(-250px) translateY(-250px);
        }

        .dot:nth-child(3) {
            width: 500px;
            height: 500px;
            background: rgb(18, 155, 247);
            z-index: 6;
            transform: translateX(-350px) translateY(-350px);
        }

        text {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
                Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
            font-weight: bold;
            font-size: 8rem;
            text-transform: uppercase;
        }
    </style>
</head>

<body>
    <a href="OPLogin.aspx">
	<div class="text-box">
        <span class="dot"></span>
        <span class="dot"></span>
        <span class="dot"></span>
    </div>
	</a>
    <svg height="0" width="0">
        <defs>
            <clipPath id="svgTextPath">
                <!-- textLength 文字的长度 此处对应容器的宽度  x y 为横纵坐标位置 -->
                <text x="0" y="180" textLength="700px">HOTEL</text>
                <text x="200" y="300" textLength="320px">WYU</text>
            </clipPath>
        </defs>
    </svg>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js" integrity="sha256-lPE3wjN2a7ABWHbGz7+MKBJaykyzqCbU96BJWjio86U=" crossorigin="anonymous"></script>
<script>
    function move() {
        let box = document.querySelector(".text-box");
        let dt = document.querySelectorAll(".dot");
        window.addEventListener("mousemove", function (e) {
            for (let i = 0; i < dt.length; i++) {
                //圆灯相对于 容器的坐标位置
                let x = e.pageX - box.offsetLeft - dt[i].offsetWidth / 2;
                let y = e.pageY - box.offsetTop - dt[i].offsetHeight / 2;
                TweenLite.to(dt[i], i + 0.2, {
                    x: x,
                    y: y,
                    ease: Back.easeOut.config(1.7)
                });
            }
        });
    }
    move()
</script>
</html>
