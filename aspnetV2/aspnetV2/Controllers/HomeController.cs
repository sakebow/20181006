using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace aspnetV2.Controllers
{
    public class HomeController : Controller
    {
        /// <summary>
        /// 首页：
        ///     1、轮播图
        ///     2、课程中心
        ///     3、登陆通道
        /// </summary>
        /// <returns></returns>
        public ActionResult Home()
        {
            return View();
        }
    }
}