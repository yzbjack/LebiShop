﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.inc.productcategory" validateRequest="false"%>
<dl>
    <dt></dt>
    <%
        int ic1 = 0;
        foreach (Shop.Model.Lebi_Pro_Type c1 in Shop.Bussiness.EX_Product.ShowTypes(cid))
        {
            if (ic1 > 5)
                break;        
    %>
    <dd>
        <ul>
            <li class="big"><a href="<%=URL("P_ProductCategory",""+c1.id+"",Lang(c1.Url)) %>">
                <%=Lang(c1.Name) %></a></li>
            <li class="small">
                <%
int ic2 = 0;
foreach (Shop.Model.Lebi_Pro_Type c2 in Shop.Bussiness.EX_Product.ShowTypes(c1.id))
{
    if (ic2 > 5)
        break; 
                %>
                <a href="<%=URL("P_ProductCategory",""+c2.id+"",Lang(c2.Url)) %>">
                    <%=Lang(c2.Name) %></a>
                <%
ic2++;
                        } %>
            </li>
            <div class="clear">
            </div>
        </ul>
    </dd>
    <%
ic1++;
            } %>
</dl>
