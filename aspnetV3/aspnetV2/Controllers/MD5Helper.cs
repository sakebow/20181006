using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace aspnetV2.Controllers
{
    public class MD5Helper
    {
        // 普通字符串加密
        public static string getStringMd5Hash(string str)
        {
            List<string> ls = new List<string>();
            using (MD5 md5 = MD5.Create())
            {
                byte[] strbytes = Encoding.UTF8.GetBytes(str);
                strbytes = md5.ComputeHash(strbytes);
                for (int i = 0; i < strbytes.Length; i++)
                {
                    ls.Add(strbytes[i].ToString("x2"));
                }
                return string.Concat(ls);
            }
        }

        // 中文字符串加密
        public static string getChineseMd5Hash(string str)
        {
            List<string> ls = new List<string>();
            using (MD5 md5 = MD5.Create())
            {
                byte[] strbytes = Encoding.GetEncoding("gb2312").GetBytes(str);
                strbytes = md5.ComputeHash(strbytes);
                for (int i = 0; i < strbytes.Length; i++)
                {
                    ls.Add(strbytes[i].ToString("x2"));
                }
                return string.Concat(ls);
            }
        }

        // 文件流加密
        public static string getFileMd5Hash(string fileName)
        {
            using (MD5 md5 = MD5.Create())
            {
                using (FileStream fs = new FileStream(fileName, FileMode.Open, FileAccess.Read))
                {
                    List<string> lis = new List<string>();
                    byte[] b1 = md5.ComputeHash(fs);
                    for (int i = 0; i < b1.Length; i++)
                    {
                        lis.Add(b1[i].ToString("x2"));
                    }
                    return string.Concat(lis);
                }
            }
        }
    }
}