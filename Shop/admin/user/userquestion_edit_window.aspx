﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.user.userquestion_edit_window" validateRequest="false"%>

<table class="table">
<%if (recordCount == 0){ %>
    <tr>
        <th style="width: 25%;">
            <%=Tag("问题")%>：
        </th>
        <td>
            <select name="Question_id1" id="Question_id1" shop="true">
            <%foreach (Shop.Model.Lebi_User_Question model in user_questions)
            {%>
            <option value="<%=model.id %>"><%=Lang(model.Name)%></option>
            <%} %>
			</select>
        </td>
    </tr>
    <tr>
        <th >
            <%=Tag("答案")%>：
        </th>
        <td>
            <input type="text" id="Answer1" name="Answer1" size="30" class="input" value="" min="notnull" shop="true" />
        </td>
    </tr>
    <tr>
        <th style="width: 25%;">
            <%=Tag("问题")%>：
        </th>
        <td>
            <select name="Question_id2" id="Question_id2" shop="true">
            <%foreach (Shop.Model.Lebi_User_Question model in user_questions)
            {%>
            <option value="<%=model.id %>"><%=Lang(model.Name)%></option>
            <%} %>
			</select>
        </td>
    </tr>
    <tr>
        <th >
            <%=Tag("答案")%>：
        </th>
        <td>
            <input type="text" id="Answer2" name="Answer2" size="30" class="input" value="" min="notnull" shop="true" />
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
    <%}else{ %>
    <%foreach (Shop.Model.Lebi_User_Answer model in user_answers){%>
    <tr>
        <th style="width: 25%;">
            <%=Tag("问题")%>：
        </th>
        <td>
            <%=QuestionName(model.User_Question_id) %>
        </td>
    </tr>
    <tr>
        <th >
            <%=Tag("答案")%>：
        </th>
        <td>
            ******
        </td>
    </tr>
    <%} %>
    <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="Delete();"><b></b><span><%=Tag("重置")%></span></a></li>
                </ul>
            </div>
        </td>
    </tr>
    <%} %>
</table>
<script type="text/javascript">
    function SaveObj() {
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span"))
            return false;
        var url = "<%=site.AdminPath %>/Ajax/ajax_user.aspx?__Action=Question_Edit&id=<%=id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "")});
    }
    function Delete() {
        if (!confirm("<%=Tag("确认要删除吗？")%>"))
            return false;
        var url = "<%=site.AdminPath %>/Ajax/ajax_user.aspx?__Action=Question_Del&id=<%=id %>";
        RequestAjax(url,"",function(){MsgBox(1, "<%=Tag("操作成功")%>", "")});
    }
</script>

  