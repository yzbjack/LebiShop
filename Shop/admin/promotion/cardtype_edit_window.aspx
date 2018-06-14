﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.Config.CardType_Edit_window" validateRequest="false"%>

<script type="text/javascript" src="<%=site.AdminJsPath %>/multiselect/js/jquery.multiselect2side.js"></script>
<link rel="stylesheet" href="<%=site.AdminJsPath %>/multiselect/css/jquery.multiselect2side.css"
    type="text/css" media="screen" />
<%=Shop.Bussiness.Language.AdminLanguageTab("") %>
<table class="table">
    <%foreach (Shop.Model.Lebi_Language_Code lang in Shop.Bussiness.Language.Languages())
      {%>
    <tbody id="lang_<%=lang.Code %>" class="lang_table" width="100%" style="display: none">
        <tr>
            <th style="width: 20%;">
                <%=Tag("名称")%>：
            </th>
            <td style="width: 80%;">
                <input type="text" shop="true"  id="Name<%=lang.Code %>" name="Name<%=lang.Code %>" class="input" style="width:200px" value="<%=Shop.Bussiness.Language.Content(model.Name,lang.Code) %>" />
            </td>
        </tr>
    </tbody>
    <%} %>
    </table>
    <ul id="tablistmain"><li class="selected"><a><span><%=Tag("通用信息")%></span></a></li></ul>
    <table class="table">
    <tr>
        <th style="width: 20%;">
            <%=Tag("类型")%>：
        </th>
        <td>
            <%=Shop.Bussiness.EX_Type.TypeRadio("CardType", "Type_id_CardType", model.Type_id_CardType, "shop=\"true\" onclick=\"ChangeType();\"")%>
        </td>
    </tr>
    <tr>
        <th style="width: 20%;">
            <%=Tag("面值")%>：
        </th>
        <td style="text-align: left;">
            <input type="text" class="input" shop="true" min="notnull" name="Money" id="Money" value="<%=model.Money %>" onkeyup="value=value.replace(/[^\d\.]/g,'')" style="width: 70px;" />
        </td>
    </tr>
    <tr id="tr_Money_Buy">
        <th style="width: 20%;">
            <%=Tag("最低消费")%>：
        </th>
        <td style="text-align: left;">
            <input type="text" class="input" shop="true" min="notnull" name="Money_Buy" id="Money_Buy" value="<%=model.Money_Buy %>" onkeyup="value=value.replace(/[^\d\.]/g,'')" style="width: 70px;" />
        </td>
    </tr>
    <tr id="tr_IsCanOtherUse">
        <th>
            <%=Tag("单独使用")%>：
        </th>
        <td>
            <input type="radio" name="IsCanOtherUse" value="0" shop="true" <%=model.IsCanOtherUse==0?"checked":"" %> /><%=Tag("是")%>
            <input type="radio" name="IsCanOtherUse" value="1" shop="true" <%=model.IsCanOtherUse==1?"checked":"" %> /><%=Tag("否")%>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("头字符")%>：
        </th>
        <td style="text-align: left;">
            <input type="text" class="input" shop="true" min="notnull" name="IndexCode" id="IndexCode" value="<%=model.IndexCode %>" style="width: 70px;" />
        </td>
    </tr>
    <tr id="tr_Pro_Type_ids">
        <th>
            <%=Tag("限制分类")%>：
        </th>
        <td style="text-align: left;">
            <%=protypes(model.Pro_Type_ids)%>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("号码段")%>：
        </th>
        <td style="text-align: left;">
            <input type="text" class="input" shop="true" min="notnull" name="NO_Start" id="NO_Start" value="<%=model.NO_Start %>" onkeyup="value=value.replace(/[^\d]/g,'')" style="width: 90px;" />
           - <input type="text" class="input" shop="true" min="notnull" name="NO_End" id="NO_End" value="<%=model.NO_End %>" onkeyup="value=value.replace(/[^\d]/g,'')" style="width: 90px;" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("有效期")%>：
        </th>
        <td style="text-align: left;">
            <input type="text" class="input" shop="true" min="notnull" name="Time_Begin" id="Time_Begin" value="<%=FormatDate(model.Time_Begin) %>" style="width: 200px;" />
           - <input type="text" class="input" shop="true" min="notnull" name="Time_End" id="Time_End" value="<%=FormatDate(model.Time_End) %>" style="width: 200px;" />
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
    <tr>
        <th>
            <%=Tag("申请链接")%>：
        </th>
        <td style="text-align: left;">
            <%=Shop.Bussiness.ThemeUrl.GetURL("P_UserCardGet",model.id.ToString(),"",CurrentLanguage.Code)%>
        </td>
    </tr>
</table>
<script type="text/javascript">
    LanguageTab_EditPage('<%=CurrentLanguage.Code %>'); //加载默认语言
    function SaveObj() {
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span"))
            return false;
        var url = "<%=site.AdminPath %>/ajax/ajax_sale.aspx?__Action=CardType_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
    function ChangeType()
    {
        var t=$("input[name='Type_id_CardType']:checked").val();
        if(t==311)
        {
            $("#tr_Money_Buy").hide();
            $("#tr_IsCanOtherUse").hide();
            $("#tr_Pro_Type_ids").hide();
        }else{
            $("#tr_Money_Buy").show();
            $("#tr_IsCanOtherUse").show();
            $("#tr_Pro_Type_ids").show();
        }
    }
    ChangeType();
</script>

  