using aspnet.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace aspnetV2.Controllers
{
    public class LoginController : Controller
    {
        /// <summary>
        /// 登陆控制器：
        /// 1、登陆页面
        /// 2、登陆验证
        /// 3、验证码验证
        /// </summary>
        /// <returns></returns>

        #region 登陆页面
        // 登陆页面
        public ActionResult Login()
        {
            return View();
        }

        // 提交登陆信息
        [HttpPost]
        public ActionResult Login(string id, string pwd, string verifyCode)
        {
            try
            {

            }
            catch (Exception ex)
            {

            }
            finally
            {

            }
            return View();
        }

        // 登录时需要的验证码
        [HttpGet]
        public ActionResult VerifyCode()
        {
            return File(new VerifyCode().GetVerifyCode(0, 0, 0), @"image/Gif");
        }

        #endregion
    }
}