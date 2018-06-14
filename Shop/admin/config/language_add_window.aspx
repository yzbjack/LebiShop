﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.storeConfig.language_add_window" validateRequest="false"%>

<table class="table">
    <tr>
        <th style="width: 20%">
            <%=Tag("语言")%>：
        </th>
        <td>
           <select id="languagecode">
                <%foreach (Shop.Model.Lebi_Language_Code code in langs)
                  {%>
                  <option value="<%=code.Code %>"><%=code.Name %></option>
                <%} %>
           </select>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="AddObj();"><b></b><span><%=Tag("保存")%></span></a></li>
                </ul>
            </div>
            
        </td>
    </tr>
</table>
<script type="text/javascript">
    
    function AddObj() {
        var postData = {"languagecode":$('#languagecode').val()};
        var url = "<%=site.AdminPath %>/ajax/ajax_site.aspx?__Action=SiteLanguage_Add&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?id=<%=model.id %>&tab=language")});
    }
</script>

  