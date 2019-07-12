<%--
  Created by IntelliJ IDEA.
  User: JackLi
  Date: 18/9/5
  Time: 上午9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>党建后台管理系统登陆页面</title>
    <style>
        /*css 初始化 */
        html, body, ul, li, ol, dl, dd, dt, p, h1, h2, h3, h4, h5, h6, form, fieldset, legend, img {
            margin: 0;
            padding: 0;
        }

        /*将标签原有的默认内外边距去掉*/

        fieldset, img, input, button {
            border: none; /*去掉边框*/
            padding: 0;
            margin: 0;
            outline-style: none; /*去掉环绕边框*/
        }

        ul, ol {
            list-style: none; /*去掉原样式中的小黑点*/
            /*ctrl+alt+l*/
        }

        input {
            padding-top: 0;
            padding-bottom: 0;

        }

        select, input {
            vertical-align: middle; /*输入字居中显示*/
        }

        select, input, textarea {
            font-size: 14px;
            margin: 0;
        }

        /**/
        textarea {
            resize: none; /*防止拖动*/
        }

        img {
            border: 0;
            vertical-align: middle; /*  去掉图片底部默认的3像素空白缝隙*/
        }

        table {
            border-collapse: collapse; /*合并外边线*/
        }

        body {
            font-family:  Microsoft YaHei, Arial, "\5b8b\4f53";
            background: #0058ac;
        }

        .clearfix:before, .clearfix:after {
            content: "";
            display: table;
        }

        .clearfix:after {
            clear: both;
        }

        .clearfix {
            *zoom: 1; /*IE/7/6*/
            /*兼容IE6下的写法*/
        }

        h1, h2, h3, h4, h5, h6 {
            text-decoration: none; /**/
            font-weight: normal; /*不加粗*/
            font-size: 100%;
        }

        /*login 开始*/
        .login{
            width: 1000px;
            height: 500px;
            /*background-color: yellowgreen;*/
            position: absolute;
            left:50%;
            top:50%;
            margin-left: -500px;
            margin-top: -250px;
        }
        .login>.login_title{
            height: 80px;
            text-align: center;
        }
        .login>.login_title>p{
            color:#fff;
            font-size: 40px;
            font-weight: 600;
            margin-top: -8px;
            letter-spacing:5px
        }
        .login>.login_main{
            width: 1000px;
            height: 320px;
        }
        .login>.login_main>.main_left{
            height: 320px;
            width: 650px;
            float: left;
            -moz-border-top-left-radius: 10px;
            -webkit-border-top-left-radius: 10px;
            border-top-left-radius: 10px;

            -moz-border-bottom-left-radius: 10px;
            -webkit-border-bottom-left-radius: 10px;
            border-bottom-left-radius: 10px;

            background: url("${pageContext.request.contextPath }/jsAndCss/images/login_left.png") no-repeat;
        }
        .login>.login_main>.main_right{
            height: 320px;
            width: 350px;
            float: right;
            background-color: #e9eef2;
            -moz-border-top-right-radius: 10px;
            -webkit-border-top-right-radius: 10px;
            border-top-right-radius: 10px;

            -moz-border-bottom-right-radius: 10px;
            -webkit-border-bottom-right-radius: 10px;
            border-bottom-right-radius: 10px;
        }
        .login>.login_main>.main_right>.right_title{
            color:#0064c8;
            font-size: 20px;
            font-weight: 700;
            text-align: center;
            line-height: 60px;
            background: url("${pageContext.request.contextPath }/jsAndCss/images/border_img.png") repeat;
            margin-bottom: 25px;
        }
        .login>.login_main>.main_right>form>div{
            position: relative;
        }
        .login>.login_main>.main_right>form>div>img{
            position: absolute;
            left: 62px;
            top:7px;
        }
        .login>.login_main>.main_right>form input{
            height: 35px;
            width: 250px;
            border: 1px solid #d3d8dc;
            box-sizing: border-box;
            margin-bottom: 15px;
            margin-left: 50px;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            color:#333;
            padding-left: 40px;
        }

        .login>.login_main>.main_right>form>.code>input{
            width: 150px;
        }
        .login>.login_main>.main_right>form>.code>.code_img{
            width: 90px;
            height: 35px;
            float: right;
            margin-right: 50px;
            cursor: pointer;
        }
        .login>.login_main>.main_right>form input:focus{
            border: 1px solid #999;
        }
        .login>.login_main>.main_right>form>.yes_login>button{
            display: block;
            width: 250px;
            height: 35px;
            line-height: 35px;
            text-align: center;
            background-color: #0064c8;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            color:#fff;
            text-decoration: none;
            margin-left: 50px;
        }
        .login>.login_main>.main_right>form>.yes_login>button:hover{
            background-color: #0058af;
        }
        .login>.login_footer{
            text-align: center;
            padding-top: 20px;
        }
        .login>.login_footer>p{
            font-size: 14px;
            color:#eee;
            line-height: 30px;
        }

    </style>
</head>
<body>
<div class="login">
    <div class="login_title">
        <p>党建后台管理系统</p>
    </div>
    <div class="login_main">
        <div class="main_left"></div>
        <div class="main_right">
            <div class="right_title">用户登录</div>
            <form action="${pageContext.request.contextPath }/back/login" method="post">
                <div class="username">
                    <img src="${pageContext.request.contextPath }/jsAndCss/images/username.png" alt="">
                    <input type="text" name="userName" placeholder="请输入用户名" value="${userName }"/>
                </div>
                <div class="password">
                    <img src="${pageContext.request.contextPath }/jsAndCss/images/password.png" alt="">
                    <input type="password" name="password" placeholder="请输入密码" value="${password }">
                </div>
                <div class="code">
                    <img src="${pageContext.request.contextPath }/jsAndCss/images/code.png" alt="">
                    <input type="text" name="checkcode" placeholder="请输入验证码">
                    <div class="code_img">
                        <img id="loginform:vCode" src="${pageContext.request.contextPath }/validateCode" alt=""
                             onclick="javascript:document.getElementById('loginform:vCode').src='${pageContext.request.contextPath }/validateCode?'+Math.random();">
                    </div>
                </div>
                <div class="yes_login">
                    <button type="submit" style="cursor: pointer; display: inline-block;">登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
                </div>

                <div style="margin: 10px 50px;">
                    <div style="width: 190px;height:30px;line-height:30px;display:inline-block; vertical-align:middle; text-align: center;color: red; ">
	                    <span>${msg }</span>
                    </div>
                    <div style="width: 50px; height:30px; display:inline-block; vertical-align:middle; cursor: pointer;">
	                   <a href="back/toForgetPassword" style="font-size: 12px; text-decoration: none;">忘记密码</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="login_footer">
        <p>建议浏览器：最新版的各种浏览器</p>
    </div>
</div>
</body>
</html>
