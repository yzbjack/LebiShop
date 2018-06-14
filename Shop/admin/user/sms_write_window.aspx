﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.User.SMS_Write_window" validateRequest="false"%>

<table class="table">
        <tr>
            <th style="vertical-align:top">
                <%=Tag("内容")%>：
            </th>
            <td>
                <textarea id="Content" name="Content" sms="true" min="notnull" cols="80" rows="5" class="textarea" style="height: 60px; width: 400px;"></textarea>
                <div class="tools clear">
                    <ul>
                        <li class="plus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Content',100);"><b></b><span><%=Tag("展开")%></span></a></li>
                        <li class="minus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Content',-100)"><b></b><span><%=Tag("收缩")%></span></a></li>
                    </ul>
                </div>
            </td>
        </tr>
        <%if (ids == "" && User_Name == "")
          { %>
        <tr>
            <th style="width: 20%;">
                <%=Tag("发送范围")%>：
            </th>
            <td>
                <%=su.Description == "" ? Tag("全部") : su.Description%> <input type="checkbox" name="custom" id="custom" value="1" sms="true" onclick="removeall(1);" /><%=Tag("自定义")%>
            </td>
        </tr>
        <%}
          else
          { %>
        <tr id="showuser">
            <th style="vertical-align:top">
                <span id="typename"><%=Tag("会员账号")%></span>：
            </th>
            <td>
                <%if (ids != "")
                  { %>
                <div class="proBox" id="proBox" style="width: 400px; overflow: hidden">
                    <ul class="btns clear">
                        <li class="delete" id="delInsurance" onclick="delitem();" style="margin-left: 5px">
                            <%=Tag("删除")%></li>
                        <li class="clean" id="clearInsurance" onclick="removeall(0);">
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
                    var temp = '<li ondblclick="delitem();" title="<%=Tag("双击删除") %>" class="iName"><input type="hidden" name="User_ids" id="User_ids" value="<%=u.id %>" sms="true" /><input type="hidden" name="UserName_ids" id="UserName_ids" value="<%=u.UserName %>" sms="true" /><span><%=u.UserName %></span></li>';
                    $('#User_idsList ul').append(temp);
                    $('#User_idsList ul li').selectedElement({ css: 'on' });
                    $("#User_Name_To").attr("min", "");
                </script>
                <%}
                  }%>
            </td>
        </tr>
        <%} %>
        <tr id="PhoneNoList" style="display:none">
            <th style="vertical-align:top">
                <span id="Span1"><%=Tag("手机号码")%></span>：
            </th>
            <td>
                <textarea id="PhoneNo" name="PhoneNo" sms="true" cols="80" rows="5" class="textarea" style="height: 60px; width: 400px;"></textarea>
                <div class="tools clear">
                    <ul>
                        <li class="plus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('PhoneNo',100);"><b></b><span><%=Tag("展开")%></span></a></li>
                        <li class="minus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('PhoneNo',-100)"><b></b><span><%=Tag("收缩")%></span></a></li>
                    </ul>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="action">
                <div class="tools tools-m clear">
                    <ul>
                        <li class="submit"><a href="javascript:void(0);" onclick="SendSMS();"><b></b><span>
                            <%=Tag("提交")%></span></a></li>
                    </ul>
                </div>
            </td>
        </tr>
    </tbody>
</table>
<script type="text/javascript">
    function UType(n){
	    if (n==0){
            $("#PhoneNo").attr("min","notnull");
		    $("#showuser").show();
            $("#showuserlevel").hide();
	    }else if (n==1){
            $("#PhoneNo").attr("min","");
		    $("#showuser").hide();
            $("#showuserlevel").show();
	    }
    }
    function delitem() {
        $("#User_idsList ul li[selectedElement]").remove();
        if ($("#User_idsList ul li").length == 0)
        {
            $("#PhoneNoList").show();
            $("#PhoneNo").attr("min","notnull");
            $("#proBox").hide();
        }
    }
    function removeall(type) {
        if (type == 0){
            $("#User_idsList ul li").remove();
            $("#showuser").hide();
            $("#PhoneNoList").show();
            $("#PhoneNo").attr("min","notnull");
        }else{
            var flag=$("#custom").is(":checked");
            if(!flag){
                $("#PhoneNoList").hide();
                $("#PhoneNo").attr("min","");
                $("#PhoneNo").html("");
            }else{
                $("#PhoneNoList").show();
                $("#PhoneNo").attr("min","notnull");
            }
        }
        $("#proBox").hide();
    }
    function SendSMS() {
        var postData = GetFormJsonData("sms");
        if (!CheckForm("sms", "span"))
            return false;
        var url = "<%=site.AdminPath %>/ajax/ajax_user.aspx?__Action=SMS_Write&<%=su.URL %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "")});
    }
</script>

  