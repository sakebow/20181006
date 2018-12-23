namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 详细地址关联视图
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string 省份代码 { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(200)]
        public string 省份罗马拼音大写 { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(200)]
        public string 省份罗马拼音小写 { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(50)]
        public string 省份名称 { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(10)]
        public string 城市代码 { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(200)]
        public string 城市罗马拼音大写 { get; set; }

        [Key]
        [Column(Order = 6)]
        [StringLength(200)]
        public string 城市罗马拼音小写 { get; set; }

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
        [StringLength(200)]
        public string 区县罗马拼音大写 { get; set; }

        [Key]
        [Column(Order = 10)]
        [StringLength(200)]
        public string 区县罗马拼音小写 { get; set; }

        [Key]
        [Column(Order = 11)]
        [StringLength(50)]
        public string 区县名称 { get; set; }
    }
}
