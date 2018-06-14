﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.cms.customnode_edit_window" validateRequest="false"%>

<%if (Topnode.IsLanguages == 1)
  { %>
<%=Shop.Bussiness.Language.AdminLanguageTab("") %>
<table
    class="table">
    <%foreach (Shop.Model.Lebi_Language_Code lang in Shop.Bussiness.Language.Languages())
      {%>
    <tbody id="lang_<%=lang.Code %>" class="lang_table" style="display: none">
        <tr>
            <th style="width: 20%">
                <%=Tag("名称")%>：
            </th>
            <td>
                <input type="text" id="Name<%=lang.Code %>" name="Name<%=lang.Code %>" class="input"
                    shop="true"  style="width: 200px;"
                    value="<%=Shop.Bussiness.Language.Content(model.Name,lang.Code) %>" />
            </td>
        </tr>

    </tbody>
    <%} %>
</table>
<%} %>
<table class="table">
   <%if (Topnode.IsLanguages == 0)
     { %>
    <tr>
        <th style="width: 15%">
            <%=Tag("名称")%>：
        </th>
        <td>
            <input type="text" id="Name" name="Name" class="input" shop="true" min="notnull"
                style="width: 200px;" value="<%=model.Name %>" />
        </td>
    </tr>
    <%} %>
    <tr>
        <th style="width: 15%">
            <%=Tag("上级结点")%>：
        </th>
        <td>
            <select name="parentid" id="parentid" shop="true">
                <option value="<%=Topnode.id%>"><%=Topnode.Name%></option>
                <%if (Topnode.haveson == 1)
                  { %>
                <%=GetOptionTreeString(0, Topnode.id, PNode.id)%>
                <%} %>
            </select>
            <span id="C_txt_tdname"></span>
        </td>
    </tr>
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
                    <li class="submit"><a href="javascript:void(0);" onclick="SaveObj();"><b></b><span>
                        <%=Tag("保存")%></span></a></li>
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
        var url = "<%=site.AdminPath %>/ajax/ajax_node.aspx?__Action=CustomNode_Edit&id=<%=model.id %>&parentcode=<%=Topnode.Code %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  