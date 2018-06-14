﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.product.Brand_Edit_window" validateRequest="false"%>

<%=Shop.Bussiness.Language.AdminLanguageTab("") %>
<table class="table">
    <%foreach (Shop.Model.Lebi_Language_Code lang in Shop.Bussiness.Language.Languages())
      {%>
    <tbody id="lang_<%=lang.Code %>" class="lang_table" style="display: none">
        <tr>
            <th style="width: 20%">
                <%=Tag("品牌名称")%>：
            </th>
            <td>
                <input type="text" id="Name<%=lang.Code %>" name="Name<%=lang.Code %>" class="input" shop="true"  style="width: 200px;" value="<%=Shop.Bussiness.Language.Content(model.Name,lang.Code) %>" />
            </td>
        </tr>
        <tr>
            <th style="vertical-align:top">
                <%=Tag("品牌介绍")%>：
            </th>
            <td style="text-align: left;">
                <textarea shop="true" class="textarea" style="width:400px;height:60px;" id="Description<%=lang.Code %>" name="Description<%=lang.Code %>"><%=Shop.Bussiness.Language.Content(model.Description, lang.Code)%></textarea>
                <script type="text/javascript">
                    CKEDITOR.replace('Description<%=lang.Code %>', {
                        height: '150',
                        toolbar: 'Basic',
                        language: '<%=Tag("CKEditor语言")%>'
                    });
                </script>
            </td>
        </tr>
        <tr>
            <th class="head" colspan="2" onclick="ShowChild('1<%=lang.Code%>,2<%=lang.Code%>,3<%=lang.Code%>','seo')">
                <img src="<%=PageImage("plus.gif")%>" name="imgseo" id="imgseo" style="cursor: pointer; text-align: center" /> <%=Tag("SEO优化")%>
            </th>
        </tr>
        <tr style="display:none;" name="trseo" id="tr1<%=lang.Code%>">
            <th>
                <%=Tag("网页标题")%>：
            </th>
            <td>
                <input type="text" id="SEO_Title<%=lang.Code %>" name="SEO_Title<%=lang.Code %>"
                    class="input" shop="true" style="width: 400px;" value="<%=Shop.Bussiness.Language.Content(model.SEO_Title,lang.Code) %>" />
            </td>
        </tr>
        <tr style="display:none;" name="trseo" id="tr2<%=lang.Code%>">
            <th>
                <%=Tag("关键词")%>：
            </th>
            <td>
                <input type="text" id="SEO_Keywords<%=lang.Code %>" name="SEO_Keywords<%=lang.Code %>"
                    class="input" shop="true" style="width: 400px;" value="<%=Shop.Bussiness.Language.Content(model.SEO_Keywords,lang.Code) %>" />
            </td>
        </tr>
        <tr style="display:none;" name="trseo" id="tr3<%=lang.Code%>">
            <th>
                <%=Tag("网页描述")%>：
            </th>
            <td>
                <input type="text" id="SEO_Description<%=lang.Code %>" name="SEO_Description<%=lang.Code %>"
                    class="input" shop="true" style="width: 400px;" value="<%=Shop.Bussiness.Language.Content(model.SEO_Description,lang.Code) %>" />
            </td>
        </tr>
    </tbody>
    <%} %>
    </table>
    <ul id="tablistmain"><li class="selected"><a><span><%=Tag("通用信息")%></span></a></li></ul>
    <table class="table">
    <tr>
        <th valign="top" style="width: 20%">
            <%=Tag("品牌图片")%>：
        </th>
        <td>
            <div id="image_ImageUrl">
                <%if (model.ImageUrl != "")
                    {%>
                <img height="30" src="<%=site.WebPath + model.ImageUrl%>" />
                <%} %>
            </div>
            <input type="text" shop="true" id="ImageUrl" name="ImageUrl" class="input" style="width: 200px;" value="<%=model.ImageUrl%>" />
            <input id="file_ImageUrl" name="file_ImageUrl" type="file" class="input" onchange="uploadImage('ImageUrl')" />
            
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("首字母")%>：
        </th>
        <td>
            <input type="text" id="FirstLetter" name="FirstLetter" style="width: 80px" shop="true" min="notnull" class="input" value="<%=model.FirstLetter %>" maxlength="4" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("推荐")%>：
        </th>
        <td>
            <label><input type="radio" name="IsRecommend" shop="true" value="1" <%=model.IsRecommend==1?"checked":"" %> /><%=Tag("是")%></label>
            <label><input type="radio" name="IsRecommend" shop="true" value="0" <%=model.IsRecommend==0?"checked":"" %> /><%=Tag("否")%></label>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("是否含税")%>：
        </th>
        <td>
            <label><input type="radio" name="IsVAT" value="1" shop="true" <%=model.IsVAT==1?"checked":"" %> /><%=Tag("是")%></label>
            <label><input type="radio" name="IsVAT" value="0" shop="true" <%=model.IsVAT==0?"checked":"" %> /><%=Tag("否")%></label>
        </td>
    </tr>
    <tr>
        <th style="vertical-align:top">
            <%=Tag("关联分类")%>：
        </th>
        <td>
            <select name="Pro_Type_id" id="Pro_Type_id" shop="true" multiple="multiple" size="8">
                <%=Shop.Bussiness.EX_Product.TypeOption(0, model.Pro_Type_id, 0, CurrentLanguage.Code)%>
            </select>
        </td>
    </tr>
    <%if (Shop.LebiAPI.Service.Instanse.Check("plugin_gongyingshang"))
        { %>
    <tr>
        <th>
            <%=Tag("商家")%>：
        </th>
        <td>
            <select id="Supplier_id" name="Supplier_id" shop="true">
                <option value="0"><%=Tag("请选择")%></option>
                <%=Shop.Bussiness.EX_Supplier.SupplierOption(model.Supplier_id, CurrentLanguage.Code)%>
            </select>
        </td>
    </tr>
    <%} %>
    <tr>
        <th>
            <%=Tag("状态")%>：
        </th>
        <td style="text-align: left;">
            <%=Shop.Bussiness.EX_Type.TypeRadio("BrandStatus", "Type_id_BrandStatus", model.Type_id_BrandStatus, "shop=\"true\"", CurrentLanguage.Code)%>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("排序序号")%>：
        </th>
        <td>
            <input type="text" id="Sort" name="Sort" style="width: 70px" shop="true" class="input" value="<%=model.Sort %>" onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" maxlength="4" />
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
</table>
<script type="text/javascript">
    LanguageTab_EditPage('<%=CurrentLanguage.Code %>'); 
    function SaveObj() {
        <%foreach (Shop.Model.Lebi_Language_Code lang in Shop.Bussiness.Language.Languages()){%>
        var editor<%=lang.Code %> = CKEDITOR.instances.Description<%=lang.Code %>;
        $("#Description<%=lang.Code %>").val(editor<%=lang.Code %>.getData());
        <%} %>
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span")){
            return false;
        }
        var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Brand_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
    function uploadImage(id) {
        $.ajaxFileUpload
        (
	        {
	            url: WebPath + '/ajax/imageuploadone.aspx?path=brand',
	            secureuri: false,
	            fileElementId: 'file_' + id,
	            dataType: 'json',
	            success: function (data, status) {
	                if (data.msg != 'OK') {
	                        MsgBox(2, data.msg, "");
	                    }
	                    else {
	                        var imageUrl = data.ImageUrl;
	                        if (imageUrl.length > 0) {
	                            $("#image_" + id + "").html('<img height="30" src=' + WebPath + imageUrl + '>');
	                            $("#" + id + "").val(imageUrl);
	                        }
	                    }
	            },
	            error: function (data, status, e) {
	                MsgBox(2, data.error, "");
	            }
	        }
        )
    }
    $().ready(function () {
        $('#Pro_Type_id').multiselect2side({
            selectedPosition: 'right',
            moveOptions: false,
            labelsx: '',
            labeldx: '',
            autoSort: false,
            autoSortAvailable: false
        });
    }); 
</script>

  