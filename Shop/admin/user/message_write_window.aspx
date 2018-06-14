﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.User.Message_Write_window" validateRequest="false"%>

<%=Shop.Bussiness.Language.AdminLanguageTab("") %>
<table class="table">
    <%foreach (Shop.Model.Lebi_Language_Code lang in Shop.Bussiness.Language.Languages())
      {%>
    <tbody id="lang_<%=lang.Code %>" class="lang_table" width="100%" style="display: none">
        <tr>
            <th style="width: 20%;">
                <%=Tag("标题")%>：
            </th>
            <td style="width: 80%;">
                <input type="text" shop="true" <%if (lang.Code == CurrentLanguage.Code){ %>min="notnull"
                    <%} %> id="Title<%=lang.Code %>" name="Title<%=lang.Code %>" class="input" style="width: 400px" />
            </td>
        </tr>
        <tr>
            <th style="vertical-align:top">
                <%=Tag("内容")%>：
            </th>
            <td>
                <textarea shop="true" <%if (lang.Code == CurrentLanguage.Code){ %>min="notnull" <%} %>
                    class="textarea" style="width: 400px; height: 60px;" id="Content<%=lang.Code %>"
                    name="Content<%=lang.Code %>"></textarea>
                <div class="tools clear">
                    <ul>
                        <li class="plus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Content<%=lang.Code %>',100);">
                            <b></b><span>
                                <%=Tag("展开")%></span></a></li>
                        <li class="minus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Content<%=lang.Code %>',-100)">
                            <b></b><span>
                                <%=Tag("收缩")%></span></a></li>
                    </ul>
                </div>
            </td>
        </tr>
    </tbody>
    <%} %>
</table>
<ul id="tablistmain">
    <li class="selected"><a><span>
        <%=Tag("通用信息")%></span></a></li></ul>
<table
    id="common" class="table">
    <tbody>
        <%if (ids == "" && User_Name == "")
          { %>
        <tr>
            <th style="width: 20%;">
                <%=Tag("发送范围")%>：
            </th>
            <td>
                <%=su.Description == "" ? Tag("全部") : su.Description%>
            </td>
        </tr>
        <%}
          else
          { %>
        <tr id="showuser">
            <th style="vertical-align:top">
                <%=Tag("会员账号")%>：
            </th>
            <td>
                <%if (ids != "")
                  { %>
                <div class="proBox" id="proBox" style="width: 400px; overflow: hidden">
                    <ul class="btns clear">
                        <li class="delete" id="delInsurance" onclick="delitem();" style="margin-left: 5px">
                            <%=Tag("删除")%></li>
                        <li class="clean" id="clearInsurance" onclick="removeall();">
                            <%=Tag("清空")%></li>
                    </ul>
                    <div id="User_idsList" class="iTabBox" style="max-height: 75px; height: 75px; _height: 75px;">
                        <ul class="iTab">
                        </ul>
                    </div>
                </div>
                <%foreach (Shop.Model.Lebi_User u in user)
                  { %>
                <script type="text/javascript">
                    var temp = '<li ondblclick="delitem();" title="<%=Tag("双击删除") %>" class="iName"><input type="hidden" name="User_ids" id="User_ids" value="<%=u.id %>" shop="true" /><input type="hidden" name="UserName_ids" id="UserName_ids" value="<%=u.UserName %>" shop="true" /><span><%=u.UserName %></span></li>';
                    $('#User_idsList ul').append(temp);
                    $('#User_idsList ul li').selectedElement({ css: 'on' });
                    $("#User_Name_To").attr("min", "");
                </script>
                <%}
                  }%>
                <input type="text" id="User_Name_To" name="User_Name_To" class="input" shop="true"
                    min="notnull" style="width: 200px; <%if (ids != ""){ %>display: none<%}%>" value="<%=User_Name %>" />
            </td>
        </tr>
        <%} %>
        <tr>
            <th style="width: 20%;">
                <%=Tag("类别")%>：
            </th>
            <td>
                <select id="type_id" name="type_id" shop="true">
                    <option value="">┌
                        <%=Tag("类别") %></option>
                    <%=Shop.Bussiness.Message.Message_TypeOption(350,"0", CurrentLanguage.Code)%>
                    <option value="0">
                        <%=Tag("系统消息") %></option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="action">
                <div class="tools tools-m clear">
                    <ul>
                        <li class="submit"><a href="javascript:void(0);" onclick="SendMSG();"><b></b><span>
                            <%=Tag("提交")%></span></a></li>
                    </ul>
                </div>
            </td>
        </tr>
    </tbody>
</table>
<script type="text/javascript">
    LanguageTab_EditPage('<%=CurrentLanguage.Code %>'); //加载默认语言
    function UType(n){
	    if (n==0){
            $("#User_Name_To").attr("min","notnull");
		    $("#showuser").show();
            $("#showuserlevel").hide();
	    }else if (n==1){
            $("#User_Name_To").attr("min","");
		    $("#showuser").hide();
            $("#showuserlevel").show();
	    }
    }
    function delitem() {
        $("#User_idsList ul li[selectedElement]").remove();
        if ($("#User_idsList ul li").length == 0)
        {
            $("#User_Name_To").show();
            $("#User_Name_To").attr("min","notnull");
            $("#proBox").hide();
        }
    }
    function removeall() {
        $("#User_idsList ul li").remove();
        $("#User_Name_To").show();
        $("#User_Name_To").attr("min","notnull");
        $("#proBox").hide();
    }
    function SendMSG() {
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span"))
            return false;
        var url = "<%=site.AdminPath %>/ajax/ajax_user.aspx?__Action=Message_Write&<%=su.URL %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "")});
    }
</script>

  