﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using Shop.Model;
using Shop.Bussiness;
using Shop.Tools;
using System.Reflection;
using System.IO;
using System.Text.RegularExpressions;

namespace Shop.Admin.Ajax
{
    /// <summary>
    /// 数据库操作
    /// </summary>
    public partial class Ajax_db : AdminPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string action = Shop.Tools.RequestTool.RequestString("__Action");
            Type type = this.GetType();
            MethodInfo methodInfo = type.GetMethod(action);
            if (methodInfo != null)
                methodInfo.Invoke(this, null);

        }
        /// <summary>
        /// 创建数据库备份
        /// </summary>
        public void BackUP_add()
        {
            if (!EX_Admin.Power("backup_add", "添加数据备份"))
            {
                AjaxNoPower();
            }
            bool res = BackUP.Add();
            if (res)
            {
                Log.Add("添加数据备份", "Backup", "", CurrentAdmin, "");
                Response.Write("{\"msg\":\"OK\"}");
            }
            else
            {
                Response.Write("{\"msg\":\"备份数据库异常\"}");
            }
        }
        /// <summary>
        /// 删除数据库备份
        /// </summary>
        public void BackUP_del()
        {
            if (!EX_Admin.Power("backup_del", "删除数据备份"))
            {
                AjaxNoPower();
            }
            try
            {
                string files = RequestTool.RequestString("files");
                string[] fs = files.Split(',');

                string backpath = ShopCache.GetBaseConfig().DataBase_BackPath;

                if (backpath.IndexOf("/") == 0)
                {
                    backpath = System.Web.HttpRuntime.AppDomainAppPath + "/" + backpath;
                }
                if (!Directory.Exists(backpath))
                {
                    Directory.CreateDirectory(backpath);
                }

                backpath = backpath + "/";
                Regex r = new Regex(@"//*/", RegexOptions.Singleline);//目的：防止类似“///”“////”“//////”的情况
                int i = 0;
                foreach (var f in fs)
                {
                    if (!string.IsNullOrEmpty(f) && File.Exists(backpath + f))
                    {
                        File.Delete(backpath + f);
                    }
                }
                Log.Add("删除数据备份", "Backup", "", CurrentAdmin, files);
                Response.Write("{\"msg\":\"OK\"}");
            }
            catch
            {
                Response.Write("{\"msg\":\"系统错误\"}");
            }
        }
        #region
        /// <summary>
        /// 清除数据
        /// </summary>
        public void DataClear()
        {
            if (!EX_Admin.Power("data_clear", "清理数据"))
            {
                AjaxNoPower();
                return;
            }
            string datatype = RequestTool.RequestString("datatype");
            string[] arr = datatype.Split(',');
            foreach (string t in arr)
            {
                switch (t.ToLower())
                {
                    case "user":
                        DataClear_user();
                        break;
                    case "product":
                        DataClear_product();
                        break;
                    case "order":
                        DataClear_order();
                        break;
                    case "log":
                        DataClear_log();
                        break;
                    case "userpoint":
                        DataClear_userpoint();
                        break;
                    case "usermoney":
                        DataClear_usermoney();
                        break;
                    case "message":
                        DataClear_message();
                        break;
                    case "userproduct":
                        DataClear_userproduct();
                        break;
                    case "card":
                        DataClear_card();
                        break;
                }
            }
            Response.Write("{\"msg\":\"OK\"}");
        }
        private void Delete(string table)
        {
            Common.ExecuteSql("delete from [" + table + "]");
        }
        private void DataClear_user()
        {
            Delete("Lebi_User");
            Delete("Lebi_User_Address");
            Delete("Lebi_User_BuyMoney");
            Delete("Lebi_User_Card");
            Delete("Lebi_User_Point");
            Delete("Lebi_User_Product");
            Delete("Lebi_User_Money");
            Delete("Lebi_Message");
            Delete("Lebi_Agent_Area");
            Delete("Lebi_Agent_Money");
            Delete("Lebi_Agent_Product_Level");
            Delete("Lebi_Agent_Product_request");
            Delete("Lebi_Agent_Product_User");
        }
        private void DataClear_product()
        {
            Delete("Lebi_Product");
            Delete("Lebi_Product_Stock_Log");
            Delete("Lebi_Agent_Product_request");
            Delete("Lebi_Agent_Product_User");
        }
        private void DataClear_order()
        {
            Delete("Lebi_Order");
            Delete("Lebi_Order_Log");
            Delete("Lebi_Order_Product");
            Delete("Lebi_Transport_Order");
        }
        private void DataClear_log()
        {
            Delete("Lebi_Log");
        }
        private void DataClear_userpoint()
        {
            Delete("Lebi_User_Point");
            Common.ExecuteSql("update [Lebi_User] set Point=0");
        }
        private void DataClear_usermoney()
        {
            Delete("Lebi_User_Money");
            Common.ExecuteSql("update [Lebi_User] set Money=0,Money_xiaofei=0");
        }
        private void DataClear_userproduct()
        {
            Delete("Lebi_User_Product");
        }
        private void DataClear_message()
        {
            Delete("Lebi_Message");
        }
        private void DataClear_card()
        {
            Delete("Lebi_Card");
            Delete("Lebi_CardOrder");
        }
        #endregion
        /// <summary>
        /// 更新缓存
        /// </summary>
        public void CacheReset()
        {
            if (!EX_Admin.Power("cache", "更新缓存"))
            {
                AjaxNoPower();
                return;
            }
            string datatype = RequestTool.RequestString("datatype");
            string[] arr = datatype.Split(',');
            foreach (string t in arr)
            {
                switch (t.ToLower())
                {

                    case "producttype":
                        ShopCache.SetProductType();
                        break;
                    case "config":
                        ShopCache.SetBaseConfig();
                        ShopCache.SetDomainStatus();
                        ShopCache.SetMainSite();
                        ShopCache.SetLicense();
                        break;
                    case "languagetag":
                        ShopCache.SetLanguageTag();
                        break;
                    case "themepage":
                        ShopCache.SetThemePage();
                        break;
                    case "lebitype":
                        B_API.UpdateType();
                        B_API.UpdateNode();
                        break;
                    case "lebimenu":
                        B_API.UpdateMenu();
                        break;
                    case "lebipage":
                        B_API.UpdateThemePage();
                        ShopCache.SetThemePage();
                        break;
                    
                }
            }
            Response.Write("{\"msg\":\"OK\"}");
        }
    }
}