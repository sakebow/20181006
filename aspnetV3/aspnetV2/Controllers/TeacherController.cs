using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using aspnetV2.Models;
using System.Configuration;
using PagedList;
using System.IO;
using Newtonsoft.Json;

namespace aspnetV2.Controllers
{
    public class TeacherController : Controller
    {

        #region 首页
        // 首页
        public ActionResult Index()
        {
            return View();
        }
        #endregion
        asp db = new asp();
        #region 个人信息
        public ActionResult TeacherInfo()
        {
            string id = Session["account"].ToString();
            var teachInfo = (from s in db.教师详细信息视图 select s).SingleOrDefault(s => s.教师工号 == id);
            return View(teachInfo);
        }
        #endregion

        #region 修改个人信息
        public ActionResult EditSelfInfo()
        {
            //性别
            var sex = from s in db.性别代码表 select s;
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
            var country = from s in db.国家代码表 select s;
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
            var province = from s in db.省份代码表 select s;
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
            var city = from s in db.城市代码表 select s;
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
            var area = from s in db.区县代码表 select s;
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
            var arrange = from s in db.学习层次代码表 select s;
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
            var marry = from s in db.婚配代码表 select s;
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
            var household = from s in db.户籍代码表 select s;
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
            var policy = from s in db.政治面貌代码表 select s;
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
            var self = (from s in db.教师详细信息视图 select s).SingleOrDefault(s => s.教师工号.Equals(id) && s.学校代码.Equals(school));
            // 传入前端展示
            return View(self);

        }


        [HttpPost]
        public ActionResult EditSelfInfo(string sex, string birth, string country, string province, string city, string area, string marry, string household, string tel, string qq, string mail, string policy, HttpPostedFileBase photo, string name, string pwd)
        {
            string id = Session["account"].ToString();
            string school = Session["school"].ToString();
            var self = (from s in db.教师表 select s).SingleOrDefault(s => s.教师工号.Equals(id) && s.所在学校代码.Equals(school));
            var pwdSelf = (from s in db.密码表 select s).SingleOrDefault(s => s.账号.Equals(id));
            string savePath = Server.MapPath("~/images/TeacherPicture/");

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
                    self.证件照路径 = fileName;
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
                if (!sex.Equals(string.Empty))
                {
                    self.性别代码 = sex;
                }
                self.出生日期 = Convert.ToDateTime(birth);
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
                db.SaveChanges();
                return RedirectToAction("TeacherInfo", "Teacher");
            }
            catch (Exception e)
            {
                ViewBag.ErrorMessage = e.Message;
            }
            // 如果成功修改，将会直接跳转到学生个人详细页面
            // 如果修改失败，将会进行下面的代码
            // 性别
            var sexTable = from s in db.性别代码表 select s;
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
            var countryTable = from s in db.国家代码表 select s;
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
            var provinceTable = from s in db.省份代码表 select s;
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
            var cityTable = from s in db.城市代码表 select s;
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
            var areaTable = from s in db.区县代码表 select s;
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
            var arrangeTable = from s in db.学习层次代码表 select s;
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
            var marryTable = from s in db.婚配代码表 select s;
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
            var householdTable = from s in db.户籍代码表 select s;
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
            var policyTable = from s in db.政治面貌代码表 select s;
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
            var selfErr = (from s in db.教师详细信息视图 select s).SingleOrDefault(s => s.教师工号.Equals(id));
            return View(selfErr);
        }
        #endregion

