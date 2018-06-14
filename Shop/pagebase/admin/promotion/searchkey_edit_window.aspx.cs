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
    public partial class SearchKey_Edit_window : AdminAjaxBase
    {
        protected int id;
        protected Lebi_Searchkey model;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = RequestTool.RequestInt("id", 0);
            if (id == 0)
            {
                if (!EX_Admin.Power("searchkey_add", "添加关键词"))
                {
                    WindowNoPower();
                }
            }
            else
            {
                if (!EX_Admin.Power("searchkey_edit", "编辑关键词"))
                {
                    WindowNoPower();
                }
            }
            model = B_Lebi_Searchkey.GetModel(id);
            if (model == null)
            {
                model = new Lebi_Searchkey();
                model.Type = 1;
            }

        }
    }
}