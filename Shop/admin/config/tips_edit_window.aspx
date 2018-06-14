﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.storeConfig.Tips_Edit_window" validateRequest="false"%>

<%=Shop.Bussiness.Language.AdminLanguageTab("") %>
<table class="table">
    <%foreach (Shop.Model.Lebi_Language_Code lang in Shop.Bussiness.Language.Languages())
      {%>
    <tbody id="lang_<%=lang.Code %>" class="lang_table" width="100%" style="display: none">
    <tr>
        <th style="vertical-align:top">
            <%=Tag("内容")%>：
        </th>
        <td>
            <textarea name="Content<%=lang.Code %>" id="Content<%=lang.Code %>" class="input" shop="true" style="width: 300px;height: 60px;"><%=Shop.Bussiness.Language.Content(model.Content,lang.Code) %></textarea>
            <div class="tools clear">
                <ul>
                    <li class="plus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Content',100);"><b></b><span><%=Tag("展开")%></span></a></li>
                    <li class="minus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Content',-100)"><b></b><span><%=Tag("收缩")%></span></a></li>
                </ul>
            </div>
        </td>
    </tr>
</tbody>
<%} %>
</table>
<table class="table">
    <tr>
        <th>
            <%=Tag("日期")%>：
        </th>
        <td>
            <input type="text" shop="true" name="Time_Update" value="<%=FormatDate(model.Time_Update) %>"id="Time_Update" class="input-calendar" style="width: 200px" />
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
    LanguageTab_EditPage('<%=CurrentLanguage.Code %>'); //加载默认语言
    function SaveObj() {
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span"))
            return false;
        var url = "<%=site.AdminPath %>/ajax/ajax_site.aspx?__Action=Tips_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  