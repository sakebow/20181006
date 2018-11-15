using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace aspnetV2.Controllers
{
    public class AdminController : Controller
    {
        /// <summary>
        /// 管理员首页：
        /// 零、首页
        /// 一、课程
        ///     1、课程展示
        ///     2、添加课程
        ///     3、删除课程
        ///     4、修改课程
        ///     5、查询课程
        /// 二、申请
        ///     1、学生申请审核
        ///     2、教师申请审核
        /// 三、新闻
        ///     1、查看新闻
        ///     2、修改新闻
        ///     3、删除新闻
        ///     4、添加新闻
        /// 四、公告
        ///     1、查看公告
        ///     2、修改公告
        ///     3、删除公告
        ///     4、添加公告
        /// </summary>
        
        // 首页
        public ActionResult Index()
        {
            return View();
        }

        #region 显示课程
        // 显示课程
        public ActionResult ShowCourse()
        {
            return View();
        }

        // 查找课程
        [HttpPost]
        public ActionResult ShowCourse(string searchChoice, string searchContent)
        {
            return View();
        }
        #endregion

        #region 添加课程
        // 显示各种控件
        public ActionResult CreateCourse()
        {
            return View();
        }

        // 提交所有内容
        [HttpPost]
        public ActionResult CreateCourse(string courseFaculty, string courseSpecialty, string courseId, decimal courseScore, int courseYear, string courseBook, string courseExist)
        {
            return RedirectToAction("ShowCourse", "Admin");
        }
        #endregion

        #region 更新课程
        // 删除课程
        public ActionResult DeleteCourse(string courseId)
        {
            // 1、使用courseId找出唯一的对象
            // 2、使用Remove方法删掉
            // 3、使用savechanges方法保存修改
            return RedirectToAction("ShowCourse", "Admin");
        }

        // 修改课程
        public ActionResult EditCourse(string courseId)
        {
            // 1、使用courseId找出唯一的对象
            // 2、将这个对象中所有的信息存入ViewBag或者ViewData中
            // 3、前端引用ViewBag、ViewData，展示信息
            return View();
        }
        #endregion

        #region 申请处理
        // 学生申请
        public ActionResult StudentRequest()
        {
            return View();
        }
        
        // 教师处理
        public ActionResult TeacherRequest()
        {
            return View();
        }
        #endregion

        #region 发布新闻公告
        // 显示所有控件
        public ActionResult CreateNews()
        {
            return View();
        }

        // 显示所有控件
        public ActionResult CreateNotice()
        {
            return View();
        }

        // 提交所有新闻内容
        [HttpPost]
        public ActionResult CreateNews(string newsTitle, string newsBrief, string newsDetail)
        {
            try
            {
                newsTitle = newsTitle.Trim(); newsBrief = newsBrief.Trim(); newsDetail = newsDetail.Trim();
                if (!string.IsNullOrEmpty(newsBrief) && string.IsNullOrEmpty(newsDetail))
                {
                    throw new Exception("没有填写新闻简介！");
                }
                else if (!string.IsNullOrEmpty(newsDetail) && string.IsNullOrEmpty(newsBrief))
                {
                    throw new Exception("没有填写新闻内容！");
                }
                else if (!string.IsNullOrEmpty(newsDetail) && !string.IsNullOrEmpty(newsBrief))
                {
                    throw new Exception("新闻内容和新闻简介都没有填写！");
                }
                // 确定路径 & 文件名称
                
                // 写入文件
                
                // 完成后跳转
                
            }
            catch (Exception ex) // 记录异常
            {
                ViewBag.ErrorMessage = ex.Message;
            }
            // 如果中间抛出异常会到这里
            return View();
        }

        //提交所有公告信息
        [HttpPost]
        public ActionResult CreateNotice(string noticeTitle, string noticeBrief, string noticeDetail)
        {
            return RedirectToAction("ShowNotice", "Admin");
        }
        #endregion

        #region 显示新闻公告
        // 显示新闻
        public ActionResult ShowNews()
        {
            return View();
        }

        // 显示公告
        public ActionResult ShowNotice()
        {
            return View();
        }

        // 查找新闻
        [HttpPost]
        public ActionResult ShowNews(string searchChoice, string searchContent)
        {
            return View();
        }

        // 查找公告
        [HttpPost]
        public ActionResult ShowNotice(string searchChoice, string searchContent)
        {
            return View();
        }
        #endregion

        #region 更新新闻公告
        // 修改新闻 - 显示所有控件
        public ActionResult EditNews(string newsId)
        {
            return View();
        }

        // 修改公告 - 显示所有控件
        public ActionResult EditNotice(string noticeId)
        {
            return View();
        }

        //  修改新闻 - 提交所有修改
        [HttpPost]
        public ActionResult EditNews (string newsId)
        {
            return RedirectToAction("ShowNews", "Admin");
        }

        // 修改公告 - 提交所有修改
        [HttpPost]

        #endregion

    }
}