﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.user.userpassword_edit_window" validateRequest="false"%>

<table class="table">
    <tr>
        <th style="width: 25%;">
            <%=Tag("会员帐号")%>：
        </th>
        <td>
            <%=model.UserName %>
        </td>
    </tr>
    <tr>
        <th >
            <%=Tag("新密码")%>：
        </th>
        <td>
            <input type="password" shop="true" min="notnull" id="PWD1" name="PWD1"
                class="input" value="" style="width:200px" />
        </td>
    </tr>
    <tr>
        <th >
            <%=Tag("再次输入")%>：
        </th>
        <td>
            <input type="password" shop="true" min="notnull" id="PWD2" name="PWD2"
                class="input" value="" style="width:200px" />
        </td>
    </tr>
    <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="SaveObj();"><b></b><span><%=Tag("保存")%></span></a></li>
                </ul>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function SaveObj() {
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span"))
            return false;
        var url = "<%=site.AdminPath %>/Ajax/ajax_user.aspx?__Action=User_Edit_Password&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  