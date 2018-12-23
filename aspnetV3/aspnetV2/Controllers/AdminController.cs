using aspnetV2.Models;
using PagedList;
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
        /// 五、分配教师
        ///     1、让教师去教什么课
        /// 六、学生信息
        ///     1、查看
        ///     2、修改
        ///     3、添加
        ///     4、删除
        /// 七、个人信息
        ///     1、查看个人信息
        ///     2、修改个人信息
        /// </summary>

        asp allData = new asp();
        identity addons = new identity();
        #region 系统开关
        // 系统开关
        public ActionResult Switch()
        {
            string savePath = Server.MapPath("~/Docs/Switch/");
            string fileName = "switch.txt";
            StreamReader sr = new StreamReader(savePath + fileName, Encoding.Default);
            string temps = string.Empty;
            // 使用循环将读取的内容放入字符串变量temps中，并判断是否为空
            // 如果为空，说明读取结束，跳出循环
            while ((temps = sr.ReadLine()) != null)
            {
                ViewBag.Line += temps.ToString();
                // 存入ViewBag的Line对象中作为textarea控件的预置文本内容
            }
            sr.Close();

            if (ViewBag.Line == "开")
            {
                ViewBag.Another = "关";
            }
            else
            {
                ViewBag.Another = "开";
            }
            return View();
        }

        [HttpPost]
        public ActionResult Switch(string verifycode, string switchState)
        {
            FileStream fs = null;
            try
            {
                if (Session["session_verifycode"].Equals(verifycode))
                {
                    string savePath = Server.MapPath("~/Docs/Switch/");
                    string fileName = "switch.txt";
                    fs = new FileStream(savePath + fileName, FileMode.OpenOrCreate);
                    byte[] content = Encoding.Default.GetBytes(switchState);
                    fs.Write(content, 0, content.Length);
                    return RedirectToAction("ShowCourse", "Admin");
                }
                else
                {
                    throw new Exception("验证码错误！");
                }
            }
            catch (Exception e)
            {
                ViewBag.ErrorMessage = e.Message;
            }
            finally
            {
                fs.Flush();
                fs.Close();
            }
            return View();
        }
        #endregion

        #region 管理员个人信息
        // 查看个人信息
        public ActionResult AdminInfo()
        {
            string id = Session["account"].ToString();
            var admin = (from a in allData.管理员视图 select a).SingleOrDefault(s => s.账号.Equals(id));
            return View(admin);
        }

        // 修改个人信息
        public ActionResult EditSelfInfo()
        {
            // 找个人信息
            string id = Session["account"].ToString();
            var self = (from s in allData.管理员视图 select s).SingleOrDefault(s => s.账号.Equals(id));
            // 性别
            var sex = from s in allData.性别代码表 select s;
            List<SelectListItem> listSex = new List<SelectListItem>();
            foreach (var item in sex)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.性别代码,
                    Text = item.性别
                };
                listSex.Add(listItem);
            }
            SelectList selectSex = new SelectList(listSex, "Value", "Text");
            ViewBag.sex = selectSex;

            // 国家
            var country = from s in allData.国家代码表 select s;
            List<SelectListItem> listCou = new List<SelectListItem>();
            foreach (var item in country)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.国家代码,
                    Text = item.国家名称
                };
                listCou.Add(listItem);
            }
            SelectList selectCou = new SelectList(listCou, "Value", "Text");
            ViewBag.cou = selectCou;

            // 省份
            var province = from s in allData.省份代码表 select s;
            List<SelectListItem> listPro = new List<SelectListItem>();
            foreach (var item in province)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.省份代码,
                    Text = item.省份名称
                };
                listPro.Add(listItem);
            }
            SelectList selectPro = new SelectList(listPro, "Value", "Text");
            ViewBag.pro = selectPro;

            // 城市
            var city = from s in allData.城市代码表 select s;
            List<SelectListItem> listCit = new List<SelectListItem>();
            foreach (var item in city)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.城市代码,
                    Text = item.城市名称
                };
                listCit.Add(listItem);
            }
            SelectList selectCit = new SelectList(listCit, "Value", "Text");
            ViewBag.cit = selectCit;

            // 区县
            var area = from s in allData.区县代码表 select s;
            List<SelectListItem> listAre = new List<SelectListItem>();
            foreach (var item in area)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.区县代码,
                    Text = item.区县名称
                };
                listAre.Add(listItem);
            }
            SelectList selectAre = new SelectList(listAre, "Value", "Text");
            ViewBag.are = selectAre;

            // 传入前端展示
            return View(self);
        }


        // 修改个人信息
        [HttpPost]
        public ActionResult EditSelfInfo(string sex, string pwd, string faculty, string country, string province, string city, string area, string name)
        {
            string id = Session["account"].ToString();
            var self = (from s in allData.管理员表 select s).SingleOrDefault(s => s.账号.Equals(id));
            var pwdSelf = (from s in allData.密码表 select s).SingleOrDefault(s => s.账号.Equals(id));
            try
            {
                if (!pwd.Equals(string.Empty))
                {
                    if (pwd.Equals("123456"))
                    {
                        pwdSelf.密码 = pwd;
                    }
                    else
                    {
                        pwdSelf.密码 = MD5Helper.getStringMd5Hash(pwd);
                    }
                }
                if (!name.Equals(string.Empty))
                {
                    self.姓名 = name;
                }
                if (!sex.Equals(string.Empty))
                {
                    self.性别代码 = sex;
                }
                if (!country.Equals(string.Empty))
                {
                    self.国家代码 = country;
                }
                if (!province.Equals(string.Empty))
                {
                    self.省份代码 = province;
                }
                if (!city.Equals(string.Empty))
                {
                    self.城市代码 = city;
                }
                if (!area.Equals(string.Empty))
                {
                    self.区县代码 = area;
                }
                allData.SaveChanges();
                return RedirectToAction("AdminInfo", "Admin");
            }
            catch (Exception e)
            {
                ViewBag.ErrorMessage = e.Message;
            }
            // 如果成功修改，将会直接跳转到管理员个人详细页面
            // 如果修改失败，将会进行下面的代码
            // 性别
            var sexTable = from s in allData.性别代码表 select s;
            List<SelectListItem> listSex = new List<SelectListItem>();
            foreach (var item in sexTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.性别代码,
                    Text = item.性别
                };
                listSex.Add(listItem);
            }
            SelectList selectSex = new SelectList(listSex, "Value", "Text");
            ViewBag.sex = selectSex;

            // 国家
            var countryTable = from s in allData.国家代码表 select s;
            List<SelectListItem> listCou = new List<SelectListItem>();
            foreach (var item in countryTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.国家代码,
                    Text = item.国家名称
                };
                listCou.Add(listItem);
            }
            SelectList selectCou = new SelectList(listCou, "Value", "Text");
            ViewBag.cou = selectCou;

            // 省份
            var provinceTable = from s in allData.省份代码表 select s;
            List<SelectListItem> listPro = new List<SelectListItem>();
            foreach (var item in provinceTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.省份代码,
                    Text = item.省份名称
                };
                listPro.Add(listItem);
            }
            SelectList selectPro = new SelectList(listPro, "Value", "Text");
            ViewBag.pro = selectPro;

            // 城市
            var cityTable = from s in allData.城市代码表 select s;
            List<SelectListItem> listCit = new List<SelectListItem>();
            foreach (var item in cityTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.城市代码,
                    Text = item.城市名称
                };
                listCit.Add(listItem);
            }
            SelectList selectCit = new SelectList(listCit, "Value", "Text");
            ViewBag.cit = selectCit;

            // 区县
            var areaTable = from s in allData.区县代码表 select s;
            List<SelectListItem> listAre = new List<SelectListItem>();
            foreach (var item in areaTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.区县代码,
                    Text = item.区县名称
                };
                listAre.Add(listItem);
            }
            SelectList selectAre = new SelectList(listAre, "Value", "Text");
            ViewBag.are = selectAre;
            // 错误将会回到这里
            // 将找到的个人信息传入前端展示
            return View(self);
        }
        #endregion

        #region 显示课程
        // 显示课程
        public ActionResult ShowCourse(int page = 1)
        {
            const int pageSize = 8;
            // 将数据库中的内容放入SelectList中，传入前端，变成下拉框
            List<SelectListItem> listAllSelection = new List<SelectListItem>();
            var course = (from s in allData.全部课程教材对照视图 select s).OrderBy(s => s.课程代码).ToPagedList(page, pageSize);
            var courseType = from s in allData.课程类型代码表 select s;
            foreach (var item in courseType)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.课程类型代码,
                    Text = item.课程类型
                };
                listAllSelection.Add(listItem);
            }
            SelectList selectList = new SelectList(listAllSelection, "Value", "Text");
            ViewBag.select = selectList;
            return View(course);
        }

        // 查找课程
        [HttpPost]
        public ActionResult ShowCourse(string searchChoice, string searchContent, int page = 1)
        {
            const int pageSize = 8;
            var course = (from s in allData.全部课程教材对照视图 select s).OrderBy(s => s.课程代码).ToPagedList(page, pageSize);
            try
            {
                // 将数据库中的内容放入SelectList中，传入前端，变成下拉框
                List<SelectListItem> listAllSelection = new List<SelectListItem>();
                var courseType = from s in allData.课程类型代码表 select s;
                foreach (var item in courseType)
                {
                    SelectListItem listItem = new SelectListItem
                    {
                        Value = item.课程类型代码,
                        Text = item.课程类型
                    };
                    listAllSelection.Add(listItem);
                }
                SelectList selectList = new SelectList(listAllSelection, "Value", "Text");
                ViewBag.select = selectList;

                // 开始判断
                if (!string.IsNullOrEmpty(searchContent) && !string.Empty.Equals(searchChoice))
                {
                    course = course.Where(s => s.课程名称.Contains(searchContent)).Where(s => searchChoice.Equals(s.课程类型代码)).ToPagedList(page, pageSize);
                }
                else if (!string.IsNullOrEmpty(searchContent) && string.Empty.Equals(searchChoice))
                {
                    course = course.Where(s => s.课程名称.Contains(searchContent)).ToPagedList(page, pageSize);
                }
                else if (string.IsNullOrEmpty(searchContent) && !string.Empty.Equals(searchChoice))
                {
                    course = course.Where(s => searchChoice.Equals(s.课程类型代码)).ToPagedList(page, pageSize);
                }
            }
            catch (Exception e)
            {
                ViewBag.ErrorMessage = e.Message;
            }
            course = course.OrderBy(s => s.课程代码).ToPagedList(page, pageSize);
            return View(course);
        }

        // 详细页面
        public ActionResult CourseDetail(string courseId)
        {
            var course = (from s in allData.全部课程教材对照视图 select s).SingleOrDefault(s => courseId.Equals(s.课程代码));
            // 查找文件位置
            string docPath = Server.MapPath("~/Docs/Course/");
            string fileName = course.课程简介文档路径;
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
            return View(course);
        }
        #endregion

        #region 添加课程
        // 显示各种控件
        public ActionResult CreateCourse()
        {
            var scho = from s in allData.学校代码表 select s;
            var dept = from s in allData.院系代码表 select s;
            var spec = from s in allData.专业代码表 select s;
            var book = from s in allData.教材代码表 select s;
            // 将数据库中的内容放入SelectList中，传入前端，变成下拉框
            // 学校
            List<SelectListItem> listScho = new List<SelectListItem>();
            foreach (var item in scho)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.学校代码,
                    Text = item.学校名称
                };
                listScho.Add(listItem);
            }
            SelectList selectScho = new SelectList(listScho, "Value", "Text");
            ViewBag.scho = selectScho;

            // 院系
            List<SelectListItem> listDept = new List<SelectListItem>();
            foreach (var item in dept)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.院系代码,
                    Text = item.院系名称
                };
                listDept.Add(listItem);
            }
            SelectList selectDept = new SelectList(listDept, "Value", "Text");
            ViewBag.dept = selectDept;

            // 专业
            List<SelectListItem> listSpec = new List<SelectListItem>();
            foreach (var item in spec)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.专业代码,
                    Text = item.专业名称
                };
                listSpec.Add(listItem);
            }
            SelectList selectSpec = new SelectList(listSpec, "Value", "Text");
            ViewBag.spec = selectSpec;

            // 教材
            List<SelectListItem> listBook = new List<SelectListItem>();
            foreach (var item in book)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.教材代码,
                    Text = item.教材名称
                };
                listBook.Add(listItem);
            }
            SelectList selectBook = new SelectList(listBook, "Value", "Text");
            ViewBag.book = selectBook;

            // 课程类型
            var type = from s in allData.课程类型代码表 select s;
            List<SelectListItem> listType = new List<SelectListItem>();
            foreach (var item in type)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.课程类型代码,
                    Text = item.课程类型
                };
                listType.Add(listItem);
            }
            SelectList selectType = new SelectList(listType, "Value", "Text");
            ViewBag.type = selectType;

            return View();
        }

        // 提交所有内容
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult CreateCourse(string courseSchool, string courseFaculty, string courseSpecialty, string courseId, decimal courseScore, int courseYear, string courseBook, string courseBrief, string courseExist, string courseName, string courseType)
        {
            try
            {

                课程代码表 courseItem = new 课程代码表();
                if (string.IsNullOrEmpty(courseBrief))
                {
                    throw new Exception("没有填写课程简介！");
                }
                // 确定文件路径
                string savePath = Server.MapPath("~/Docs/Course/");
                // 确定文件名称
                string fileName = courseItem.所属学校代码 + courseItem.所属院系代码 + courseItem.所属专业代码 + courseId + ".txt";
                // 写入文件
                // 确定文件路径
                if (!Directory.Exists(savePath))
                {
                    Directory.CreateDirectory(savePath);
                }
                // 写入文件
                FileStream fs = new FileStream(savePath + fileName, FileMode.Create);
                byte[] content = Encoding.Default.GetBytes(courseBrief);
                fs.Write(content, 0, content.Length);
                fs.Flush();
                fs.Close();
                // 直接存入数据库的信息
                courseItem.课程简介文档路径 = fileName;
                courseItem.所属学校代码 = courseSchool;
                courseItem.课程名称 = courseName;
                courseItem.所属院系代码 = courseFaculty;
                courseItem.所属专业代码 = courseSpecialty;
                courseItem.课程代码 = courseItem.所属学校代码 + courseItem.所属院系代码 + courseItem.所属专业代码 + courseId;
                courseItem.课程学分 = courseScore;
                courseItem.课程上课学年 = courseYear;
                courseItem.教材代码 = courseBook;
                courseItem.是否启用 = courseExist;
                courseItem.课程类型代码 = courseType;

                // 将课程简介写入数据库
                allData.课程代码表.Add(courseItem);
                // 保存修改
                allData.SaveChanges();
                return RedirectToAction("ShowCourse", "Admin");
            }
            catch (Exception e)
            {
                ViewBag.ErrorMessage = e.Message;
            }
            // 如果抛出异常，将会回到此页面，所有需要加载的东西全部重新加载一遍：
            var scho = from s in allData.学校代码表 select s;
            var dept = from s in allData.院系代码表 select s;
            var spec = from s in allData.专业代码表 select s;
            var book = from s in allData.教材代码表 select s;
            // 将数据库中的内容放入SelectList中，传入前端，变成下拉框
            // 学校
            List<SelectListItem> listScho = new List<SelectListItem>();
            foreach (var item in scho)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.学校代码,
                    Text = item.学校名称
                };
                listScho.Add(listItem);
            }
            SelectList selectScho = new SelectList(listScho, "Value", "Text");
            ViewBag.scho = selectScho;

            // 院系
            List<SelectListItem> listDept = new List<SelectListItem>();
            foreach (var item in dept)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.院系代码,
                    Text = item.院系名称
                };
                listDept.Add(listItem);
            }
            SelectList selectDept = new SelectList(listDept, "Value", "Text");
            ViewBag.dept = selectDept;

            // 专业
            List<SelectListItem> listSpec = new List<SelectListItem>();
            foreach (var item in spec)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.专业代码,
                    Text = item.专业名称
                };
                listSpec.Add(listItem);
            }
            SelectList selectSpec = new SelectList(listSpec, "Value", "Text");
            ViewBag.spec = selectSpec;

            // 教材
            List<SelectListItem> listBook = new List<SelectListItem>();
            foreach (var item in book)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.教材代码,
                    Text = item.教材名称
                };
                listBook.Add(listItem);
            }
            SelectList selectBook = new SelectList(listBook, "Value", "Text");
            ViewBag.book = selectBook;
            // 刷新
            return View();
        }



        // 学校院系专业下拉框三级联动
        // 学校找院系
        public ActionResult SelectFaculty(string schoolId)
        {
            List<院系代码表> list = new List<院系代码表>();
            var selectDept = (from s in allData.院系代码表 select s).Where(s => s.所在学校代码.Equals(schoolId));
            foreach (var item in selectDept)
            {
                院系代码表 dept = new 院系代码表();
                dept.院系代码 = item.院系代码;
                dept.院系名称 = item.院系名称;
                list.Add(dept);
            }
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        // 学校、院系找专业
        // 由于我们的院系代码是学校代码+自主规划的代码，所以不需要传入两个参数，一个院系代码就够了
        public ActionResult SelectSpecialty(string facultyId)
        {
            List<专业代码表> list = new List<专业代码表>();
            var selectSpec = (from s in allData.专业代码表 select s).Where(s => s.所在院系代码.Equals(facultyId));
            foreach (var item in selectSpec)
            {
                专业代码表 spec = new 专业代码表();
                spec.专业代码 = item.专业代码;
                spec.专业名称 = item.专业名称;
                list.Add(spec);
            }
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        #endregion

        #region 更新课程
        // 删除课程
        public ActionResult DeleteCourse(string courseId)
        {
            try
            {
                // 1、使用courseId找出唯一的对象
                var db = (from s in allData.课程代码表 select s).SingleOrDefault(s => s.课程代码.Equals(courseId));
                // 查找文件位置
                string docPath = Server.MapPath("~/Docs/Course/");
                string fileName = db.课程简介文档路径;
                System.IO.File.Delete(docPath + fileName);
                // 2、使用Remove方法删掉
                allData.课程代码表.Remove(db);
                // 3、使用savechanges方法保存修改
                allData.SaveChanges();
                return RedirectToAction("ShowCourse", "Admin");
            }
            catch (Exception e) // 异常处理
            {
                ViewBag.ErrorMessage = e.Message;
            }
            return View();
        }

        // 修改课程
        public ActionResult EditCourse(string courseId)
        {
            var course = (from s in allData.全部课程教材对照视图 select s).SingleOrDefault(s => courseId.Equals(s.课程代码));
            ViewBag.Code = courseId;
            ViewBag.Name = course.课程名称;

            // 教材
            var book = from s in allData.教材代码表 select s;
            List<SelectListItem> listBook = new List<SelectListItem>();
            foreach (var item in book)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.教材代码,
                    Text = item.教材名称
                };
                listBook.Add(listItem);
            }
            SelectList selectBook = new SelectList(listBook, "Value", "Text");
            ViewBag.book = selectBook;

            // 课程类型
            var type = from s in allData.课程类型代码表 select s;
            List<SelectListItem> listType = new List<SelectListItem>();
            foreach (var item in type)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.课程类型代码,
                    Text = item.课程类型
                };
                listType.Add(listItem);
            }
            SelectList selectType = new SelectList(listType, "Value", "Text");
            ViewBag.type = selectType;

            // 查找文件位置
            string docPath = Server.MapPath("~/Docs/Course/");
            string fileName = course.课程简介文档路径;
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
            return View(course);
        }

        // 修改课程 -- 提交修改
        [ValidateInputAttribute(false)]
        [HttpPost]
        public ActionResult EditCourse(string courseId, string courseName, decimal courseScore, int courseYear, string courseBrief, string courseBook, string courseType, string courseExist)
        {

            FileStream fs = null; // 暂时置空，以便后面赋值（非必要注释）
            try
            {
                // 将修改过的信息存入数据库中
                课程代码表 db = new 课程代码表();
                db = (from s in allData.课程代码表 select s).SingleOrDefault(s => s.课程代码 == courseId);
                db.课程学分 = courseScore;
                db.课程名称 = courseName;
                db.课程上课学年 = courseYear;
                db.教材代码 = courseBook;
                db.课程类型代码 = courseType;
                db.是否启用 = courseExist;
                // 查找文件位置
                string docPath = Server.MapPath("~/Docs/Course/");
                string fileName = db.课程简介文档路径;
                //FileStream fs = null; // 暂时置空，以便后面赋值（非必要注释）
                byte[] content = null;
                // 向文件中写入新的内容
                // 找到当前文件位置后重新创建文件
                System.IO.File.Delete(docPath + fileName);
                fs = new FileStream(docPath + fileName, FileMode.OpenOrCreate);
                content = Encoding.Default.GetBytes(courseBrief);
                // 写入
                fs.Write(content, 0, content.Length);
                fs.Flush();
                fs.Close();
                // 保存修改过的数据
                allData.SaveChanges();
                return RedirectToAction("ShowCourse", "Admin");
            }
            catch (Exception e) // 异常处理（非必要注释）
            {
                ViewBag.ErrorMessage = e.Message;
            }
            // 如果抛出异常，将会回到此页面，所有需要加载的东西全部重新加载一遍：
            var book = from s in allData.教材代码表 select s;
            // 将数据库中的内容放入SelectList中，传入前端，变成下拉框
            // 教材
            List<SelectListItem> listBook = new List<SelectListItem>();
            foreach (var item in book)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.教材代码,
                    Text = item.教材名称
                };
                listBook.Add(listItem);
            }
            SelectList selectBook = new SelectList(listBook, "Value", "Text");
            ViewBag.book = selectBook;
            // 刷新
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
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult CreateNews(string newsTitle, string newsBrief, string newsDetail, string newsOpen)
        {

            try
            {
                if (!string.IsNullOrEmpty(newsBrief) && string.IsNullOrEmpty(newsDetail))
                {
                    throw new Exception("没有填写新闻内容！");
                }
                else if (!string.IsNullOrEmpty(newsDetail) && string.IsNullOrEmpty(newsBrief))
                {
                    throw new Exception("没有填写新闻简介！");
                }
                else if (string.IsNullOrEmpty(newsDetail) && string.IsNullOrEmpty(newsBrief))
                {
                    throw new Exception("新闻内容和新闻简介都没有填写！");
                }
                string uploadTimeString = FileHelper.DateTimeFileName();
                // 确认没有错误将会执行下列语句
                // 确定文件路径
                string savePath = Server.MapPath("~/Docs/News/" + uploadTimeString + "/");
                // 确定文件名称
                string fileName = newsTitle + ".txt";
                // 写入文件
                FileHelper.WriteDetail(newsDetail, savePath, fileName);
                // 存入数据库
                新闻公告表 news = new 新闻公告表();
                // 完成后跳转
                news.标题 = newsTitle;
                news.简介 = newsBrief;
                news.文件路径 = uploadTimeString + "/" + fileName;
                news.文件类型代码 = "00"; // 新闻 -- 00
                news.上传时间 = DateTime.Now;
                news.修改时间 = news.上传时间;
                news.是否外部展示 = newsOpen;
                allData.新闻公告表.Add(news);
                allData.SaveChanges();
                return RedirectToAction("ShowNews", "Admin");
            }
            catch (Exception ex) // 记录异常
            {
                ViewBag.ErrorMessage = ex.Message;
            }
            // 如果中间抛出异常会到这里
            return View();
        }

        //提交所有公告信息
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult CreateNotice(string noticeTitle, string noticeBrief, string noticeDetail, string noticeOpen)
        {
            try
            {
                if (!string.IsNullOrEmpty(noticeBrief) && string.IsNullOrEmpty(noticeDetail))
                {
                    throw new Exception("没有填写公告内容！");
                }
                else if (!string.IsNullOrEmpty(noticeDetail) && string.IsNullOrEmpty(noticeBrief))
                {
                    throw new Exception("没有填写公告简介！");
                }
                else if (string.IsNullOrEmpty(noticeDetail) && string.IsNullOrEmpty(noticeBrief))
                {
                    throw new Exception("公告内容和公告简介都没有填写！");
                }
                string uploadTimeString = FileHelper.DateTimeFileName();
                // 确认没有错误将会执行下列语句
                // 确定文件路径
                string savePath = Server.MapPath("~/Docs/Notice/" + uploadTimeString + "/");
                // 确定文件名称
                string fileName = noticeTitle + ".txt";
                // 写入文件
                FileHelper.WriteDetail(noticeDetail, savePath, fileName);
                // 存入数据库
                新闻公告表 notice = new 新闻公告表();
                // 完成后跳转
                notice.标题 = noticeTitle;
                notice.简介 = noticeBrief;
                notice.文件路径 = uploadTimeString + "/" + fileName;
                notice.文件类型代码 = "10"; // 公告 -- 10
                notice.上传时间 = DateTime.Now;
                notice.修改时间 = notice.上传时间;
                notice.是否外部展示 = noticeOpen;
                allData.新闻公告表.Add(notice);
                allData.SaveChanges();
                return RedirectToAction("ShowNotice", "Admin");
            }
            catch (Exception ex) // 记录异常
            {
                ViewBag.ErrorMessage = ex.Message;
            }
            // 如果中间抛出异常会到这里
            return View();
        }
        #endregion

        #region 显示新闻公告
        // 显示新闻
        public ActionResult ShowNews(int page = 1)
        {
            const int pageSize = 15;
            var news = (from n in allData.新闻视图 select n).OrderByDescending(s => s.上传时间).ToPagedList(page, pageSize);
            return View(news);
        }

        // 显示公告
        public ActionResult ShowNotice(int page = 1)
        {
            const int pageSize = 8;
            var notice = (from n in allData.公告视图 select n).OrderByDescending(s => s.上传时间).ToPagedList(page, pageSize);
            return View(notice);
        }

        #region 详细信息
        // 新闻详细信息
        public ActionResult NewsDetail(int newsId)
        {
            var news = (from s in allData.新闻视图 select s).SingleOrDefault(s => newsId.Equals(s.编号));

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

        //公告详细信息
        public ActionResult NoticeDetail(int noticeId)
        {
            var notice = (from s in allData.公告视图 select s).SingleOrDefault(s => noticeId.Equals(s.编号));
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
        #endregion

        #endregion

        #region 更新新闻公告
        // 修改新闻 - 显示所有控件
        public ActionResult EditNews(int newsId)
        {
            // 通过newsId查找当前新闻所在数据库的位置
            var news = (from n in allData.新闻视图 select n).SingleOrDefault(n => n.编号 == newsId);
            // 显示新闻的标题和简介
            ViewBag.newsTitle = news.标题;
            ViewBag.newsBrief = news.简介;

            // 显示新闻的内容
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
                    // 存入ViewBag的Line对象中作为textarea控件的预置文本内容（！必要注释）
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

        // 修改公告 - 显示所有控件
        public ActionResult EditNotice(int noticeId)
        {
            // 通过noticeId查找当前新闻所在数据库的位置
            var notice = (from n in allData.公告视图 select n).SingleOrDefault(n => n.编号 == noticeId);
            // 显示公告的标题和简介
            ViewBag.noticeTitle = notice.标题;
            ViewBag.noticeBrief = notice.简介;
            // 查找文件位置
            string docPath = Server.MapPath("~/Docs/Notice/");
            string fileName = notice.文件路径;
            // 读取文件
            StreamReader sr = null;
            try
            {
                sr = new StreamReader(docPath + fileName, Encoding.Default);
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

        //  修改新闻 - 提交所有修改
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult EditNews(string newsTitle, string newsBrief, string newsDetail)
        {
            try
            {
                // 将修改过的信息存入数据库中
                新闻公告表 db = new 新闻公告表();
                db = (from s in allData.新闻公告表 select s).SingleOrDefault(s => s.标题 == newsTitle);
                db.简介 = newsBrief;
                db.修改时间 = DateTime.Now;
                // 查找文件位置
                string docPath = Server.MapPath("~/Docs/News/");
                string fileName = db.文件路径;
                FileHelper.WriteDetail(newsDetail, docPath, fileName);
                // 保存修改过的数据
                allData.SaveChanges();
                return RedirectToAction("ShowNews", "Admin");
            }
            catch (Exception e) // 异常处理
            {
                ViewBag.ErrorMessage = e.Message;
            }
            return View();
        }

        // 修改公告 - 提交所有修改
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult EditNotice(string noticeTitle, string noticeBrief, string noticeDetail)
        {
            try
            {
                // 将修改过的信息存入数据库中
                新闻公告表 db = new 新闻公告表();
                db = (from s in allData.新闻公告表 select s).SingleOrDefault(s => s.标题 == noticeTitle);
                db.简介 = noticeBrief;
                db.修改时间 = DateTime.Now;
                // 查找文件位置
                string docPath = Server.MapPath("~/Docs/Notice/");
                string fileName = db.文件路径;
                FileHelper.WriteDetail(noticeDetail, docPath, fileName);
                // 保存修改过的数据
                allData.SaveChanges();
                return RedirectToAction("ShowNotice", "Admin");
            }
            catch (Exception e) // 异常处理
            {
                ViewBag.ErrorMessage = e.Message;
            }
            return View();
        }

        // 删除新闻
        public ActionResult DeleteNews(int newsId)
        {
            // 1、使用courseId找出唯一的对象
            新闻公告表 db = new 新闻公告表();
            db = (from s in allData.新闻公告表 select s).SingleOrDefault(s => s.编号 == newsId);
            // 2、使用Remove方法删掉
            allData.新闻公告表.Remove(db);
            // 3、使用savechanges方法保存修改
            allData.SaveChanges();
            return RedirectToAction("ShowNews", "Admin");
        }

        // 删除公告
        public ActionResult DeleteNotice(int noticeId)
        {
            // 1、使用noticeId找出唯一的对象
            新闻公告表 db = new 新闻公告表();
            db = (from n in allData.新闻公告表 select n).SingleOrDefault(s => s.编号 == noticeId);
            // 2、使用Remove方法删掉
            allData.新闻公告表.Remove(db);
            // 3、使用savechanges方法保存修改
            allData.SaveChanges();
            return RedirectToAction("ShowNotice", "Admin");
        }

        #endregion

        #region 分配课程
        // 查看课程信息
        public ActionResult ShowAssign(int page = 1)
        {
            const int pageSize = 5;
            var assign = (from a in allData.选课视图 select a).OrderBy(s => s.选课代码).ToPagedList(page, pageSize);
            return View(assign);
        }

        // 分配课程 -- 显示空间
        public ActionResult AssignCourse()
        {
            var cour = from s in allData.课程代码表 select s;
            var teac = from s in allData.教师表 select s;
            // 将数据库中的内容放入SelectList中，传入前端，变成下拉框
            // 课程
            List<SelectListItem> listCour = new List<SelectListItem>();
            foreach (var item in cour)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.课程代码,
                    Text = item.课程名称
                };
                listCour.Add(listItem);
            }
            SelectList selectCour = new SelectList(listCour, "Value", "Text");
            ViewBag.cour = selectCour;

            // 教师
            List<SelectListItem> listTeac = new List<SelectListItem>();
            foreach (var item in teac)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.教师工号,
                    Text = item.教师姓名
                };
                listTeac.Add(listItem);
            }
            SelectList selectTeac = new SelectList(listTeac, "Value", "Text");
            ViewBag.teac = selectTeac;

            return View();
        }


        // 分配课程 -- 提交
        [HttpPost]
        public ActionResult AssignCourse(string courseId, string teacherId, int number, string assginOpen)
        {
            try
            {
                选择课程表 assign = new 选择课程表();
                var course = (from c in allData.全部课程教材对照视图 select c).SingleOrDefault(c => c.课程代码.Equals(courseId));
                // 直接存入数据库的信息
                assign.课程代码 = courseId;
                assign.授课教师账号 = teacherId;
                assign.选课代码 = courseId + teacherId;
                assign.计划开班人数 = number;
                assign.是否启用 = assginOpen;
                assign.所属学校代码 = course.所属学校代码;
                assign.所属院系代码 = course.所属院系代码;
                // 将课程简介写入数据库
                allData.选择课程表.Add(assign);
                // 保存修改
                allData.SaveChanges();
                return RedirectToAction("ShowAssign", "Admin");
            }
            catch (Exception e)
            {
                ViewBag.ErrorMessage = e.Message;
            }
            // 如果抛出异常，将会回到此页面，所有需要加载的东西全部重新加载一遍：
            var cour = from s in allData.课程代码表 select s;
            var teac = from s in allData.教师表 select s;
            // 将数据库中的内容放入SelectList中，传入前端，变成下拉框
            // 课程
            List<SelectListItem> listCour = new List<SelectListItem>();
            foreach (var item in cour)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.课程代码,
                    Text = item.课程名称
                };
                listCour.Add(listItem);
            }
            SelectList selectCour = new SelectList(listCour, "Value", "Text");
            ViewBag.cour = selectCour;

            // 教师
            List<SelectListItem> listTeac = new List<SelectListItem>();
            foreach (var item in teac)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.教师工号,
                    Text = item.教师姓名
                };
                listTeac.Add(listItem);
            }
            SelectList selectTeac = new SelectList(listTeac, "Value", "Text");
            ViewBag.teac = selectTeac;

            // 刷新
            return View();
        }

        #endregion

        #region 学生信息
        // 添加
        public ActionResult CreateStudent()
        {
            var idCard = from id in allData.身份证类别代码表 select id;
            var sex = from s in allData.性别代码表 select s;
            // 将数据库中的内容放入SelectList中，传入前端，变成下拉框

            // 证件号
            List<SelectListItem> listId = new List<SelectListItem>();
            foreach (var item in idCard)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.身份证类别代码,
                    Text = item.身份证类别名称
                };
                listId.Add(listItem);
            }
            SelectList selectId = new SelectList(listId, "Value", "Text");
            ViewBag.idCard = selectId;

            // 性别
            List<SelectListItem> listSex = new List<SelectListItem>();
            foreach (var item in sex)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.性别代码,
                    Text = item.性别
                };
                listSex.Add(listItem);
            }
            SelectList selectSex = new SelectList(listSex, "Value", "Text");
            ViewBag.sex = selectSex;
            return View();
        }

        // 提交添加
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult CreateStudent(string Sno, string Sname, string idType, string id, string sex, string studentExist)
        {
            学生表 student = new 学生表();
            密码表 password = new 密码表();
            身份对照表 studentIdentity = new 身份对照表();
            try
            {
                // 直接存入数据库的信息
                // 先存密码表信息
                password.账号 = Sno;
                password.密码 = "123456";
                allData.密码表.Add(password);
                // 身份信息
                studentIdentity.账号 = Sno;
                studentIdentity.身份代码 = "01";
                // 再存学生表信息
                student.学生学号 = Sno;
                student.学生姓名 = Sname;
                student.身份证类别代码 = idType;
                student.身份证号 = id;
                student.性别代码 = sex;
                student.是否启用 = studentExist;
                student.国家代码 = "457";
                student.省份代码 = "420000";
                student.城市代码 = "420100";
                student.区县代码 = "420102";
                student.所在学校代码 = "10512";
                student.所在院系代码 = "1051201";
                student.所在专业代码 = "105120101";
                student.户籍代码 = "01";
                student.婚配代码 = "01";
                student.学习层次代码 = "51";
                student.政治面貌代码 = "50";
                // 将课程简介写入数据库
                allData.密码表.Add(password);
                addons.身份对照表.Add(studentIdentity);
                allData.学生表.Add(student);
                // 保存修改
                allData.SaveChanges();
                addons.SaveChanges();
                return RedirectToAction("RetrieveStudent", "Admin");
            }
            catch (Exception e)
            {
                ViewBag.ErrorMessage = e.Message;
            }
            // 如果抛出异常，将会回到此页面，所有需要加载的东西全部重新加载一遍：
            var idCard = from i in allData.身份证类别代码表 select i;
            var Ssex = from s in allData.性别代码表 select s;
            // 将数据库中的内容放入SelectList中，传入前端，变成下拉框
            // 证件类型
            List<SelectListItem> listIdType = new List<SelectListItem>();
            foreach (var item in idCard)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.身份证类别代码,
                    Text = item.身份证类别名称
                };
                listIdType.Add(listItem);
            }
            SelectList selectIdType = new SelectList(listIdType, "Value", "Text");
            ViewBag.idType = selectIdType;
            // 性别
            List<SelectListItem> listSex = new List<SelectListItem>();
            foreach (var item in Ssex)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.性别代码,
                    Text = item.性别
                };
                listSex.Add(listItem);
            }
            SelectList selectSex = new SelectList(listSex, "Value", "Text");
            ViewBag.sex = selectSex;
            // 刷新
            return View();
        }


        // 修改
        // 修改学生信息
        public ActionResult EditStudentInfo(string studentId)
        {
            // 性别
            var sex = from s in allData.性别代码表 select s;
            List<SelectListItem> listSex = new List<SelectListItem>();
            foreach (var item in sex)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.性别代码,
                    Text = item.性别
                };
                listSex.Add(listItem);
            }
            SelectList selectSex = new SelectList(listSex, "Value", "Text");
            ViewBag.sex = selectSex;

            // 国家
            var country = from s in allData.国家代码表 select s;
            List<SelectListItem> listCou = new List<SelectListItem>();
            foreach (var item in country)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.国家代码,
                    Text = item.国家名称
                };
                listCou.Add(listItem);
            }
            SelectList selectCou = new SelectList(listCou, "Value", "Text");
            ViewBag.cou = selectCou;

            // 省份
            var province = from s in allData.省份代码表 select s;
            List<SelectListItem> listPro = new List<SelectListItem>();
            foreach (var item in province)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.省份代码,
                    Text = item.省份名称
                };
                listPro.Add(listItem);
            }
            SelectList selectPro = new SelectList(listPro, "Value", "Text");
            ViewBag.pro = selectPro;

            // 城市
            var city = from s in allData.城市代码表 select s;
            List<SelectListItem> listCit = new List<SelectListItem>();
            foreach (var item in city)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.城市代码,
                    Text = item.城市名称
                };
                listCit.Add(listItem);
            }
            SelectList selectCit = new SelectList(listCit, "Value", "Text");
            ViewBag.cit = selectCit;

            // 区县
            var area = from s in allData.区县代码表 select s;
            List<SelectListItem> listAre = new List<SelectListItem>();
            foreach (var item in area)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.区县代码,
                    Text = item.区县名称
                };
                listAre.Add(listItem);
            }
            SelectList selectAre = new SelectList(listAre, "Value", "Text");
            ViewBag.are = selectAre;

            // 学习层次
            var arrange = from s in allData.学习层次代码表 select s;
            List<SelectListItem> listArr = new List<SelectListItem>();
            foreach (var item in arrange)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.学习层次代码,
                    Text = item.学习层次
                };
                listArr.Add(listItem);
                SelectList selectArr = new SelectList(listArr, "Value", "Text");
                ViewBag.arr = selectArr;
            }

            // 婚配代码
            var marry = from s in allData.婚配代码表 select s;
            List<SelectListItem> listMar = new List<SelectListItem>();
            foreach (var item in marry)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.婚配代码,
                    Text = item.婚配情况
                };
                listMar.Add(listItem);
                SelectList selectMar = new SelectList(listMar, "Value", "Text");
                ViewBag.mar = selectMar;
            }

            // 户籍信息
            var household = from s in allData.户籍代码表 select s;
            List<SelectListItem> listHol = new List<SelectListItem>();
            foreach (var item in household)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.户籍代码,
                    Text = item.户籍名称
                };
                listHol.Add(listItem);
                SelectList selectHol = new SelectList(listHol, "Value", "Text");
                ViewBag.hol = selectHol;
            }

            // 政治面貌
            var policy = from s in allData.政治面貌代码表 select s;
            List<SelectListItem> listPol = new List<SelectListItem>();
            foreach (var item in policy)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.政治面貌代码,
                    Text = item.政治面貌类型
                };
                listPol.Add(listItem);
                SelectList selectPol = new SelectList(listPol, "Value", "Text");
                ViewBag.pol = selectPol;
            }
            // 找个人信息
            var self = (from s in allData.学生详细信息视图 select s).SingleOrDefault(s => s.学生学号.Equals(studentId));
            // 传入前端展示
            return View(self);
        }

        [HttpPost]
        public ActionResult EditStudentInfo(string sno, string sex, string change, string birth, string doubleMajor, string country, string province, string city, string area, string arrange, string marry, string household, string tel, string qq, string mail, string policy, HttpPostedFileBase photo)
        {
            var self = (from s in allData.学生表 select s).SingleOrDefault(s => s.学生学号.Equals(sno));
            string studentName = self.学生姓名;
            string savePath = Server.MapPath("~/images/StudentPicture/");
            if (!Directory.Exists(savePath))
            {
                Directory.CreateDirectory(savePath);
            }
            photo = Request.Files["photo"];
            try
            {
                self.身份证类别代码 = self.身份证类别代码;
                self.身份证号 = self.身份证号;
                if (!birth.Equals(""))
                {
                    self.出生日期 = Convert.ToDateTime(birth);
                }
                if (!sex.Equals(string.Empty))
                {
                    self.性别代码 = sex;
                }
                if (!photo.FileName.Equals(string.Empty))
                {
                    string fileType = photo.FileName.Split(new char[1] { '.' }, StringSplitOptions.RemoveEmptyEntries)[1];
                    string fileName = studentName + sno + "." + fileType;
                    photo.SaveAs(savePath + fileName);
                    self.证件照片路径 = fileName;
                }
                self.是否转专业 = change;
                //self.出生日期 = Convert.ToDateTime(birth);
                self.是否双学位 = doubleMajor;
                if (!country.Equals(string.Empty))
                {
                    self.国家代码 = country;
                }
                if (!province.Equals(string.Empty))
                {
                    self.省份代码 = province;
                }
                if (!city.Equals(string.Empty))
                {
                    self.城市代码 = city;
                }
                if (!area.Equals(string.Empty))
                {
                    self.区县代码 = area;
                }
                if (!arrange.Equals(string.Empty))
                {
                    self.学习层次代码 = arrange;
                }
                if (!marry.Equals(string.Empty))
                {
                    self.婚配代码 = marry;
                }
                if (!household.Equals(string.Empty))
                {
                    self.户籍代码 = household;
                }
                self.联系电话 = tel;
                self.QQ号码 = qq;
                self.电子邮箱 = mail;
                if (!policy.Equals(string.Empty))
                {
                    self.政治面貌代码 = policy;
                }
                allData.SaveChanges();
                return RedirectToAction("RetrieveStudent", "Admin");
            }
            catch (Exception e)
            {
                ViewBag.ErrorMessage = e.Message;
            }
            // 如果成功修改，将会直接跳转到学生个人详细页面
            // 如果修改失败，将会进行下面的代码
            // 性别
            var sexTable = from s in allData.性别代码表 select s;
            List<SelectListItem> listSex = new List<SelectListItem>();
            foreach (var item in sexTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.性别代码,
                    Text = item.性别
                };
                listSex.Add(listItem);
            }
            SelectList selectSex = new SelectList(listSex, "Value", "Text");
            ViewBag.sex = selectSex;

            // 国家
            var countryTable = from s in allData.国家代码表 select s;
            List<SelectListItem> listCou = new List<SelectListItem>();
            foreach (var item in countryTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.国家代码,
                    Text = item.国家名称
                };
                listCou.Add(listItem);
            }
            SelectList selectCou = new SelectList(listCou, "Value", "Text");
            ViewBag.cou = selectCou;

            // 省份
            var provinceTable = from s in allData.省份代码表 select s;
            List<SelectListItem> listPro = new List<SelectListItem>();
            foreach (var item in provinceTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.省份代码,
                    Text = item.省份名称
                };
                listPro.Add(listItem);
            }
            SelectList selectPro = new SelectList(listPro, "Value", "Text");
            ViewBag.pro = selectPro;

            // 城市
            var cityTable = from s in allData.城市代码表 select s;
            List<SelectListItem> listCit = new List<SelectListItem>();
            foreach (var item in cityTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.城市代码,
                    Text = item.城市名称
                };
                listCit.Add(listItem);
            }
            SelectList selectCit = new SelectList(listCit, "Value", "Text");
            ViewBag.cit = selectCit;

            // 区县
            var areaTable = from s in allData.区县代码表 select s;
            List<SelectListItem> listAre = new List<SelectListItem>();
            foreach (var item in areaTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.区县代码,
                    Text = item.区县名称
                };
                listAre.Add(listItem);
            }
            SelectList selectAre = new SelectList(listAre, "Value", "Text");
            ViewBag.are = selectAre;

            // 学习层次
            var arrangeTable = from s in allData.学习层次代码表 select s;
            List<SelectListItem> listArr = new List<SelectListItem>();
            foreach (var item in arrangeTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.学习层次代码,
                    Text = item.学习层次
                };
                listArr.Add(listItem);
                SelectList selectArr = new SelectList(listArr, "Value", "Text");
                ViewBag.arr = selectArr;
            }

            // 婚配代码
            var marryTable = from s in allData.婚配代码表 select s;
            List<SelectListItem> listMar = new List<SelectListItem>();
            foreach (var item in marryTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.婚配代码,
                    Text = item.婚配情况
                };
                listMar.Add(listItem);
                SelectList selectMar = new SelectList(listMar, "Value", "Text");
                ViewBag.mar = selectMar;
            }

            // 户籍信息
            var householdTable = from s in allData.户籍代码表 select s;
            List<SelectListItem> listHol = new List<SelectListItem>();
            foreach (var item in householdTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.户籍代码,
                    Text = item.户籍名称
                };
                listHol.Add(listItem);
                SelectList selectHol = new SelectList(listHol, "Value", "Text");
                ViewBag.hol = selectHol;
            }

            // 政治面貌
            var policyTable = from s in allData.政治面貌代码表 select s;
            List<SelectListItem> listPol = new List<SelectListItem>();
            foreach (var item in policyTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.政治面貌代码,
                    Text = item.政治面貌类型
                };
                listPol.Add(listItem);
                SelectList selectPol = new SelectList(listPol, "Value", "Text");
                ViewBag.pol = selectPol;
            }
            // 错误将会回到这里
            // 将找到的个人信息传入前端展示
            var selfError = (from s in allData.学生详细信息视图 select s).SingleOrDefault(s => s.学生学号.Equals(sno));
            return View(selfError);
        }


        // 国家、省份、城市、区县四级联动
        // 用国家找省份
        public ActionResult SelectProvince(string countryId)
        {
            List<省份代码表> list = new List<省份代码表>();
            var provice = (from s in allData.省份代码表 select s).Where(s => s.所在国家代码.Equals(countryId));
            foreach (var item in provice)
            {
                省份代码表 pro = new 省份代码表();
                pro.省份代码 = item.省份代码;
                pro.省份名称 = item.省份名称;
                list.Add(pro);
            }
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        // 用省份找城市
        public ActionResult SelectCity(string provinceId)
        {
            List<城市代码表> list = new List<城市代码表>();
            var city = (from s in allData.城市代码表 select s).Where(s => s.所在省份代码.Equals(provinceId));
            foreach (var item in city)
            {
                城市代码表 cityItem = new 城市代码表();
                cityItem.城市代码 = item.城市代码;
                cityItem.城市名称 = item.城市名称;
                list.Add(cityItem);
            }
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        // 用城市找区县
        public ActionResult SelectArea(string cityId)
        {
            List<区县代码表> list = new List<区县代码表>();
            var area = (from s in allData.区县代码表 select s).Where(s => s.所在城市代码.Equals(cityId));
            foreach (var item in area)
            {
                区县代码表 areaItem = new 区县代码表();
                areaItem.区县代码 = item.区县代码;
                areaItem.区县名称 = item.区县名称;
                list.Add(areaItem);
            }
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        // 删除
        public ActionResult DeleteStudent(string studentId)
        {
            try
            {
                // 1、使用studentId找出唯一的对象
                var db = (from s in allData.学生表 select s).SingleOrDefault(s => s.学生学号.Equals(studentId));
                //var student = (from s in allData.学生选课表 select s).Where(s => s.学生学号.Equals(studentId));
                //var id = (from s in addons.身份对照表 select s).SingleOrDefault(s => s.账号.Equals(studentId));
                //var pwd = (from s in allData.密码表 select s).SingleOrDefault(s => s.账号.Equals(studentId));
                //// 1.5删掉所有选课记录
                //if (student.Count() > 0)
                //{
                //    foreach (var item in student)
                //    {
                //        allData.学生选课表.Remove(item);
                //    }
                //}
                //// 2、使用Remove方法删掉
                //allData.学生表.Remove(db);
                //// 2.1对应的身份对照
                //if (id != null)
                //{
                //    addons.身份对照表.Remove(id);
                //}
                //// 3、使用savechanges方法保存修改
                //allData.SaveChanges();
                //// 4、回收用户
                //allData.密码表.Remove(pwd);
                db.是否启用 = "否";
                allData.SaveChanges();
                return RedirectToAction("RetrieveStudent", "Admin");
            }
            catch (Exception e) // 异常处理
            {
                ViewBag.ErrorMessage = e.Message;
            }
            return View();
        }

        // 查看
        public ActionResult RetrieveStudent(int page = 1)
        {
            const int pageSize = 5;
            var student = (from s in allData.学生详细信息视图 select s).OrderBy(s => s.学生学号).ToPagedList(page, pageSize);
            return View(student);
        }

        // 详细信息
        public ActionResult StudentInfo(string studentId)
        {
            var student = (from s in allData.学生详细信息视图 select s).SingleOrDefault(s => s.学生学号.Equals(studentId));
            return View(student);
        }
        #endregion

        #region 教师信息
        // 查看
        public ActionResult RetrieveTeacher(int page = 1)
        {
            const int pageSize = 5;
            var teacher = (from t in allData.教师详细信息视图 select t).OrderBy(s => s.教师工号).ToPagedList(page, pageSize);
            return View(teacher);
        }

        // 添加教师
        public ActionResult CreateTeacher()
        {
            var idCard = from i in allData.身份证类别代码表 select i;
            var Ssex = from s in allData.性别代码表 select s;
            // 将数据库中的内容放入SelectList中，传入前端，变成下拉框
            // 证件类型
            List<SelectListItem> listIdType = new List<SelectListItem>();
            foreach (var item in idCard)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.身份证类别代码,
                    Text = item.身份证类别名称
                };
                listIdType.Add(listItem);
            }
            SelectList selectIdType = new SelectList(listIdType, "Value", "Text");
            ViewBag.idType = selectIdType;
            // 性别
            List<SelectListItem> listSex = new List<SelectListItem>();
            foreach (var item in Ssex)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.性别代码,
                    Text = item.性别
                };
                listSex.Add(listItem);
            }
            SelectList selectSex = new SelectList(listSex, "Value", "Text");
            ViewBag.sex = selectSex;
            return View();
        }

        // 提交修改
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult CreateTeacher(string tno, string tname, string idType, string id, string sex, string exist)
        {
            try
            {
                // 1、密码表
                密码表 pwd = new 密码表();
                pwd.密码 = "123456";
                pwd.账号 = tno;
                // 2、教师表
                教师表 teacher = new 教师表();
                teacher.教师工号 = tno;
                teacher.教师姓名 = tname;
                teacher.身份证类别代码 = idType;
                teacher.身份证号 = id;
                teacher.性别代码 = sex;
                teacher.是否启用 = exist;
                teacher.国家代码 = "457";
                teacher.省份代码 = "420000";
                teacher.城市代码 = "420100";
                teacher.区县代码 = "420102";
                teacher.所在学校代码 = "10512";
                teacher.所在院系代码 = "1051201";
                teacher.户籍代码 = "01";
                teacher.婚配代码 = "01";
                teacher.学习层次代码 = "51";
                teacher.政治面貌代码 = "50";
                // 3、身份对照表
                身份对照表 iden = new 身份对照表();
                iden.账号 = tno;
                iden.身份代码 = "02";
                // 4、保存修改
                allData.密码表.Add(pwd);
                allData.教师表.Add(teacher);
                addons.身份对照表.Add(iden);
                allData.SaveChanges();
                addons.SaveChanges();
                return RedirectToAction("RetrieveTeacher", "Admin");
            }
            catch (Exception e)
            {
                ViewBag.ErrorMessage = e.Message;
            }
            // 抛出异常会走到这里
            var idCard = from i in allData.身份证类别代码表 select i;
            var Ssex = from s in allData.性别代码表 select s;
            // 将数据库中的内容放入SelectList中，传入前端，变成下拉框
            // 证件类型
            List<SelectListItem> listIdType = new List<SelectListItem>();
            foreach (var item in idCard)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.身份证类别代码,
                    Text = item.身份证类别名称
                };
                listIdType.Add(listItem);
            }
            SelectList selectIdType = new SelectList(listIdType, "Value", "Text");
            ViewBag.idType = selectIdType;
            // 性别
            List<SelectListItem> listSex = new List<SelectListItem>();
            foreach (var item in Ssex)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.性别代码,
                    Text = item.性别
                };
                listSex.Add(listItem);
            }
            SelectList selectSex = new SelectList(listSex, "Value", "Text");
            ViewBag.sex = selectSex;

            return View();
        }

        // 教师详细信息
        public ActionResult TeacherInfo(string teacherId)
        {
            var teacher = (from s in allData.教师详细信息视图 select s).SingleOrDefault(s => s.教师工号.Equals(teacherId));
            return View(teacher);
        }

        // 修改教师信息
        public ActionResult EditTeacherInfo(string teacherId)
        {
            // 性别
            var sex = from s in allData.性别代码表 select s;
            List<SelectListItem> listSex = new List<SelectListItem>();
            foreach (var item in sex)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.性别代码,
                    Text = item.性别
                };
                listSex.Add(listItem);
            }
            SelectList selectSex = new SelectList(listSex, "Value", "Text");
            ViewBag.sex = selectSex;

            // 国家
            var country = from s in allData.国家代码表 select s;
            List<SelectListItem> listCou = new List<SelectListItem>();
            foreach (var item in country)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.国家代码,
                    Text = item.国家名称
                };
                listCou.Add(listItem);
            }
            SelectList selectCou = new SelectList(listCou, "Value", "Text");
            ViewBag.cou = selectCou;

            // 省份
            var province = from s in allData.省份代码表 select s;
            List<SelectListItem> listPro = new List<SelectListItem>();
            foreach (var item in province)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.省份代码,
                    Text = item.省份名称
                };
                listPro.Add(listItem);
            }
            SelectList selectPro = new SelectList(listPro, "Value", "Text");
            ViewBag.pro = selectPro;

            // 城市
            var city = from s in allData.城市代码表 select s;
            List<SelectListItem> listCit = new List<SelectListItem>();
            foreach (var item in city)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.城市代码,
                    Text = item.城市名称
                };
                listCit.Add(listItem);
            }
            SelectList selectCit = new SelectList(listCit, "Value", "Text");
            ViewBag.cit = selectCit;

            // 区县
            var area = from s in allData.区县代码表 select s;
            List<SelectListItem> listAre = new List<SelectListItem>();
            foreach (var item in area)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.区县代码,
                    Text = item.区县名称
                };
                listAre.Add(listItem);
            }
            SelectList selectAre = new SelectList(listAre, "Value", "Text");
            ViewBag.are = selectAre;

            // 学习层次
            var arrange = from s in allData.学习层次代码表 select s;
            List<SelectListItem> listArr = new List<SelectListItem>();
            foreach (var item in arrange)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.学习层次代码,
                    Text = item.学习层次
                };
                listArr.Add(listItem);
                SelectList selectArr = new SelectList(listArr, "Value", "Text");
                ViewBag.arr = selectArr;
            }

            // 婚配代码
            var marry = from s in allData.婚配代码表 select s;
            List<SelectListItem> listMar = new List<SelectListItem>();
            foreach (var item in marry)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.婚配代码,
                    Text = item.婚配情况
                };
                listMar.Add(listItem);
                SelectList selectMar = new SelectList(listMar, "Value", "Text");
                ViewBag.mar = selectMar;
            }

            // 户籍信息
            var household = from s in allData.户籍代码表 select s;
            List<SelectListItem> listHol = new List<SelectListItem>();
            foreach (var item in household)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.户籍代码,
                    Text = item.户籍名称
                };
                listHol.Add(listItem);
                SelectList selectHol = new SelectList(listHol, "Value", "Text");
                ViewBag.hol = selectHol;
            }

            // 政治面貌
            var policy = from s in allData.政治面貌代码表 select s;
            List<SelectListItem> listPol = new List<SelectListItem>();
            foreach (var item in policy)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.政治面貌代码,
                    Text = item.政治面貌类型
                };
                listPol.Add(listItem);
                SelectList selectPol = new SelectList(listPol, "Value", "Text");
                ViewBag.pol = selectPol;
            }
            // 找个人信息
            var self = (from s in allData.教师详细信息视图 select s).SingleOrDefault(s => s.教师工号.Equals(teacherId));
            // 传入前端展示
            return View(self);
        }

        [HttpPost]
        // 提交修改
        public ActionResult EditTeacherInfo(string tno, string sex, string change, string birth, string doubleMajor, string country, string province, string city, string area, string arrange, string marry, string household, string tel, string qq, string mail, string policy, HttpPostedFileBase photo)
        {
            var self = (from t in allData.教师表 select t).SingleOrDefault(t => t.教师工号.Equals(tno));
            string name = self.教师姓名;
            string savePath = Server.MapPath("~/images/TeacherPicture/");
            photo = Request.Files["photo"];
            try
            {
                if (!sex.Equals(string.Empty))
                {
                    self.性别代码 = sex;
                }
                if (!photo.FileName.Equals(string.Empty))
                {
                    string fileType = photo.FileName.Split(new char[1] { '.' }, StringSplitOptions.RemoveEmptyEntries)[1];
                    string fileName = name + tno + "." + fileType;
                    photo.SaveAs(savePath + fileName);
                    self.证件照路径 = fileName;
                }
                if (!birth.Equals(string.Empty))
                {
                    self.出生日期 = Convert.ToDateTime(birth);
                }
                if (!country.Equals(string.Empty))
                {
                    self.国家代码 = country;
                }
                if (!province.Equals(string.Empty))
                {
                    self.省份代码 = province;
                }
                if (!city.Equals(string.Empty))
                {
                    self.城市代码 = city;
                }
                if (!area.Equals(string.Empty))
                {
                    self.区县代码 = area;
                }
                if (!marry.Equals(string.Empty))
                {
                    self.婚配代码 = marry;
                }
                if (!household.Equals(string.Empty))
                {
                    self.户籍代码 = household;
                }
                self.联系电话 = tel;
                self.QQ号码 = qq;
                self.电子邮箱 = mail;
                if (!policy.Equals(string.Empty))
                {
                    self.政治面貌代码 = policy;
                }
                allData.SaveChanges();
                return RedirectToAction("RetrieveTeacher", "Admin");
            }
            catch (Exception e)
            {
                ViewBag.ErrorMessage = e.Message;
            }
            // 如果成功修改，将会直接跳转到学生个人详细页面
            // 如果修改失败，将会进行下面的代码
            // 性别
            var sexTable = from s in allData.性别代码表 select s;
            List<SelectListItem> listSex = new List<SelectListItem>();
            foreach (var item in sexTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.性别代码,
                    Text = item.性别
                };
                listSex.Add(listItem);
            }
            SelectList selectSex = new SelectList(listSex, "Value", "Text");
            ViewBag.sex = selectSex;

            // 国家
            var countryTable = from s in allData.国家代码表 select s;
            List<SelectListItem> listCou = new List<SelectListItem>();
            foreach (var item in countryTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.国家代码,
                    Text = item.国家名称
                };
                listCou.Add(listItem);
            }
            SelectList selectCou = new SelectList(listCou, "Value", "Text");
            ViewBag.cou = selectCou;

            // 省份
            var provinceTable = from s in allData.省份代码表 select s;
            List<SelectListItem> listPro = new List<SelectListItem>();
            foreach (var item in provinceTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.省份代码,
                    Text = item.省份名称
                };
                listPro.Add(listItem);
            }
            SelectList selectPro = new SelectList(listPro, "Value", "Text");
            ViewBag.pro = selectPro;

            // 城市
            var cityTable = from s in allData.城市代码表 select s;
            List<SelectListItem> listCit = new List<SelectListItem>();
            foreach (var item in cityTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.城市代码,
                    Text = item.城市名称
                };
                listCit.Add(listItem);
            }
            SelectList selectCit = new SelectList(listCit, "Value", "Text");
            ViewBag.cit = selectCit;

            // 区县
            var areaTable = from s in allData.区县代码表 select s;
            List<SelectListItem> listAre = new List<SelectListItem>();
            foreach (var item in areaTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.区县代码,
                    Text = item.区县名称
                };
                listAre.Add(listItem);
            }
            SelectList selectAre = new SelectList(listAre, "Value", "Text");
            ViewBag.are = selectAre;

            // 学习层次
            var arrangeTable = from s in allData.学习层次代码表 select s;
            List<SelectListItem> listArr = new List<SelectListItem>();
            foreach (var item in arrangeTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.学习层次代码,
                    Text = item.学习层次
                };
                listArr.Add(listItem);
                SelectList selectArr = new SelectList(listArr, "Value", "Text");
                ViewBag.arr = selectArr;
            }

            // 婚配代码
            var marryTable = from s in allData.婚配代码表 select s;
            List<SelectListItem> listMar = new List<SelectListItem>();
            foreach (var item in marryTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.婚配代码,
                    Text = item.婚配情况
                };
                listMar.Add(listItem);
                SelectList selectMar = new SelectList(listMar, "Value", "Text");
                ViewBag.mar = selectMar;
            }

            // 户籍信息
            var householdTable = from s in allData.户籍代码表 select s;
            List<SelectListItem> listHol = new List<SelectListItem>();
            foreach (var item in householdTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.户籍代码,
                    Text = item.户籍名称
                };
                listHol.Add(listItem);
                SelectList selectHol = new SelectList(listHol, "Value", "Text");
                ViewBag.hol = selectHol;
            }

            // 政治面貌
            var policyTable = from s in allData.政治面貌代码表 select s;
            List<SelectListItem> listPol = new List<SelectListItem>();
            foreach (var item in policyTable)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Value = item.政治面貌代码,
                    Text = item.政治面貌类型
                };
                listPol.Add(listItem);
                SelectList selectPol = new SelectList(listPol, "Value", "Text");
                ViewBag.pol = selectPol;
            }
            // 错误将会回到这里
            // 将找到的个人信息传入前端展示
            var selfError = (from s in allData.教师详细信息视图 select s).Where(s => s.教师工号.Equals(tno));
            return View(selfError);
        }

        // 删除教师
        public ActionResult DeleteTeacher(string teacherId)
        {
            try
            {
                // 1、使用teacherId找出唯一的对象
                教师表 db = new 教师表();
                db = (from s in allData.教师表 select s).SingleOrDefault(s => s.教师工号 == teacherId);
                // 2、使用Remove方法删掉
                db.是否启用 = "否";
                // 3、使用savechanges方法保存修改
                allData.SaveChanges();
                return RedirectToAction("RetrieveTeacher", "Admin");
            }
            catch (Exception e) // 异常处理
            {
                ViewBag.ErrorMessage = e.Message;
            }
            return View();
        }
        #endregion

    }
}