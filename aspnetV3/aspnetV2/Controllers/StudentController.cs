using aspnetV2.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace aspnetV2.Controllers
{
    public class StudentController : Controller
    {
        /// <summary> 学生控制器，包含了所有学生的功能
        /// 一、首页
        /// 二、课程
        ///     1、查看该专业的所有课程
        ///     2、选择课程
        /// 三、个人信息
        ///     1、查看
        ///     2、修改
        /// 四、申请
        ///     1、提交重置密码申请
        /// </summary>
        /// <returns></returns>

        asp allData = new asp();
        #region 首页
        public ActionResult Index()
        {
            return View();
        }
        #endregion

        #region 个人信息
        public ActionResult StudentInfo()
        {
            // 登录成功后，学号已经存入Session，通过Session查找学生信息
            // 将查找到的学生信息通过View传值到前端
            string id = Session["account"].ToString();
            var studentinfo = (from s in allData.学生详细信息视图 select s).SingleOrDefault(s => id.Equals(s.学生学号));
            return View(studentinfo);
        }

        // 修改个人信息
        public ActionResult EditSelfInfo()
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
            string id = Session["account"].ToString();
            string school = Session["school"].ToString();
            var self = (from s in allData.学生详细信息视图 select s).SingleOrDefault(s => s.学生学号.Equals(id) && s.学校代码.Equals(school));
            // 传入前端展示
            return View(self);
        }

        [HttpPost]
        public ActionResult EditSelfInfo(string pwd,string sex, string change, string birth, string doubleMajor, string country, string province, string city, string area, string arrage, string marry, string household, string tel, string qq, string mail, string policy, HttpPostedFileBase photo, string name)
        {

            string id = Session["account"].ToString();
            string school = Session["school"].ToString();
            var self = (from s in allData.学生表 select s).SingleOrDefault(s => s.学生学号.Equals(id) && s.所在学校代码.Equals(school));
            var pwdSelf = (from s in allData.密码表 select s).SingleOrDefault(s => s.账号.Equals(id));
            string savePath = Server.MapPath("~/images/StudentPicture/");

            if (!Directory.Exists(savePath))
            {
                Directory.CreateDirectory(savePath);
            }
            photo = Request.Files["photo"];
            try
            {
                if (!photo.FileName.Equals(string.Empty))
                {
                    string fileType = photo.FileName.Split(new char[1] { '.' }, StringSplitOptions.RemoveEmptyEntries)[1];
                    string fileName = name + id + "." + fileType;
                    photo.SaveAs(savePath + fileName);
                    self.证件照片路径 = fileName;
                }
                if (!sex.Equals(string.Empty))
                {
                    self.性别代码 = sex;
                }
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
                self.是否转专业 = change;
                self.出生日期 = Convert.ToDateTime(birth);
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
                return RedirectToAction("StudentInfo", "Student");
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
            return View(self);
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
        #endregion

        #region 课程信息
        // 显示课程
        // 显示课程
        public ActionResult ShowCourse()
        {
            return View(allData);
        }

        // 提交选课信息
        [HttpPost]
        public ActionResult ShowCourse(string course)
        {
            return View(allData);
        }

        public ActionResult CourseDetail(string courseId)
        {
            // 根据courseId找出唯一对应的数据对象，然后传入View中显示
            var course = (from s in allData.全部课程教材对照视图 select s).SingleOrDefault(s => s.课程代码.Equals(courseId));
            return View(course);
        }
        #endregion

        #region 确认选课
        public ActionResult ConfirmCourse(string courseId)
        {
            string id = Session["account"].ToString();
            学生选课表 stuCourse = new 学生选课表();
            stuCourse.学生学号 = id;
            stuCourse.选课代码 = courseId;
            allData.学生选课表.Add(stuCourse);
            allData.SaveChanges();
            return RedirectToAction("ShowCourse", "Student");
        }
        #endregion

        #region 确认退课
        public ActionResult QuitCourse(string courseId)
        {
            string id = Session["account"].ToString();
            var stuCourse = (from s in allData.学生选课表 select s).SingleOrDefault(s => s.学生学号.Equals(id) && s.选课代码.Equals(courseId));
            allData.学生选课表.Remove(stuCourse);
            allData.SaveChanges();
            return RedirectToAction("ShowCourse", "Student");
        }
        #endregion
    }
}