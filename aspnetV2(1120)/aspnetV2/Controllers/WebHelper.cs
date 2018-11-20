using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace aspnet.Controllers
{
    public class WebHelper
    {
        // 将验证码写入全局的Session变量中
        public static void WriteSession(string sessionName, string sessionValue)
        {
            HttpContext.Current.Session[sessionName] = sessionValue;
            HttpContext.Current.Session.Timeout = 5;
        }
    }
}