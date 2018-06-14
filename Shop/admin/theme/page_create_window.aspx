﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.theme.page_create_window" validateRequest="false"%>

<script type="text/javascript" src="<%=site.AdminJsPath %>/multiselect/js/jquery.multiselect2side.js"></script>
<link rel="stylesheet" href="<%=site.AdminJsPath %>/multiselect/css/jquery.multiselect2side.css" type="text/css" media="screen" />
<table class="table">
    
    <tr>
        <th style="width:20%">
            <%=Tag("页面")%>：
        </th>
        <td>
            [<%=model.Code%>]<%=Lang(model.Name) %>
        </td>
    </tr>
    <%if(showlanguage){ %>
    <tr>
        <th style="width:20%">
            <%=Tag("语言")%>：
        </th>
        <td>
            <%=GetLanguage()%>
        </td>
    </tr>
    <%} %>

    <%=Select%>
    <tr>
        <th >
            <%=Tag("进度")%>：
        </th>
        <td>
            <div style="width:100%;border:1px solid #cccccc;" id="progressbar">
                <div id="progress" style="background:#cccccc;height:10px;width:0%;" >
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <td class="action" colspan="2">
            <div class="tools tools-m clear">
                <ul>
                     <li class="add"><a href="javascript:void(0);" onclick="GreateHtml();"><b></b><span><%=Tag("生成")%></span></a></li>
                     <li id="pagemsg" style="display:none;"><%=Tag("正在处理")%>...</li>
                </ul>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
    var pageindex=1;
    var pagesize = 10;
    var progressvalue = 1;
    var progress;
    function GreateHtml() {
        var postData = GetFormJsonData("shop");
        var url = "<%=site.AdminPath %>/ajax/ajax_html.aspx?__Action=CreatePage&id=<%=model.id %>&pageindex=" + pageindex + "&pagesize=" + pagesize;
        $("#progressbar").show();
        $.ajax({
            type: "POST",
            url: url,
            data: postData,
            dataType: 'json',
            beforeSend: function () {
                //MsgBox(4, "<%=Tag("正在处理") %> ……", "-");
                $("#pagemsg").show();
            },
            success: function (res) {
                if (res.msg == "OK") {
                    progressvalue = res.per;
                    pageindex = pageindex + 1;
                    $("#progress").css("width", progressvalue + "%");
                    if (res.per < 100)
                        GreateHtml();
                    else
                        MsgBox(1, '<%=Tag("操作成功") %>', "");

                }
                else {
                    MsgBox(2, res.msg, "");
                    return false;
                }
            }
        });
    }
    $().ready(function () {
        $('.mutiselect').multiselect2side({
            selectedPosition: 'right',
            moveOptions: false,
            //search: "<img src='img/search.gif' align=\"absmiddle\" /> ",
            labelsx: '',
            labeldx: '',
            autoSort: false,
            autoSortAvailable: false
        });


    }); 
</script>

  