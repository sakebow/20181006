namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 学校_院系_专业对照视图
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(8)]
        public string 学校代码 { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(80)]
        public string 学校名称 { get; set; }

        [StringLength(10)]
        public string 学校英文名称 { get; set; }

        [StringLength(100)]
        public string 学校英文名称大写 { get; set; }

        [StringLength(100)]
        public string 学校英文名称小写 { get; set; }

        [StringLength(100)]
        public string 学校罗马拼音大写 { get; set; }

        [StringLength(100)]
        public string 学校罗马拼音小写 { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(10)]
        public string 院系代码 { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(80)]
        public string 院系名称 { get; set; }

        [StringLength(100)]
        public string 院系英文名称 { get; set; }

        [StringLength(100)]
        public string 院系英文名称大写 { get; set; }

        [StringLength(100)]
        public string 院系英文名称小写 { get; set; }

        [StringLength(100)]
        public string 院系罗马拼音大写 { get; set; }

        [StringLength(100)]
        public string 院系罗马拼音小写 { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(20)]
        public string 专业代码 { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(80)]
        public string 专业名称 { get; set; }

        [StringLength(100)]
        public string 专业英文名称 { get; set; }

        [StringLength(100)]
        public string 专业英文名称大写 { get; set; }

        [StringLength(100)]
        public string 专业英文名称小写 { get; set; }

        [StringLength(100)]
        public string 专业罗马拼音大写 { get; set; }

        [StringLength(100)]
        public string 专业罗马拼音小写 { get; set; }
    }
}
