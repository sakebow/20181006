using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace aspnetV2
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
        }

        protected void Session_Start()
        {
            Session["account"] = "请先登录";
            Session["identity"] = "请先登录";
        }

        protected void Session_End()
        {
            Session["account"] = "请先登录";
            Session["identity"] = "请先登录";
        }
    }
}
