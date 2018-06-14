﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.Product.product_price_window" validateRequest="false"%>

    <style>
        .headtable {
            width: 100%;
        }
        .headtable tr {
            border-bottom: 0px solid #ececec;
        }
        .headtable tr td {
            border-bottom: 0px solid #ececec;
            width: 33%;
        }
        .datalist .list td {
            border-bottom: 1px solid #ececec;
            color: #808080;
            line-height: 150%;
            padding: 5px 10px;
            text-align: left;
            white-space: normal;
            word-break: normal;
            word-wrap: break-word;
        }
    </style>
    <table style="width:100%">
        <tr>
            <td style="vertical-align:top;width:150px;background-color:#f4f4f4;">
                <table>
                    <%=CreateTree() %>
                </table>
            </td>
            <td style="vertical-align:top">
                <div class="searchbox">
                    <input type="text" name="searchkey" id="searchkey" value="<%=key %>" class="input-query" />
                    <input style="border-width:1px;height:30px;padding:0 10px 0 10px" type="button" value="搜索" onclick="searchproduct();" />
                    <input style="border-width:1px;height:30px;padding:0 10px 0 10px" type="button" value="保存" onclick="saveproduct_price();" />
                </div>
                <table class="datalist">
                    <tr class="title">
                        <th style="">
                            <%=Tag("账号")%>
                        </th>
                        <th style="width: 25%">
                            <%=Tag("姓名")%>
                        </th>
                        <th style="width: 20%">
                            <%=Tag("分组")%>
                        </th>
                        <th style="width: 20%">
                            <%=Tag("价格")%>
                        </th>
                    </tr>
                    <tbody id="productlist"></tbody>
                </table>
                <div>
                </div>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        var userlevelid=<%=userlevelid %>;
        function selectproductone(id,number) {
            search_product(id,number);
        }
        function searchproduct(id)
        {
            if(id!=undefined)
                userlevelid=id;
            var key=$("#searchkey").val();
            reloadproducts(1,key,userlevelid); 
        }
        function reloadproducts(pageindex,key,userlevelid){
            var url = "<%=site.AdminPath %>/product/product_price_list_window.aspx?page="+pageindex+"&key="+key+"&userlevelid="+userlevelid+"&productid=<%=product.id%>";
            GetHtml(url,'productlist');
        }
        function saveproduct_price()
        {
            var postData=GetFormJsonData("shop");
            var url="<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Product_Price_Edit&userlevelid="+userlevelid+"&productid=<%=product.id%>";
            RequestAjax(url,postData,function(){MsgBox(1,"<%=Tag("操作成功")%>","?")});
        }
        reloadproducts(1,'',<%=userlevelid%>);
    </script>
    <script src="<%=site.AdminJsPath %>/tree.js" type="text/javascript"></script>

  