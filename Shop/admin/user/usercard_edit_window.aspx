﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.user.usercard_edit_window" validateRequest="false"%>

<table class="table">
    <%if (mode == "scope")
      { %>
    <tr>
        <th style="width: 20%;">
            <%=Tag("发放范围")%>：
        </th>
        <td>
            <%=su.Description == "" ? Tag("全部") : su.Description%>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("发放数量")%>：
        </th>
        <td>
            <%=Shop.Bussiness.B_Lebi_User.Counts("id>0 "+su.SQL)%>
        </td>
    </tr>
    <%}
      else
      { %>
    <tr id="showuser">
        <th valign="top" style="width: 20%;">
            <%=Tag("会员账号")%>：
        </th>
        <td>
        <%if (user_ids != "")
          { %>
        <div class="proBox" id="proBox" style="width: 400px;overflow:hidden">
            <ul class="btns clear">
                <li class="delete" id="delInsurance" onclick="delitem();" style="margin-left:5px"><%=Tag("删除")%></li>
                <li class="clean" id="clearInsurance" onclick="remove();"><%=Tag("清空")%></li>
            </ul>
			<div id="User_idsList" class="iTabBox" style="max-height: 75px;height:75px;_height: 75px;"><ul class="iTab"></ul></div>
        </div>
        <%foreach (Shop.Model.Lebi_User u in users)
          { %>
        <script type="text/javascript">
            var temp = '<li ondblclick="delitem();" title="<%=Tag("双击删除") %>" class="iName"><input type="hidden" name="User_ids" id="User_ids" value="<%=u.id %>" shop="true" /><input type="hidden" name="UserName_ids" id="UserName_ids" value="<%=u.UserName %>" shop="true" /><span><%=u.UserName %></span></li>';
            $('#User_idsList ul').append(temp);
            $('#User_idsList ul li').selectedElement({ css: 'on' });
            $("#User_Name_To").attr("min", "");
        </script>
        <%}
          }%>
       
        <input type="text" id="User_Name_To" name="User_Name_To" class="input" shop="true" min="notnull" style="width: 200px;<%if (user_ids != ""){ %>display:none<%}%>" value="<%=User_Name %>" />
        
        </td>
    </tr>
    <%} %>
    <tr>
        <th>
            <%=Tag("批次")%>：
        </th>
        <td style="text-align: left;">
            <select id="orderid" name="orderid" shop="true">
                <%foreach (Shop.Model.Lebi_CardOrder co in cos)
                  { %>
                  <option value="<%=co.id %>">
                  <%=Lang(co.Name)%>
                  <%=co.IndexCode %> - <%=Tag("面值") %>:<%=co.Money %>
                  <%=Tag("数量") %>:<%=count_card(co.id)%>
                  <%=Tag("剩余") %>:<%=count_card_no(co.id)%>
                  </option>
                <%} %>
            </select>
        </td>
    </tr>

    <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m clear">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="SaveObj();"><b></b><span><%=Tag("提交")%></span></a></li>
                </ul>
            </div>
            <input type="hidden" name="cardtype" value="<%=cardtype%>" shop=true" />
            <input type="hidden" name="mode" value="<%=mode%>" shop=true" />
        </td>
    </tr>
</table>
<script type="text/javascript">

    function delitem() {
        $("#User_idsList ul li[selectedElement]").remove();
        if ($("#User_idsList ul li").length == 0)
        {
            $("#User_Name_To").show();
            $("#User_Name_To").attr("min","notnull");
            $("#proBox").hide();
        }
    }
    function remove() {
        $("#User_idsList ul li").remove();
        $("#User_Name_To").show();
        $("#User_Name_To").attr("min","notnull");
        $("#proBox").hide();
    }
    function SaveObj() {
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span"))
            return false;
        var url = "<%=site.AdminPath %>/ajax/ajax_user.aspx?__Action=SendCard&<%=su.URL %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", '?')});
    }
</script>

  