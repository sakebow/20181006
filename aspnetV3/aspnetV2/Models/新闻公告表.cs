namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 新闻公告表
    {
        [Key]
        public int 编号 { get; set; }

        [StringLength(100)]
        public string 标题 { get; set; }

        [StringLength(120)]
        public string 文件路径 { get; set; }

        [StringLength(7000)]
        public string 简介 { get; set; }

        [Required]
        [StringLength(2)]
        public string 文件类型代码 { get; set; }

        public DateTime 上传时间 { get; set; }

        public DateTime? 修改时间 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否外部展示 { get; set; }

        public virtual 文件类型代码表 文件类型代码表 { get; set; }
    }
}
