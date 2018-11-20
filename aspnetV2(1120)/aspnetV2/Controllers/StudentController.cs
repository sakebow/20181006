using System;
using System.Collections.Generic;
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

        #region 首页
        public ActionResult Index()
        {
            return View();
        }
        #endregion

        #region 课程
        #endregion

        #region 个人信息
        public ActionResult StudentInfo()
        {
            // 登录成功后，学号已经存入Session，通过Session查找学生信息
            // 
            return View();
        }
        #endregion
    }
}