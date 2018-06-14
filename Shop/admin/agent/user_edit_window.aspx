﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.agent.User_Edit_Window" validateRequest="false"%>

    <table class="table">
    <tbody>
    <tr>
        <th style="vertical-align:top">
            <%=Tag("一级佣金")%>：
        </th>
        <td>
            <input onkeyup="value=value.replace(/[^\d\-.]/g,'');" type="text" id="Angent1_Commission"
                name="Angent1_Commission" value="<%=model.Angent1_Commission %>" class="input" style="width: 100px;"
                shop="true" /> <em>% <%=Tag("继承填写")%>-1</em>
        </td>
    </tr>
    <tr>
        <th style="vertical-align:top">
            <%=Tag("二级佣金")%>：
        </th>
        <td>
            <input onkeyup="value=value.replace(/[^\d\-.]/g,'');" type="text" id="Angent2_Commission"
                name="Angent2_Commission" value="<%=model.Angent2_Commission %>" class="input" style="width: 100px;"
                shop="true" /> <em>% <%=Tag("继承填写")%>-1</em>
        </td>
    </tr>
    <tr>
        <th style="vertical-align:top">
            <%=Tag("三级佣金")%>：
        </th>
        <td>
            <input onkeyup="value=value.replace(/[^\d\-.]/g,'');" type="text" id="Angent3_Commission"
                name="Angent3_Commission" value="<%=model.Angent3_Commission %>" class="input" style="width: 100px;"
                shop="true" /> <em>% <%=Tag("继承填写")%>-1</em>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="action">
        <div class="tools tools-m clear">
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
            var url= "<%=site.AdminPath %>/ajax/ajax_agent.aspx?__Action=User_Edit&id=<%=id %>";
            RequestAjax(url,postData,function(res){MsgBox(1, "<%=Tag("操作成功")%>", "?");});
        }
    </script>

  