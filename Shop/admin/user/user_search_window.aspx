﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.user.user_search_widow" validateRequest="false"%>

<table class="table">
    <tr>
        <th style="width: 20%;">
            <%=Tag("会员帐号")%>：
        </th>
        <td>
            <input name="UserName" id="UserName" value="<%=model.UserName %>" shop="true" type="text" class="input" style="width: 200px;" onkeydown="if(event.keyCode==13){SearchUser();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("真实姓名")%>：
        </th>
        <td>
            <input name="RealName" value="<%=model.RealName %>" shop="true" type="text" class="input" style="width: 200px;" onkeydown="if(event.keyCode==13){SearchUser();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("昵称")%>：
        </th>
        <td>
            <input name="NickName" value="<%=model.NickName %>" shop="true" type="text" class="input" style="width: 200px;" onkeydown="if(event.keyCode==13){SearchUser();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("性别")%>：
        </th>
        <td>
            <label><input type="checkbox" name="Sex" shop="true" value="<%=Tag("男")%>" <%=model.Sex.Contains("男")?"checked":"" %> /><%=Tag("男")%></label>
            <label><input type="checkbox" name="Sex" shop="true" value="<%=Tag("女")%>" <%=model.Sex.Contains("女")?"checked":"" %> /><%=Tag("女")%></label>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("生日")%>：
        </th>
        <td>
            <input name="Birthday1" id="Birthday1" shop="true" type="text" class="input-calendar" style="width: 120px;" value="<%=model.Birthday1 %>"/>
            -
            <input name="Birthday2" id="Birthday2" shop="true" type="text" class="input-calendar" style="width: 120px;" value="<%=model.Birthday2 %>"/>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("注册日期")%>：
        </th>
        <td>
            <input name="Time_reg1" id="Time_reg1" shop="true" type="text" class="input-calendar" style="width: 120px;" value="<%=model.Time_reg1 %>"/>
            -
            <input name="Time_reg2" id="Time_reg2" shop="true" type="text" class="input-calendar" style="width: 120px;" value="<%=model.Time_reg2 %>"/>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("最后登录")%>：
        </th>
        <td>
            <input name="Time_login1" id="Time_login1" shop="true" type="text" class="input-calendar" style="width: 120px;" value="<%=model.Time_login1 %>"/>
            -
            <input name="Time_login2" id="Time_login2" shop="true" type="text" class="input-calendar" style="width: 120px;" value="<%=model.Time_login2 %>"/>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("手机号码")%>：
        </th>
        <td>
            <input name="MobilePhone" value="<%=model.MobilePhone %>" shop="true" type="text" class="input" style="width: 200px;" onkeydown="if(event.keyCode==13){SearchUser();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("电话号码")%>：
        </th>
        <td>
            <input name="Phone" value="<%=model.Phone %>" shop="true" type="text" class="input" style="width: 200px;" onkeydown="if(event.keyCode==13){SearchUser();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("传真号码")%>：
        </th>
        <td>
            <input name="Fax" value="<%=model.Fax %>" shop="true" type="text" class="input" style="width: 200px;" onkeydown="if(event.keyCode==13){SearchUser();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("QQ号码")%>：
        </th>
        <td>
            <input name="QQ" value="<%=model.QQ %>" shop="true" type="text" class="input" style="width: 200px;" onkeydown="if(event.keyCode==13){SearchUser();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("Email地址")%>：
        </th>
        <td>
            <input name="Email" value="<%=model.Email %>" shop="true" type="text" class="input" style="width: 200px;" onkeydown="if(event.keyCode==13){SearchUser();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("会员分组")%>：
        </th>
        <td>
            <%=Shop.Bussiness.EX_User.TypeCheckbox("grade > 0", "UserLevel_id", model.UserLevel_id,"shop=\"true\"", CurrentLanguage.Code)%>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("账户余额")%>：
        </th>
        <td>
            <input name="Money1" shop="true" type="text" class="input" style="width: 70px;" onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Money1 %>" onkeydown="if(event.keyCode==13){SearchUser();}" />
            -
            <input name="Money2" shop="true" type="text" class="input" style="width: 70px;" onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Money2 %>" onkeydown="if(event.keyCode==13){SearchUser();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("消费金额")%>：
        </th>
        <td>
            <input name="Money_xiaofei1" shop="true" type="text" class="input" style="width: 70px;" onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Money_xiaofei1 %>" onkeydown="if(event.keyCode==13){SearchUser();}" />
            -
            <input name="Money_xiaofei2" shop="true" type="text" class="input" style="width: 70px;" onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Money_xiaofei2 %>" onkeydown="if(event.keyCode==13){SearchUser();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("积分")%>：
        </th>
        <td>
            <input name="Point1" shop="true" type="text" class="input" style="width: 70px;" onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Point1 %>" onkeydown="if(event.keyCode==13){SearchUser();}" />
            -
            <input name="Point2" shop="true" type="text" class="input" style="width: 70px;" onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Point2 %>" onkeydown="if(event.keyCode==13){SearchUser();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("登录次数")%>：
        </th>
        <td>
            <input name="Logins1" shop="true" type="text" class="input" style="width: 70px;" onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Logins1 %>" onkeydown="if(event.keyCode==13){SearchUser();}" />
            -
            <input name="Logins2" shop="true" type="text" class="input" style="width: 70px;" onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Logins2 %>" onkeydown="if(event.keyCode==13){SearchUser();}" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("语言")%>：
        </th>
        <td>
            <%=Shop.Bussiness.Language.LanguageCheckbox("Language",model.Language)%>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m clear">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="SearchUser();"><b></b><span><%=Tag("提交")%></span></a></li>
                </ul>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
    $(function () {
        $(".calendar,.input-calendar").datepicker({dateFormat:"yy-mm-dd"});
    });
    function SearchUser()
    {
        var postData = GetFormJsonData("shop");
        var url = "<%=site.AdminPath %>/ajax/ajax_search.aspx?__Action=UserSearch";
        $.ajax({
            type: "POST",
            url: url,
            data: postData,
            dataType: 'json',
            success: function (res) {
                <%=callback %>(res.url);
            }
        });
    }
</script>

  