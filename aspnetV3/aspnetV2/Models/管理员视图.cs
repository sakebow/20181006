namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 管理员视图
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string 账号 { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        [StringLength(2)]
        public string 管理对象代码 { get; set; }

        [StringLength(50)]
        public string 姓名 { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(10)]
        public string 国家代码 { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(50)]
        public string 国家名称 { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(10)]
        public string 省份代码 { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(50)]
        public string 省份名称 { get; set; }

        [Key]
        [Column(Order = 6)]
        [StringLength(10)]
        public string 城市代码 { get; set; }

        [Key]
        [Column(Order = 7)]
        [StringLength(50)]
        public string 城市名称 { get; set; }

        [Key]
        [Column(Order = 8)]
        [StringLength(10)]
        public string 区县代码 { get; set; }

        [Key]
        [Column(Order = 9)]
        [StringLength(50)]
        public string 区县名称 { get; set; }

        [Key]
        [Column(Order = 10)]
        [StringLength(8)]
        public string 学校代码 { get; set; }

        [Key]
        [Column(Order = 11)]
        [StringLength(80)]
        public string 学校名称 { get; set; }

        [Key]
        [Column(Order = 12)]
        [StringLength(10)]
        public string 院系代码 { get; set; }

        [Key]
        [Column(Order = 13)]
        [StringLength(80)]
        public string 院系名称 { get; set; }

        [Key]
        [Column(Order = 14)]
        [StringLength(20)]
        public string 专业代码 { get; set; }

        [Key]
        [Column(Order = 15)]
        [StringLength(80)]
        public string 专业名称 { get; set; }

        [Key]
        [Column(Order = 16)]
        [StringLength(2)]
        public string 性别代码 { get; set; }

        [Key]
        [Column(Order = 17)]
        [StringLength(16)]
        public string 性别 { get; set; }

        [Key]
        [Column(Order = 18)]
        [StringLength(80)]
        public string 密码 { get; set; }
    }
}
