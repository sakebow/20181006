using aspnet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace aspnet.Controllers
{
    public class LoginController : Controller
    {
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
            Admin adminUser = new Admin();
            int login = (from s in adminUser.管理员表 select s).Where(s => s.账号 == id && s.密码 == pwd).Count();
            try
            {
                if (Session["session_verifycode"].Equals(verifyCode) && login == 1)
                {
                    return RedirectToAction("../Admin/Index");
                }
                else if (!Session["session_verifycode"].Equals(verifyCode) && login == 1)
                {
                    throw new Exception("验证码不正确！");
                }
                else if (Session["session_verifycode"].Equals(verifyCode) && login == 0)
                {
                    int checkID = (from s in adminUser.管理员表 select s).Where(s => s.账号 == id).Count();
                    if (checkID == 0)
                    {
                        throw new Exception("用户名不存在！");
                    }
                    else
                    {
                        throw new Exception("密码错误！");
                    }
                }
                else
                {
                    throw new Exception("网络错误，请检查网络连接！");
                }
            }
            catch(Exception ex)
            {
                ViewBag.Message = ex.Message;
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