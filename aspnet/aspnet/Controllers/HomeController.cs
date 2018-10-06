using aspnet.DBClasses;
using aspnet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace aspnet.Controllers
{
    public class HomeController : Controller
    {
        // 包含新闻表和公告表
        NewsModel news = new NewsModel();
        public ActionResult Home()
        {
            // 将新闻表和公告表逐行添加进集合
            List<News> newsList = new List<News>();
            List<Notice> noticeList = new List<Notice>();
            foreach (var item in news.新闻表)
            {
                News newsObj = new News();
                newsObj.新闻编号 = item.新闻编号;
                newsObj.新闻标题 = item.新闻标题;
                newsObj.新闻内容 = item.新闻内容;
                newsObj.发布时间 = item.发布时间;
                if (item.修改时间 != null)
                {
                    newsObj.修改时间 = Convert.ToDateTime(item.修改时间);
                }
                newsList.Add(newsObj);
            }
            foreach (var item in news.公告表)
            {
                Notice noticeObj = new Notice();
                noticeObj.公告编号 = item.公告编号;
                noticeObj.公告标题 = item.公告标题;
                noticeObj.公告内容 = item.公告内容;
                noticeObj.发布时间 = item.发布时间;
                if (item.修改时间 != null)
                {
                    noticeObj.修改时间 = Convert.ToDateTime(item.修改时间);
                }
                noticeList.Add(noticeObj);
            }
            // 将集合中的内容放入ViewData中传给前端
            ViewData["news"] = newsList;
            ViewData["notice"] = noticeList;
            return View();
        }
    }
}