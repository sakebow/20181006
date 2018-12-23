using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

namespace aspnetV2.Controllers
{
    public class FileHelper
    {
        public static string DateTimeFileName()
        {
            string dateTime = string.Empty;
            // 时间字符串处理
            string[] date = DateTime.Now.ToShortDateString().Split(new char[1] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < date.Length; i++)
            {
                dateTime += date[i];
                if (i != date.Length - 1)
                {
                    dateTime += "_";
                }
            }
            return dateTime;
        }

        public static void WriteDetail(string newsDetail, string savePath, string fileName)
        {
            // 确定文件路径
            if (!Directory.Exists(savePath))
            {
                Directory.CreateDirectory(savePath);
            }
            // 写入文件
            FileStream fs = new FileStream(savePath + fileName, FileMode.Create);
            byte[] content = Encoding.Default.GetBytes(newsDetail);
            fs.Write(content, 0, content.Length);
            fs.Flush();
            fs.Close();
        }

        public static void WriteJson(string savePath, string fileName, string json)
        {
            using (FileStream fs = new FileStream(savePath + fileName, FileMode.Create))
            {
                //写入
                using (StreamWriter sw = new StreamWriter(fs))
                {
                    sw.WriteLine(json);
                }

            }
        }
    }
}