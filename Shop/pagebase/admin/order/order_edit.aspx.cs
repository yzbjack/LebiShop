﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Shop.Bussiness;
using Shop.Model;
using Shop.Tools;

namespace Shop.Admin.order
{
    public partial class Order_Edit : AdminPageBase
    {
        protected Lebi_Order model;
        protected List<Lebi_Order_Product> pros;
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = RequestTool.RequestInt("id", 0);
            if (!EX_Admin.Power("order_edit", "编辑订单"))
            {
                PageReturnMsg = PageNoPowerMsg();
            }
            
            model = B_Lebi_Order.GetModel(id);
            if (model == null)
            {
                model = new Lebi_Order();

            }

            pros = B_Lebi_Order_Product.GetList("Order_id=" + model.id + "", "");

        }

    }
}