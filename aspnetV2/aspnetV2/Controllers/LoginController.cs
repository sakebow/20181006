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
                // 注意：密码表才是所有表的外键参照表，要通过查找密码表验证id和pwd的正确性
                // Ex-注意：密码必须MD5加密保存
                //             所以如果密码是12345，就明码保存
                //                 如果密码不是12345，就加密保存
                //         对照的时候也是一样的
                //             如果密码是12345，就直接对照
                //             如果密码不是12345，就加密再对照（相同字符串在不同时间段得到的加密结果是一样的）
            }
            catch (Exception ex)
            {
                // 使用ViewBag或者ViewData保存错误信息
                ViewBag.ErrorMessage = ex.Message;
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