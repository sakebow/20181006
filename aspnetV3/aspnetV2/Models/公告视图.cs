namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 公告视图
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int 编号 { get; set; }

        [StringLength(100)]
        public string 标题 { get; set; }

        [StringLength(7000)]
        public string 简介 { get; set; }

        [Key]
        [Column(Order = 1)]
        public DateTime 上传时间 { get; set; }

        [StringLength(120)]
        public string 文件路径 { get; set; }

        public DateTime? 修改时间 { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(20)]
        public string 文件类型名称 { get; set; }
    }
}
