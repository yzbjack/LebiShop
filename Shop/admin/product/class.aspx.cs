﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shop.Model;
using Shop.Bussiness;
using Shop.Tools;
namespace Shop.Admin.product
{
    public partial class Class : AdminPageBase
    {
        protected string key;
        protected string List;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!EX_Admin.Power("pro_type_list", "商品分类列表"))
            {
                PageNoPower();
            }
            key = RequestTool.RequestString("key");
            if (key == "")
                List = CreateTree(0, 0);
            else
                List = CreateList(key);

        }
        public string CreateList(string key)
        {

            string str = "";

            List<Lebi_Pro_Type> types = B_Lebi_Pro_Type.GetList("Name like lbsql{'%" + key + "%'}", "Sort desc");

            //将根节点进行遍历
            foreach (Lebi_Pro_Type t in types)
            {

                string caozuo = "<a href=\"javascript:Edit(" + t.id + ",0)\">" + Tag("添加子类") + "</a> |  <a href=\"javascript:Edit(0," + t.id + ")\">" + Tag("编辑") + "</a> | <a href=\"javascript:Del(" + t.id + ")\">" + Tag("删除") + "</a>";
                str += "<tr class=\"list\" name=\"tr" + t.Parentid + "\" id=\"tr" + t.id + "\">";
                str += "<td align=\"center\"><input type='checkbox' id=\"check" + t.id + "\" value='" + t.id + "' name='id' del=\"del\" /></td>";
                str += "<td>" + t.id + "</td>";
                str += "<td>";
                if (t.ImageSmall != "")
                {
                    str += "<img src=\"" + t.ImageSmall + "\" height=\"16\" />&nbsp;";
                }
                str += Language.Content(t.Name, CurrentLanguage.Code) + "&nbsp;<a href=\"" + Shop.Bussiness.ThemeUrl.GetURL("P_ProductCategory", t.id.ToString(), "", CurrentLanguage.Code) + "\" target=\"_blank\"><img src=\"../images/icon/newWindow.png\" /></a></td>";
                str += "<td>" + Shop.Tools.Utils.GetUnicodeSubString(ProPertystring(t.ProPerty132), 20, "...") + "</td>";
                str += "<td>" + Shop.Tools.Utils.GetUnicodeSubString(ProPertystring(t.ProPerty131), 20, "...") + "</td>";
                str += "<td><a href=\"default.aspx?Pro_Type_id=" + t.id + "&Type_id_ProductType=320,321,322,323\">" + EX_Product.TypeProductCount(t.id) + "</a></td>";
                str += "<td>" + t.Sort + "</td>";
                str += "<td>" + (t.IsShow == 1 ? "" + Tag("是") + "" : "" + Tag("否") + "") + "</td>";
                str += "<td>" + (t.IsIndexShow == 1 ? "" + Tag("是") + "" : "" + Tag("否") + "") + "</td>";
                str += "<td>" + caozuo + "</td></tr>";

                //CreateSunNode(int.Parse(ds.Tables[0].Rows[i]["id"].ToString()), ",0", ss);
            }
            return str;
        }
        public string CreateTree(int pid, int deep)
        {

            string str = "";
            //的道所有的更节点
            // List<Lebi_Pro_Type> types = B_Lebi_Pro_Type.GetList("Parentid=" + pid + "", "Sort desc");
            List<Lebi_Pro_Type> types = EX_Product.Types(pid);
            //将根节点进行遍历
            string style = "";
            if (deep > 0)
                style = "style=\"display:none;\"";
            foreach (Lebi_Pro_Type t in types)
            {
                //隐藏规则
                //name = "<input type=\"hidden\" value=\"" + 1 + "\" /><input type=\"hidden\" value=\"" + ds.Tables[0].Rows[i]["pid"] + "\" /> <input type=\"hidden\" value=\"" + ds.Tables[0].Rows[i]["id"] + "\" /><input type=\"hidden\" value=\"," + ds.Tables[0].Rows[i]["pid"] + ",\" />";
                //操作
                string caozuo = "<a href=\"javascript:Edit(" + t.id + ",0)\">" + Tag("添加子类") + "</a> |  <a href=\"javascript:Edit(0," + t.id + ")\">" + Tag("编辑") + "</a> | <a href=\"javascript:Del(" + t.id + ")\">" + Tag("删除") + "</a>";

                //str += "<tr onclick='javascript:selectrow(\"check" + t.id + "\");' name=\"tr" + t.Parentid + "\" " + style + " id=\"tr" + t.id + "\">";
                str += "<tr class=\"list\" ondblclick=\"Edit(0," + t.id + ")\" name=\"tr" + t.Parentid + "\" " + style + " id=\"tr" + t.id + "\">";
                str += "<td align=\"center\"><input type='checkbox' id=\"check" + t.id + "\" value='" + t.id + "' name='id' del=\"del\" /></td>";
                str += "<td>" + t.id + "</td>";
                str += "<td>" + deepstr(deep) + "<img src=\"../images/plus.gif\" name=\"img" + t.Parentid + "\" id=\"img" + t.id + "\" style=\"cursor: pointer; text-align: center; vertical-align:absmiddle\" onclick=\"ShowChild('" + findpath(t.id) + "'," + t.id + ")\" title=\""+ Tag("展开")+"\" />&nbsp;&nbsp;";
                if (t.ImageSmall != "")
                {
                    str += "<img src=\"" + t.ImageSmall + "\" height=\"16\" />&nbsp;";
                }
                str +=  Language.Content(t.Name, CurrentLanguage.Code) + "&nbsp;<a href=\"" + Shop.Bussiness.ThemeUrl.GetURL("P_ProductCategory", t.id.ToString(), "", CurrentLanguage.Code) + "\" target=\"_blank\"><img src=\"../images/icon/newWindow.png\" style=\"vertical-align:absmiddle\" /></a></td>";

                str += "<td>" + Shop.Tools.Utils.GetUnicodeSubString(shuxinglianjie(ProPertystring(t.ProPerty132), ProPertystring(t.ProPerty133)), 20, "...") + "</td>";
                str += "<td>" + Shop.Tools.Utils.GetUnicodeSubString(ProPertystring(t.ProPerty131), 20, "...") + "</td>";

                str += "<td><a href=\"default.aspx?Pro_Type_id=" + t.id + "&Type_id_ProductType=320,321,322,323\">" + EX_Product.TypeProductCount(t.id) + "</a></td>";
                str += "<td>" + t.Sort + "</td>";
                str += "<td>" + (t.IsShow == 1 ? "" + Tag("是") + "" : "" + Tag("否") + "") + "</td>";
                str += "<td>" + (t.IsIndexShow == 1 ? "" + Tag("是") + "" : "" + Tag("否") + "") + "</td>";
                str += "<td>" + caozuo + "</td></tr>";
                str += CreateTree(t.id, deep + 1);

                //CreateSunNode(int.Parse(ds.Tables[0].Rows[i]["id"].ToString()), ",0", ss);
            }
            return str;
        }
        private string deepstr(int deep)
        {
            string str = "";
            for (int i = 0; i < deep; i++)
            {
                str += "&nbsp;&nbsp;&nbsp;";
            }
            return str;
        }
        /// <summary>
        /// 某个结点下的所有结点
        /// </summary>
        /// <param name="pid"></param>
        /// <returns></returns>
        private string findpath(int pid)
        {
            string str = "";
            List<Lebi_Pro_Type> types = EX_Product.Types(pid);
            if (types.Count == 0)
                return "";
            foreach (Lebi_Pro_Type t in types)
            {
                if (str == "")
                    str = t.id.ToString();
                else
                    str += "," + t.id;
                string f = findpath(t.id);
                //if (f != "")
                str += "," + f;
            }

            return str;

        }
        /// <summary>
        /// 属性规格字符串
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        private string ProPertystring(string ids)
        {
            if (ids == "")
                return "";
            string str = "";
            List<Lebi_ProPerty> pros = B_Lebi_ProPerty.GetList("id in (lbsql{" + ids + "})", "Sort desc");
            foreach (Lebi_ProPerty pro in pros)
            {
                if (str == "")
                    str = Language.Content(pro.Name, CurrentLanguage.Code);
                else
                    str += "," + Language.Content(pro.Name, CurrentLanguage.Code);
            }
            if (str == ",")
                str = "-";
            return str;
        }
        private string shuxinglianjie(string str1, string str2)
        {
            if (str1 == "")
                return str2;
            else
            {
                if (str2 == "")
                    return str1;
                else
                    return str1 + "," + str2;
            }
        }
    }
}