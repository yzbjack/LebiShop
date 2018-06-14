﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.storeConfig.ServicePanel_Group_Edit_window" validateRequest="false"%>

<table class="table">
    <tr>
        <th style="width: 20%;">
            <%=Tag("部门名称")%>：
        </th>
        <td style="width: 80%;">
            <input type="text" shop="true" min="notnull" id="Name" name="Name" class="input" value="<%=model.Name %>" />
        </td>
    </tr>
    <tr>
        <th style="vertical-align:top">
            <%=Tag("语言")%>：
        </th>
        <td>
            <%= Shop.Bussiness.Language.SiteLanguageCheckbox("Language_ids", model.Language_ids,CurrentLanguage.Code,CurrentAdmin)%>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("排序序号")%>：
        </th>
        <td style="text-align: left;">
            <input type="text" class="input" shop="true" name="Sort" id="Sort" value="<%=model.Sort %>" style="width: 70px;" />
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
        var url = "<%=site.AdminPath %>/ajax/ajax_site.aspx?__Action=ServicePanel_Group_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  