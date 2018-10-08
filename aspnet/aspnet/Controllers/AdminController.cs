using aspnet.DBClasses;
using aspnet.Models;
using MvcPager;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace aspnet.Controllers
{
    public class AdminController : Controller
    {
        CourseModel courseModel = new CourseModel();
        #region 不知道写些什么的主页
        public ActionResult Index()
        {
            return View();
        }
        #endregion

        #region 显示课程
        public ActionResult ShowCourse()
        {
            var allCourse = (from s in courseModel.课程表 select s).OrderBy(s => s.课程编号);
            int courseCount = allCourse.Count();
            int pageSize = 2;
            ViewBag.PageNum = courseCount / pageSize;
            return View(allCourse);
        }

        [HttpPost]
        public ActionResult ShowCourse(string searchType, string fuzzySearch = "", string exactSearch = "")
        {
            var findCourse = (from s in courseModel.课程表 select s);
            try
            {
                if (searchType == "*请选择*")
                {
                    throw new Exception("未选择查找项！");
                }
                else
                {
                    if (searchType == "课程名称" && !string.IsNullOrEmpty(fuzzySearch))
                    {
                        findCourse = findCourse.Where(s => s.课程名称.Contains(fuzzySearch));
                    }
                    else if (searchType == "课程类型")
                    {
                        findCourse = findCourse.Where(s => s.课程类别.Contains(exactSearch));
                    }
                    else if (searchType == "课程简介" && !string.IsNullOrEmpty(fuzzySearch))
                    {
                        findCourse = findCourse.Where(s => s.课程简介.Contains(fuzzySearch));
                    }
                    else if (searchType == "教材出版社" && !string.IsNullOrEmpty(fuzzySearch))
                    {
                        findCourse = findCourse.Where(s => s.课程简介.Contains(fuzzySearch));
                    }
                    else
                    {
                        throw new Exception("未输入" + searchType + "！");
                    }
                }
            }
            catch (Exception ex)
            {
                ViewBag.Message = ex.Message;
            }
            return View(findCourse);
        }

        public ActionResult CourseDetail(int cno)
        {
            var targetCourse = (from s in courseModel.课程表 select s).SingleOrDefault(s => s.课程编号 == cno);
            return View(targetCourse);
        }
        #endregion

        #region 创建课程
        [ValidateInput(false)]
        public ActionResult CreateCourse()
        {
            return View();
        }

        // 1 - courseName = 课程名称 ----- string, not null
        // 2 - courseScore= 课程学分 ----- string, not null
        // 3 - publishHome= 教材出版社名称  string
        // 4 - content    = 课程简介 ----- string
        // 5 - courseType = 课程类别 ----- string, not null，仅限“专选课”、“选修课”、“必修课”
        // 6 - courseBook = 教材图片 HttpPostedFileBase，用于上传非文本
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult CreateCourse(string courseName, decimal courseScore, string publishHome, string courseType, string content, HttpPostedFileBase courseBook)
        {
            课程表 courseObj = new 课程表();
            courseObj.课程名称 = courseName;
            courseObj.课程学分 = courseScore;
            courseObj.教材出版社 = publishHome;
            courseObj.课程类别 = courseType;
            courseObj.课程简介 = content;
            // 处理courseBook
            SaveCourseBook(courseObj, courseName, courseScore, publishHome, courseType, content, courseBook);
            // 向数据库添加对象
            courseModel.课程表.Add(courseObj);
            courseModel.SaveChanges();
            return RedirectToAction("ShowCourse");
        }
        #endregion

        #region 修改课程信息
        static int COURSE_NO = 0;
        [ValidateInput(false)]
        public ActionResult EditCourse(int cno)
        {
            var targetCourse = (from s in courseModel.课程表 select s).SingleOrDefault(s => s.课程编号 == cno);
            COURSE_NO = cno;
            return View(targetCourse);
        }

        [ValidateInput(false)]
        [HttpPost]
        public ActionResult EditCourse(string courseName, decimal courseScore, string publishHome, string courseType, string content, HttpPostedFileBase courseBook)
        {
            var targetCourse = (from s in courseModel.课程表 select s).SingleOrDefault(s => s.课程编号 == COURSE_NO);
            targetCourse.课程名称 = courseName.Trim();
            targetCourse.课程学分 = courseScore;
            targetCourse.教材出版社 = publishHome.Trim();
            targetCourse.课程类别 = courseType.Trim();
            targetCourse.课程简介 = content.Trim();
            // 处理courseBook
            SaveCourseBook(targetCourse, courseName, courseScore, publishHome, courseType, content, courseBook);
            courseModel.SaveChanges();
            return RedirectToAction("ShowCourse");
        }

        // 处理courseBook
        public void SaveCourseBook(课程表 obj, string courseName, decimal courseScore, string publishHome, string courseType, string content, HttpPostedFileBase courseBook)
        {
            // 保存路径
            string savePath = Server.MapPath("~/images/CourseBooks/");
            // 没有就创建
            if (!Directory.Exists(savePath))
            {
                Directory.CreateDirectory(savePath);
            }
            // 为照片命名
            string addons = string.Empty;
            if (courseBook == null)
            {
                addons = "暂无图片.png";
            }
            else
            {
                addons = "由" + publishHome.Replace(" ", string.Empty) + "出版的" + courseName.Replace(" ", string.Empty) + courseBook.FileName.Substring(courseBook.FileName.IndexOf('.'));
                // 在路径上添加
                savePath += addons;
                // 保存
                courseBook.SaveAs(savePath);
            }
            // 最后在数据库里面添加后半段
            obj.教材图片路径 = addons;
        }
        #endregion

        #region 删除课程信息
        public ActionResult DeleteCourse(int cno)
        {
            var targetCourse = (from s in courseModel.课程表 select s).SingleOrDefault(s => s.课程编号 == cno);
            courseModel.课程表.Remove(targetCourse);
            courseModel.SaveChanges();
            return RedirectToAction("ShowCourse");
        }
        #endregion
    }
}