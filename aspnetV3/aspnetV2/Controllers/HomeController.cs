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
    public class HomeController : Controller
    {
        /// <summary>
        /// 首页：
        ///     1、轮播图
        ///     2、课程中心
        ///     3、登陆通道
        /// </summary>
        /// <returns></returns>

        asp allData = new asp();
        public ActionResult Home()
        {
            // 新闻
            var news = from s in allData.新闻视图 select s;
            ViewData["news"] = news;
            // 公告
            var notice = from s in allData.公告视图 select s;
            ViewData["notice"] = notice;
            // 课程
            var course = from s in allData.全部课程教材对照视图 select s;
            ViewData["course"] = course;
            return View();
        }

        // 课程详细页
        public ActionResult CourseDetail(string courseId)
        {
            var course = (from s in allData.全部课程教材对照视图 select s).SingleOrDefault(s => s.课程代码.Equals(courseId));
            return View(course);
        }

        // 公告详细页
        public ActionResult NoticeDetail(int noticeId)
        {
            var notice = (from s in allData.公告视图 select s).SingleOrDefault(s => s.编号 == noticeId);
            // 查找文件位置
            string docPath = Server.MapPath("~/Docs/Notice/");
            string fileName = notice.文件路径;
            // 读取文件
            try
            {
                StreamReader sr = new StreamReader(docPath + fileName, Encoding.Default);
                string temps = string.Empty;
                // 使用循环将读取的内容放入字符串变量temps中，并判断是否为空
                // 如果为空，说明读取结束，跳出循环
                while ((temps = sr.ReadLine()) != null)
                {
                    ViewBag.Line += temps.ToString();
                    // 存入ViewBag的Line对象中作为textarea控件的预置文本内容（！必要注释）
                }
                sr.Close();
            }
            catch (Exception e) // 异常处理。当找不到文件或文件为空时执行。
            {
                ViewBag.ErrorMessage = e.Message;
                ViewBag.Line += "暂无详细介绍。";
            }
            return View(notice);
        }

        // 新闻详细页
        public ActionResult NewsDetail(int newsId)
        {
            var news = (from s in allData.新闻视图 select s).SingleOrDefault(s => s.编号 == newsId);
            // 查找文件位置
            string docPath = Server.MapPath("~/Docs/News/");
            string fileName = news.文件路径;
            // 读取文件
            try
            {
                StreamReader sr = new StreamReader(docPath + fileName, Encoding.Default);
                string temps = string.Empty;
                // 使用循环将读取的内容放入字符串变量temps中，并判断是否为空
                // 如果为空，说明读取结束，跳出循环
                while ((temps = sr.ReadLine()) != null)
                {
                    ViewBag.Line += temps.ToString();
                    // 存入ViewBag的Line对象中作为textarea控件的预置文本内容
                }
                sr.Close();
            }
            catch (Exception e) // 异常处理。当找不到文件或文件为空时执行。
            {
                ViewBag.ErrorMessage = e.Message;
                ViewBag.Line += "暂无详细介绍。";
            }
            return View(news);
        }
    }
}