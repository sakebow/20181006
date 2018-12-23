using aspnet.Controllers;
using aspnetV2.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
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

        asp allData = new asp();
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
            string savePath = Server.MapPath("~/Docs/Switch/");
            string fileName = "switch.txt";
            string swicth = string.Empty;
            try
            {
                if (System.IO.File.Exists(savePath + fileName))
                {
                    using (StreamReader sr = new StreamReader(savePath + fileName, Encoding.Default))
                    {
                        string temp = string.Empty;
                        while ((temp = sr.ReadLine()) != null)
                        {
                            swicth += temp.ToString();
                        }
                    }
                }
                if (!pwd.Equals("123456"))
                {
                    pwd = MD5Helper.getStringMd5Hash(pwd);
                }
                // 注意：密码表才是所有表的外键参照表，要通过查找密码表验证id和pwd的正确性
                var login = (from s in allData.登陆验证视图 select s).SingleOrDefault(s => s.账号.Equals(id) && s.密码.Equals(pwd));
                var findUser = (from s in allData.登陆验证视图 select s).Where(s => s.账号.Equals(id));
                if (login != null && Session["session_verifycode"].Equals(verifyCode) && swicth.Equals("开"))
                {
                    Session["account"] = id;
                    Session["identity"] = login.身份名称;
                }
                else if (login != null && !Session["session_verifycode"].Equals(verifyCode) && swicth.Equals("开"))
                {
                    ViewBag.Id = id;
                    ViewBag.Password = pwd;
                    throw new Exception("验证码错误！");
                }
                else if (swicth.Equals("开"))
                {
                    if (findUser.Count() == 1)
                    {
                        ViewBag.Id = id;
                        throw new Exception("密码错误！");
                    }
                    else
                    {
                        throw new Exception("用户不存在！");
                    }
                }
                else
                {
                    throw new Exception("系统已关闭！");
                }
                string account = Session["account"].ToString();
                switch (Session["identity"].ToString())
                {
                    case "教师管理员":
                        Session["school"] = (from s in allData.学校代码表 select s).SingleOrDefault(s => s.学校代码.Equals((from t in allData.管理员表 select t).FirstOrDefault(t => t.账号.Equals(account)).所属学校代码)).学校代码;
                        return RedirectToAction("ShowCourse", "Admin");
                    case "学生管理员":
                        Session["school"] = (from s in allData.学校代码表 select s).SingleOrDefault(s => s.学校代码.Equals((from t in allData.管理员表 select t).FirstOrDefault(t => t.账号.Equals(account)).所属学校代码)).学校代码;
                        return RedirectToAction("ShowCourse", "Admin");
                    case "学生":
                        Session["school"] = (from s in allData.学校代码表 select s).SingleOrDefault(s => s.学校代码.Equals(
                            (from t in allData.学生表 select t).FirstOrDefault(t => t.学生学号.Equals(account)).所在学校代码
                            )).学校代码;
                        Session["faculty"] = (from s in allData.院系代码表 select s).SingleOrDefault(s => s.院系代码.Equals(
                            (from t in allData.学生表 select t).FirstOrDefault(t => t.学生学号.Equals(account)).所在院系代码
                            )).院系代码;
                        Session["specialty"] = (from s in allData.专业代码表 select s).SingleOrDefault(s => s.专业代码.Equals(
                            (from t in allData.学生表 select t).FirstOrDefault(t => t.学生学号.Equals(account)).所在专业代码
                            )).专业代码;
                        return RedirectToAction("StudentInfo", "Student", new { id = Session["account"] });
                    case "教师":
                        Session["school"] = (from s in allData.学校代码表 select s).SingleOrDefault(s => s.学校代码.Equals(
                            (from t in allData.教师表 select t).FirstOrDefault(t => t.教师工号.Equals(account)).所在学校代码
                            )).学校代码;
                        Session["faculty"] = (from s in allData.院系代码表 select s).SingleOrDefault(s => s.院系代码.Equals(
                            (from t in allData.教师表 select t).FirstOrDefault(t => t.教师工号.Equals(account)).所在院系代码
                            )).院系代码;
                        return RedirectToAction("TeacherInfo", "Teacher", new { id = Session["account"] });
                }
            }
            catch (Exception ex)
            {
                // 使用ViewBag或者ViewData保存错误信息
                ViewBag.ErrorMessage = ex.Message;
            }
            return View();
        }

        // 登录时需要的验证码
        [HttpGet]
        public ActionResult VerifyCode()
        {
            return File(new VerifyCode().GetVerifyCode(0, 0, 0), @"image/Gif");
        }

        public ActionResult ResetPassword(string id)
        {
            var self = (from s in allData.密码表 select s).SingleOrDefault(s => s.账号.Equals(id));
            self.密码 = "123456";
            allData.SaveChanges();
            return RedirectToAction("Login", "Login");
        }

        #endregion
    }
}