namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 管理员表
    {
        [Key]
        [StringLength(50)]
        public string 账号 { get; set; }

        [StringLength(2)]
        public string 管理对象代码 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        [StringLength(8)]
        public string 所属学校代码 { get; set; }

        [StringLength(10)]
        public string 所属院系代码 { get; set; }

        [StringLength(20)]
        public string 所属专业代码 { get; set; }

        [StringLength(10)]
        public string 国家代码 { get; set; }

        [StringLength(10)]
        public string 省份代码 { get; set; }

        [StringLength(10)]
        public string 城市代码 { get; set; }

        [StringLength(10)]
        public string 区县代码 { get; set; }

        [StringLength(2)]
        public string 性别代码 { get; set; }

        [StringLength(50)]
        public string 姓名 { get; set; }

        [StringLength(2)]
        public string 身份证类别代码 { get; set; }

        [StringLength(20)]
        public string 身份证号 { get; set; }

        public virtual 城市代码表 城市代码表 { get; set; }

        public virtual 国家代码表 国家代码表 { get; set; }

        public virtual 密码表 密码表 { get; set; }

        public virtual 区县代码表 区县代码表 { get; set; }

        public virtual 身份代码表 身份代码表 { get; set; }

        public virtual 身份证类别代码表 身份证类别代码表 { get; set; }

        public virtual 省份代码表 省份代码表 { get; set; }

        public virtual 性别代码表 性别代码表 { get; set; }

        public virtual 学校代码表 学校代码表 { get; set; }

        public virtual 院系代码表 院系代码表 { get; set; }

        public virtual 专业代码表 专业代码表 { get; set; }
    }
}
