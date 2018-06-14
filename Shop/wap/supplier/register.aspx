﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Supplier.Register" validateRequest="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta content="text/html; charset=UTF-8" http-equiv="content-type" />
    <meta name="author" content="LebiShop" />
    <script type="text/javascript" src="<%=site.AdminJsPath%>/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=site.AdminJsPath%>/messagebox.js"></script>
    <script type="text/javascript" src="<%=site.AdminJsPath%>/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<%=site.AdminJsPath%>/main.js"></script>
    <style type="text/css">
        html, body, div, span, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, address, big, cite, code, del, em, font, img, ins, small, strong, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, th
        {
            font-weight: normal;
            margin: 0;
            padding: 0;
        }
        ol, ul
        {
            list-style: none;
        }
        :focus
        {
            outline: 0;
        }
        a img
        {
            border: 0;
        }
        img
        {
            vertical-align: middle;
        }
        table
        {
            empty-cells: show;
        }
        em, i
        {
            color: #999;
            font-size: 12px;
            font-style: normal;
        }
        BODY
        {
            width: 100%;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .both
        {
            clear: both;
            font-size: 0;
            height: 0;
            overflow: hidden;
            visibility: hidden;
        }
        .nbbox
        {
            width: 700px;
            margin: 100px auto 0 auto;
        }
        .nbbox .mt
        {
            width: 100%;
            margin-bottom: 20px;
        }
        .nbbox .mt .right
        {
            padding-right: 10px;
        }
        .nbbox .mt h2
        {
            text-align: center;
            font-size: 14px;
            font-family: "microsoft yahei";
            color: #333333;
        }
        .nbbox .mc
        {
            width: 100%;
            padding: 50px 0;
            border: 3px solid #CCC;
            border-radius: 5px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
        }
        .user .reg
        {
        }
        .user .reg .mt
        {
            height: 40px;
            line-height: 40px;
        }
        .user .reg .mt h2
        {
            height: 40px;
            line-height: 40px;
            font-size: 16px;
        }
        .user .reg table
        {
            width: 700px;
            margin: 0 auto;
        }
        .user .reg table tr
        {
            height: 50px;
        }
        .user .reg table tr th
        {
            width: 120px;
            text-align: right;
            padding-right: 10px;
            font-weight: normal;
        }
        .user .reg table tr td
        {
            width: 570px;
            color: #999;
        }
        .nbbox .copy
        {
            width: 100%;
            padding: 10px 0 10px 0;
            text-align: center;
        }
        .input
        {
            height: 24px;
            line-height: 24px;
            font-size: 12px;
            border-top: 1px #AAAAAA solid;
            border-left: 1px #AAAAAA solid;
            border-bottom: 1px #DDDDDD solid;
            border-right: 1px #DDDDDD solid;
            color: #333;
            padding: 0 0 0 5px;
        }
        .btn-reg
        {
            float: left;
            border: 0px;
            width: 144px;
            height: 44px;
            line-height: 44px;
            padding: 0;
            text-align: center;
            background: url("images/login/user/btn-reg.png") no-repeat;
            text-align: center;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
        }
        .login
        {
            color: #ff0000;
            text-decoration: none;
        }
        .FormYES, .FormNO, .FormALT
        {
            display: inline-block;
            height: 16px;
            line-height: 16px;
            font-size: 12px;
            margin-left: 5px;
            font-style: normal;
        }
        .FormALT
        {
            background: none;
            color: #909090;
        }
        .FormYES
        {
            background: url("images/form.gif") no-repeat;
            background-position: 0 0px;
            color: #909090;
            padding-left: 25px;
        }
        .FormNO
        {
            background: url("images/form.gif") no-repeat;
            background-position: 0 -31px;
            color: #909090;
            padding-left: 25px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="<%=site.AdminJsPath%>/jqueryuicss/redmond/jquery-ui.css"
        media="screen" />
    <script type="text/javascript">
        var AdminPath = "<%=site.AdminPath %>";
        var WebPath = "<%=site.WebPath %>";
    </script>
    <title>
        <%=Tag("商家注册")%>-<%=site.title%></title>
</head>
<body>
    <div class="nbbox clearfix">
        <div class="user">
            <div class="reg clearfix">
                <div class="mt clearfix">
                    <h2>
                        <%=Tag("商家注册")%></h2>
                </div>
                <div class="mc">
                    <table cellpadding="0" cellspacing="0">
                        
                        <tr>
                            <th>
                                <font color="red">*</font><%=Tag("登录帐号")%>：
                            </th>
                            <td>
                                <input type="text" name="UserName" shop="true" id="UserName" onchange="Check_username();"
                                    style="width: 200px;" maxlength="20" class="input" min="4" maxlength="100" max="100" />
                                <span id="FormUserName" class="FormALT"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <font color="red">*</font><%=Tag("帐号密码")%>：
                            </th>
                            <td>
                                <input type="password" shop="true" name="Password" id="Password" style="width: 200px;"
                                    maxlength="20" class="input" min="6" />
                                <span id="FormPassword" class="FormALT"></span>
                            </td>
                        </tr>
                        
                        <tr>
                            <th>
                                <%=Tag("Email地址")%>：
                            </th>
                            <td>
                                <input type="text" name="Email" id="Email" style="width: 200px;" value="" class="input"
                                    shop="true" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <font color="red">*</font><%=Tag("验证码")%>：
                            </th>
                            <td>
                                <input name="verifycode" type="text" shop="true" id="verifycode" shop="true" size="6"
                                    class="input" />
                                <img class="img_c" align="absmiddle" style="width: 80px; height: 25px;" title="<%=Tag("点击重新获取验证码")%>"
                                    id="img1" src="<%=WebPath%>/code.aspx" language="javascript" onclick="this.src=this.src+'?'">
                                <span id="C_user_vcode"></span>
                            </td>
                        </tr>
                    </table>
                    <table cellpadding="0" cellspacing="0" align="center" style="margin-top: 10px">
                        <tbody>
                            <tr>
                                <th>
                                    &nbsp;
                                </th>
                                <td height="50" style="line-height: 50px">
                                    <a href="javascript:void(0)" onclick="submit();" class="btn-reg"><s></s>
                                        <%=Tag("提交注册")%></a>&nbsp;&nbsp;<%=Tag("已注册？")%>&nbsp;&nbsp;<a href="login.aspx"
                                            class="login"><s></s><%=Tag("在此登录")%>>></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="copy">
                    <%=Lang(SYS.Copyright) %></div>
            </div>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
    $(document).keyup(function (event) {
        if (event.keyCode == 13) {
            submit();
        }
    });
    function submit() {
        if (!CheckForm("shop"))
            return false;
        Check_username();
        var Password = $("#Password").val();
        var Password1 = $("#Password1").val();
        if (Password != Password1) 
        {
            CheckNO("Password1", "<%=Tag("两次输入的密码不一致")%>");
            return false;
        }
        var postData = GetFormJsonData("shop");
        var url = "<%=site.AdminPath%>/ajax/ajax_user.aspx?__Action=User_Reg";
        RequestAjax(url, postData, function (res) { MsgBox(1, "<%=Tag("注册成功，请继续完善资料")%>", "config/profile.aspx") });
    }
    function Check_username() {
        var UserName = $("#UserName").val();
        $.ajax({
            type: 'POST',
            url: "<%=site.AdminPath%>/ajax/ajax_user.aspx?__Action=CheckUserName",
            data: { "UserName": UserName },
            dataType: 'html',
            success: function (data) {
                if (data == "OK"){CheckOK("UserName","<%=Tag("登录帐号可以使用")%>");}else{CheckNO("UserName", "<%=Tag("登录帐号已被注册")%>");return false;}

            }
        });
    }
</script>

  