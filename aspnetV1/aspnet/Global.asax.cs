using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace aspnet
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
            Session["login"] = "[请先登录]";
            Session["identity"] = "[请先登录]";
        }

        protected void Session_End()
        {
            Session["login"] = "[您已退出]";
            Session["identity"] = "[您已退出]";
        }
    }
}