        #region  国家、省份、城市、区县四级联动  用国家找省份             
        public ActionResult SelectProvince(string countryId)
        {
            List<省份代码表> list = new List<省份代码表>();
            var provice = (from s in db.省份代码表 select s).Where(s => s.所在国家代码.Equals(countryId));
            foreach (var item in provice)
            {
                省份代码表 pro = new 省份代码表();
                pro.省份代码 = item.省份代码;
                pro.省份名称 = item.省份名称;
                list.Add(pro);
            }
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        #endregion

        #region  用省份找城市

        public ActionResult SelectCity(string provinceId)
        {
            List<城市代码表> list = new List<城市代码表>();
            var city = (from s in db.城市代码表 select s).Where(s => s.所在省份代码.Equals(provinceId));
            foreach (var item in city)
            {
                城市代码表 cityItem = new 城市代码表();
                cityItem.城市代码 = item.城市代码;
                cityItem.城市名称 = item.城市名称;
                list.Add(cityItem);
            }
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        #endregion

        #region 用城市找区县
        public ActionResult SelectArea(string cityId)
        {
            List<区县代码表> list = new List<区县代码表>();
            var area = (from s in db.区县代码表 select s).Where(s => s.所在城市代码.Equals(cityId));
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

        #region 班级学生信息
        [HttpPost]
        public ActionResult ShowClassInfo(String searchChoice, int page = 1)
        {
            List<SelectListItem> listItem = new List<SelectListItem>();
            String id = Session["account"].ToString();
            var stuCourse = from s in db.选课视图 where s.教师工号 == id select s;
            foreach (var item in stuCourse)
            {
                SelectListItem seleItem = new SelectListItem
                {
                    Value = item.课程代码,
                    Text = item.教材名称
                };
                listItem.Add(seleItem);
            }
            SelectList stuCourses = new SelectList(listItem, "Value", "Text");
            ViewBag.stuCourses = stuCourses;

            const int pagesize = 5;
            var stuTeach = db.已选课程信息.Where(s => s.教师工号.Equals(id)).OrderBy(s => s.学生学号).ToPagedList(page, pagesize);
            if (!searchChoice.Equals(""))
            {
                stuTeach = stuTeach.Where(s => s.课程代码.Equals(searchChoice)).OrderBy(s => s.学生学号).ToPagedList(page, pagesize);
            }
            return View(stuTeach);
        }


        public ActionResult ShowClassInfo(int page = 1)
        {
            List<SelectListItem> listItem = new List<SelectListItem>();
            String id = Session["account"].ToString();
            var stuCourse = from s in db.选课视图 where s.教师工号 == id select s;
            foreach (var item in stuCourse)
            {
                SelectListItem seleItem = new SelectListItem
                {
                    Value = item.课程代码,
                    Text = item.教材名称
                };
                listItem.Add(seleItem);
            }
            SelectList stuCourses = new SelectList(listItem, "Value", "Text");
            ViewBag.stuCourses = stuCourses;

            const int pagesize = 5;//每页可以展示的信息个数，，就是页面大小
            var stuTeach = db.已选课程信息.Where(s => s.教师工号 == id).OrderBy(s => s.学生学号).ToPagedList(page, pagesize);
            //var stuTeach = db.学生详细信息视图.OrderBy(s => s.学生学号).ToPagedList(page, pagesize);

            return View(stuTeach);
        }

        #endregion

        #region 学生个人信息
        public ActionResult StudentInfo(string id)
        {
            var stuInfo = (from s in db.学生详细信息视图 select s).SingleOrDefault(s => s.学生学号 == id);
            return View(stuInfo);
        }
        #endregion

        #region 显示课程
        public ActionResult ShowCourse(int page = 1)
        {
            const int pageSize = 5;
            String id = Session["account"].ToString();
            var specialty = (from s in db.教师详细信息视图 select s).SingleOrDefault(s => s.教师工号 == id).院系代码;
            var course = (from s in db.全部课程教材对照视图 where s.所属院系代码 == specialty select s).OrderBy(s => s.课程代码).ToPagedList(page, pageSize);
            return View(course);
        }
        #endregion

        #region 课程详情
        public ActionResult CourseDetail(string courseId)
        {
            var course = (from s in db.全部课程教材对照视图 select s).SingleOrDefault(s => courseId.Equals(s.课程代码));
            return View(course);
        }
        #endregion

        #region 教师打分
        static string STUDENTID = "";
        static string COURSEID = "";
        static string NAME = "";
        public ActionResult StudentScore(string studentId, string courseId)
        {
            STUDENTID = studentId;
            COURSEID = courseId;
            var school = Session["school"].ToString();
            var id = Session["account"].ToString();
            var student = (from s in db.已选课程信息 select s).SingleOrDefault(s => s.学生学号.Equals(studentId));
            NAME = student.学生姓名;
            string savePath = Server.MapPath("~/Scores/Students/");
            string fileName = studentId + NAME + courseId + ".json";
            string scores = null;
            try
            {
                if (System.IO.File.Exists(savePath + fileName))
                {
                    using (FileStream fs = new FileStream(savePath + fileName, FileMode.Open))
                    {
                        int fsLen = (int)fs.Length;
                        byte[] heByte = new byte[fsLen];
                        int r = fs.Read(heByte, 0, heByte.Length);
                        scores = System.Text.Encoding.UTF8.GetString(heByte);
                        var jArray = JsonConvert.DeserializeObject<List<decimal>>(scores);
                        ViewBag.normal = jArray[0];
                        ViewBag.middle = jArray[1];
                        ViewBag.final = jArray[2];
                    }
                }
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return View();
        }

        [HttpPost]
        public ActionResult StudentScore(decimal normal, decimal middle, decimal final, string button)
        {
            string savePath = Server.MapPath("~/Scores/Students/");
            string savePartPath = Server.MapPath("~/Scores/Part");
            if (!Directory.Exists(savePath))
            {
                Directory.CreateDirectory(savePath);
            }
            string fileName = STUDENTID + NAME + COURSEID + ".json";
            string partFileName = COURSEID + ".json";
            decimal normalPart = 0;
            decimal middlePart = 0;
            decimal finalPart = 0;
            try
            {
                switch (button)
                {
                    case "保存":
                        List<decimal> list = new List<decimal>();
                        list.Add(normal);
                        list.Add(middle);
                        list.Add(final);
                        string json = JsonConvert.SerializeObject(list, Formatting.Indented);
                        FileHelper.WriteJson(savePath, fileName, json);
                        break;
                    case "提交":
                        var student = (from s in db.学生选课表 select s).SingleOrDefault(s => s.学生学号.Equals(STUDENTID) && s.选课代码.Equals(COURSEID));
                        student.学生平时成绩 = normal;
                        student.学生期中成绩 = middle;
                        student.学生期末成绩 = final;
                        if (System.IO.File.Exists(savePartPath + partFileName))
                        {
                            using (FileStream fs = new FileStream(savePath + fileName, FileMode.Open))
                            {
                                int fsLen = (int)fs.Length;
                                byte[] heByte = new byte[fsLen];
                                int r = fs.Read(heByte, 0, heByte.Length);
                                var jArray = JsonConvert.DeserializeObject<List<decimal>>(System.Text.Encoding.UTF8.GetString(heByte));
                                normalPart = jArray[0];
                                middlePart = jArray[1];
                                finalPart = jArray[2];
                            }
                        }
                        student.学生总成绩 = (normalPart * normal + middlePart * middle + finalPart * final) / 100;
                        db.SaveChanges();
                        break;
                }
                return RedirectToAction("ShowClassInfo", "Teacher");
            }
            catch (Exception e)
            {
                ViewBag.ErrorMessage = e.Message;
            }
            return View();
        }
        #endregion
    }
}