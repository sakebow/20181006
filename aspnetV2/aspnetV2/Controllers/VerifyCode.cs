using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;

namespace aspnet.Controllers
{
    public class VerifyCode
    {
        public byte[] GetVerifyCode(int width, int height, int length)
        {
            int codeW = width;
            int codeH = height;
            int codeL = length;
            //设置默认最小值
            if (codeW < 80)
            {
                codeW = 80;
            }
            if (codeH < 30)
            {
                codeH = 30;
            }
            if (codeL < 4)
            {
                codeL = 4;
            }
            string chkCode = string.Empty;
            //噪点的颜色列表
            Color[] color = { Color.Black, Color.Red, Color.Blue, Color.Green, Color.Orange, Color.Brown, Color.Brown, Color.DarkBlue };
            //字体列表
            string[] font = { "Times New Roman" };
            char[] character = { '2', '3', '4', '5', '6', '8', '9', 'a', 'b', 'd', 'e', 'f', 'h', 'k', 'm', 'n', 'r', 'x', 'y', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'R', 'S', 'T', 'W', 'X', 'Y' };
            Random random = new Random();
            //生成随机的验证码
            for (int i = 0; i < codeL; i++)
            {
                chkCode += character[random.Next(character.Length)];
            }
            WebHelper.WriteSession("session_verifycode", chkCode);
            //创建画布
            Bitmap bmp = new Bitmap(codeW, codeH);
            Graphics g = Graphics.FromImage(bmp);
            g.Clear(Color.White);
            //画噪线 
            for (int i = 0; i < 5; i++)
            {
                int x1 = random.Next(codeW);
                int y1 = random.Next(codeH);
                int x2 = random.Next(codeW);
                int y2 = random.Next(codeH);
                Color clr = color[random.Next(color.Length)];
                g.DrawLine(new Pen(clr), x1, y1, x2, y2);
            }
            //画验证码字符串 
            for (int i = 0; i < chkCode.Length; i++)
            {
                string fnt = font[random.Next(font.Length)];
                Font ft = new Font(fnt, 16);
                Color clr = color[random.Next(color.Length)];
                g.DrawString(chkCode[i].ToString(), ft, new SolidBrush(clr), (float)i * 18, 0);
            }
            //将验证码图片写入内存流，并将其以 "image/Png" 格式输出 
            MemoryStream ms = new MemoryStream();
            try
            {
                bmp.Save(ms, ImageFormat.Png);
                return ms.ToArray();
            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                g.Dispose();
                bmp.Dispose();
            }
        }
    }
}