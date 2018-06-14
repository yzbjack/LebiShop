﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shop.Bussiness;
using Shop.Model;
using Shop.Tools;
using System.Threading;

namespace Shop.Admin.sorteConfig
{
    public partial class Language : AdminPageBase
    {
        protected List<Lebi_Site> models;
        protected Lebi_Site model;
        protected Lebi_Site mainsite;
        protected string sitenames;
        protected Lebi_Language defalutlang;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!EX_Admin.Power("site_list", "站点列表"))
            {
                PageNoPower();
            }

            string where = "1=1";
            int sitenum = 0;//允许的站点数量
            if (B_API.Check("domain3"))
            {
                sitenum = 30;
            }
            else if (B_API.Check("domain20"))
            {
                sitenum = 20;
            }
            else if (B_API.Check("domain10"))
            {
                sitenum = 10;
            }
            else if (B_API.Check("domain2"))
            {
                sitenum = 2;
            }
            else
            {
                sitenum = 1;
            }

            //if (B_API.Check("domain3"))
            //    sitenum = 30;
            if (domain3admin && CurrentAdmin.Site_ids != "")
            {
                where += " and id in (" + CurrentAdmin.Site_ids + ")";
            }
            models = B_Lebi_Site.GetList(where, "Sort desc", sitenum, 1);
            if (models.Count == 0)
            {
                //没有数据时插入主站数据
                model = new Lebi_Site();
                model.Copyright = SYS.Copyright;
                model.Description = SYS.Description;
                model.Fax = SYS.Fax;
                model.Keywords = SYS.Keywords;
                model.Logoimg = SYS.Logoimg;
                model.Name = SYS.Name;
                model.Phone = SYS.Phone;
                model.QQ = SYS.QQ;
                model.ServiceP = SYS.ServiceP;
                model.Title = SYS.Title;
                B_Lebi_Site.Add(model);
                model.id = B_Lebi_Site.GetMaxId();
                models.Add(model);
                mainsite = model;
            }
            else
            {
                if (sitenum > 1)
                {
                    int id = RequestTool.RequestInt("id", 0);
                    model = B_Lebi_Site.GetModel(id);
                    if (model == null)
                        model = models.FirstOrDefault();
                    mainsite = models.FirstOrDefault();
                }
                else
                {
                    models = B_Lebi_Site.GetList(where, "Sort desc", 1, 1);
                    model = models.FirstOrDefault();
                    mainsite = models.FirstOrDefault();
                }
            }

            defalutlang = B_Lebi_Language.GetModel("Site_id=" + model.id + " order by id asc");
            if (defalutlang == null)
                defalutlang = new Lebi_Language();
            foreach (Shop.Model.Lebi_Site s in models)
            {
                sitenames += "<li ";
                if (model.id == s.id)
                    sitenames += "class=\"selected\"";
                sitenames += "><a href=\"?id=" + s.id + "\"><span>";
                //if (mainsite.id == s.id)
                //    sitenames += s.SubName;
                Lebi_Language lang = B_Lebi_Language.GetModel("Site_id=" + s.id + " order by id asc");
                string sname = "";
                if (lang == null)
                    sname = Tag("新站点");
                else
                    sname = s.SubName;
                if (sname == "")
                    sname = Tag("新站点");
                sitenames += sname + "</span></a></li>";
            }
            if (sitenum > 1 && models.Count < sitenum)
            {
                sitenames += "<li><a href=\"javascript:void(0)\" onclick=\"AddSite()\"><span>" + Tag("添加站点");
                sitenames += "</span></a></li>";
            }
            //开启一个线程同步语种标签
            Thread thread = new Thread(new ThreadStart(UPdateLanguage));
            thread.IsBackground = true;//这样能随主程序一起结束
            thread.Start();
        }


        public Lebi_Theme GetTheme(int id)
        {
            Lebi_Theme model = B_Lebi_Theme.GetModel(id);
            if (model == null)
                model = new Lebi_Theme();
            return model;
        }
        public void UPdateLanguage()
        {
            B_API.LanguageUpadte();
        }


        public Lebi_Language GetLanguage(string code, int siteid)
        {
            Lebi_Language lang = B_Lebi_Language.GetModel("Site_id=" + siteid + " and Code='" + code + "'");
            if (lang == null)
                lang = new Lebi_Language();
            return lang;
        }
        public string Themeslist(int id)
        {
            string str = "";
            List<Lebi_Theme> list = B_Lebi_Theme.GetList("", "Sort desc");
            foreach (Lebi_Theme model in list)
            {
                string sel = "";
                if (id == model.id)
                    sel = "selected";
                str += "<option value=\"" + model.id + "\" " + sel + ">" + model.Name + "</option>";
            }
            return str;
        }
        public string Currencylist(int id)
        {
            string str = "";
            List<Lebi_Currency> list = B_Lebi_Currency.GetList("", "Sort desc");
            foreach (Lebi_Currency model in list)
            {
                string sel = "";
                if (id == model.id)
                    sel = "selected";
                str += "<option value=\"" + model.id + "\" " + sel + ">" + model.Name + "</option>";
            }
            return str;
        }
    }
}