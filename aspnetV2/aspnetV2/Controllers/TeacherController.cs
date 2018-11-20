using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace aspnetV2.Controllers
{
    public class TeacherController : Controller
    {
        /// <summary>
        /// 教师控制器
        /// 一、首页
        /// 二、个人信息
        ///     1、展示个人信息
        /// </summary>
        /// <returns></returns>
        #region 首页
        public ActionResult Index()
        {
            return View();
        }
        #endregion

        #region 个人信息
        public ActionResult TeacherInfo()
        {
            return View();
        }
        #endregion
    }
}