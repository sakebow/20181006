namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 出版社代码表
    {
        [Key]
        [StringLength(50)]
        public string 出版社代码 { get; set; }

        [Required]
        [StringLength(120)]
        public string 出版社名称 { get; set; }

        [StringLength(10)]
        public string 出版社所在省份 { get; set; }

        [StringLength(10)]
        public string 出版社所在城市 { get; set; }

        [StringLength(10)]
        public string 出版社所在区县 { get; set; }

        [StringLength(10)]
        public string 出版社所在街道 { get; set; }

        [StringLength(2)]
        public string 是否启用 { get; set; }

        public virtual 城市代码表 城市代码表 { get; set; }

        public virtual 街道代码表 街道代码表 { get; set; }

        public virtual 区县代码表 区县代码表 { get; set; }

        public virtual 省份代码表 省份代码表 { get; set; }
    }
}
