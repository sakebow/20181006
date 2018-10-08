using aspnet.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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
            Student studentUser = new Student();
            Teacher teacherUser = new Teacher();
            int loginAdmin = (from s in adminUser.管理员表 select s).Where(s => s.账号 == id && s.密码 == pwd).Count();
            int loginStu = (from s in studentUser.学生表 select s).Where(s => s.学号 == id && s.密码 == pwd).Count();
            int loginTec = (from s in teacherUser.教师表 select s).Where(s => s.教师工号 == id && s.密码 == pwd).Count();
            try
            {
                if (id.Length > 10)
                {
                    if (Session["session_verifycode"].Equals(verifyCode) && loginStu == 1)
                    {
                        Session["login"] = id;
                        return RedirectToAction("../Student/Index");
                    }
                    else if (!Session["session_verifycode"].Equals(verifyCode) && loginStu == 1)
                    {
                        throw new Exception("验证码不正确！");
                    }
                    else if (loginStu == 0)
                    {
                        int CheckStuID = (from s in studentUser.学生表 select s).Where(s => s.学号 == id).Count();
                        if (CheckStuID == 0)
                        {
                            throw new Exception("用户不存在！");
                        }
                        else
                        {
                            throw new Exception("密码错误！");
                        }
                    }
                }
                else if (id.Length >= 8 && id.Length < 10)
                {
                    if (Session["session_verifycode"].Equals(verifyCode) && loginTec == 1)
                    {
                        Session["login"] = id;
                        return RedirectToAction("../Teacher/Index");
                    }
                    else if (!Session["session_verifycode"].Equals(verifyCode) && loginTec == 1)
                    {
                        throw new Exception("验证码不正确！");
                    }
                    else if (loginTec == 0)
                    {
                        int CheckTecID = (from s in teacherUser.教师表 select s).Where(s => s.教师工号 == id).Count();
                        if (CheckTecID == 0)
                        {
                            throw new Exception("用户不存在！");
                        }
                        else
                        {
                            throw new Exception("密码错误！");
                        }
                    }
                }
                else
                {
                    if (Session["session_verifycode"].Equals(verifyCode) && loginAdmin == 1)
                    {
                        Session["login"] = id;
                        return RedirectToAction("../Admin/Index");
                    }
                    else if (!Session["session_verifycode"].Equals(verifyCode) && loginAdmin == 1)
                    {
                        throw new Exception("验证码不正确！");
                    }
                    else if (loginAdmin == 0)
                    {
                        int CheckAdmID = (from s in adminUser.管理员表 select s).Where(s => s.账号 == id).Count();
                        if (CheckAdmID == 0)
                        {
                            throw new Exception("用户不存在！");
                        }
                        else
                        {
                            throw new Exception("密码错误！");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ViewBag.Message = ex.Message;
            }
            finally
            {
                ViewBag.Id = id;
                ViewBag.Password = pwd;
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