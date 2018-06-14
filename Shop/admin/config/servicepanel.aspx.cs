﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shop.Bussiness;
using Shop.Model;
using Shop.Tools;

namespace Shop.Admin.storeConfig
{
    public partial class ServicePanel : AdminPageBase
    {
        protected string lang;
        protected int type;
        protected string key;
        protected List<Lebi_ServicePanel> models;
        protected string PageString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!EX_Admin.Power("servicepanel_list", "客服面板成员列表"))
            {
                PageNoPower();
            }
            PageSize = RequestTool.getpageSize(20);
            lang = RequestTool.RequestString("lang");
            key = RequestTool.RequestString("key");
            string where = "Supplier_id=0";
            if (key != "")
                where += " and Name like lbsql{'%" + key + "%'}";
            if (lang != "")
                where += " and Lanaguage like lbsql{'%" + lang + "%'}";
            models = B_Lebi_ServicePanel.GetList(where, "Sort desc", PageSize, page);
            int recordCount = B_Lebi_ServicePanel.Counts(where);
            PageString = Pager.GetPaginationString("?page={0}&lang=" + lang + "&key=" + key, page, PageSize, recordCount);
            
        }

        public Lebi_ServicePanel_Group GetGroup(int group_id)
        {
            Lebi_ServicePanel_Group group = B_Lebi_ServicePanel_Group.GetModel(group_id);
            if (group == null)
                group = new Lebi_ServicePanel_Group();
            return group;
        }

        public Lebi_ServicePanel_Type GetType(int type_id)
        {
            Lebi_ServicePanel_Type type = B_Lebi_ServicePanel_Type.GetModel(type_id);
            if (type == null)
                type = new Lebi_ServicePanel_Type();
            return type;
        }
    }
}