﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.theme.Page_Edit_window" validateRequest="false"%>

<table class="table">
    <tr>
            <th style="width:20%">
                <%=Tag("名称")%>：
            </th>
            <td>
                <input type="text" id="Name" name="Name" class="input" shop="true"  style="width: 350px;" value="<%=model.Name %>" />
            </td>
        </tr>
    <tr>
        <th style="width:20%">
            <%=Tag("代码")%>：
        </th>
        <td>
            <input type="text" id="Code" name="Code" class="input" shop="true" min="notnull" style="width: 200px;"
                value="<%=model.Code %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("发布类型")%>：
        </th>
        <td>
            <%=TypeRadio("PublishType", "Type_id_PublishType", model.Type_id_PublishType, "shop=\"true\"",CurrentLanguage.Code)%>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("页面名称")%>：
        </th>
        <td>
            <input type="text" id="PageName" name="PageName" shop="true" class="input" style="width: 200px;" value="<%=model.PageName %>" />
        </td>
    </tr>
    <%if (model.IsCustom == 1)
      { %>
    <tr>
        <th>
            <%=Tag("页面参数")%>：
        </th>
        <td>
        <em><%=para%></em>
            <input type="text" id="PageParameter" name="PageParameter" shop="true" class="input" style="width: 300px;"
                value="<%=model.PageParameter %>" />

            
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("静态地址")%>：
        </th>
        <td>
            <input type="text" id="StaticPageName" name="StaticPageName" shop="true" class="input" style="width: 300px;"
                value="<%=model.StaticPageName %>" />
        </td>
    </tr>
    <%} %>
    <%if (model.IsAllowHtml == 1)
      { %>
    <tr>
        <th>
            <%=Tag("静态路径")%>：
        </th>
        <td>
            <input type="text" id="StaticPath" name="StaticPath" shop="true" class="input" style="width: 200px;"
                value="<%=model.StaticPath %>" />
        </td>
    </tr>
    <%} %>
    <tr>
        <th>
            <%=Tag("排序序号")%>：
        </th>
        <td>
            <input type="text" id="Sort" name="Sort" style="width: 50px" shop="true" class="input"
                value="<%=model.Sort %>" onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                maxlength="4" />
        </td>
    </tr>
    <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m clear">
                <ul>
                    <li class="add"><a href="javascript:void(0);" onclick="SaveObj();"><b></b><span><%=Tag("保存")%></span></a></li>
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
        var url = "<%=site.AdminPath %>/ajax/ajax_theme.aspx?__Action=ThemePage_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  