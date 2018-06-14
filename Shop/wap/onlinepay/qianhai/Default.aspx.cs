﻿using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

using System.Linq;
using System.Text;
using System.Collections.Specialized;
using System.Text.RegularExpressions;
using Shop.Model;
using Shop.Bussiness;
using Shop.Tools;


namespace qianhai
{
    public partial class _Default : ShopPage
    {
        public Lebi_Order order;
        public string Money;
        public string ReturnUrl;
        public string business;
        public string scode = "";
        public string currency = "";
        protected void Page_Load(object sender, EventArgs e)
        {


            int order_id = RequestTool.RequestInt("order_id", 0);
            order = B_Lebi_Order.GetModel(order_id);
            if (order == null)
            {
                Response.Write("订单错误");
                Response.End();
                return;
            }
            Lebi_OnlinePay pay = Shop.Bussiness.Money.GetOnlinePay(order, "qianhai");
            if (pay == null)
            {
                Response.Write("系统错误");
                Response.End();
                return;
            }
            if (pay.FeeRate > 0)
            {
                order.Money_OnlinepayFee = order.Money_Pay * pay.FeeRate / 100;
            }
            order.Site_id_pay = CurrentSite.id;
            B_Lebi_Order.Update(order);
            Lebi_Currency currendy = B_Lebi_Currency.GetModel(pay.Currency_id);
            business = pay.UserName;
           
          
            currency = pay.Currency_Code;
            Money = (order.Money_Pay * currendy.ExchangeRate * (1 + (pay.FeeRate / 100))).ToString("0.00");

            Shop.Bussiness.Site site = new Shop.Bussiness.Site();
            ReturnUrl = "http://" + RequestTool.GetRequestDomain() + site.WebPath + "/onlinepay/qianhai/ReturnUrl.aspx";

            //account+terminal+backUrl+order_number+order_currency+order_amount+billing_firstName+billing_lastName+billing_email+secureCode
            //scode = pay.UserName + "" + ReturnUrl + order.Code + pay.Currency_Code + Money + "" + "" + "" + pay.UserKey;
        }
        public string GetSHA256(string strData)
        {
            //使用SHA256加密算法：
            System.Security.Cryptography.SHA256 sha256 = new System.Security.Cryptography.SHA256Managed();
            byte[] sha256Bytes = System.Text.Encoding.Default.GetBytes(strData);
            byte[] cryString = sha256.ComputeHash(sha256Bytes);
            string sha256Str = string.Empty;

            for (int i = 0; i < cryString.Length; i++)
            {
                sha256Str += cryString[i].ToString("X2");
            }
            return sha256Str;
        }
    }
}
