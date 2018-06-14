﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shop.Bussiness;
using Shop.Model;
using Shop.Tools;
namespace Shop.Admin.Config
{
    public partial class cache : AdminPageBase
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!EX_Admin.Power("cache", "更新缓存"))
            {
                PageNoPower();
            }
        }

        public string Count(string table)
        {
            return Common.GetValue("select count(*) from [" + table + "]");
        }

    }
}