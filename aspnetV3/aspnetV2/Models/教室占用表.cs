namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 教室占用表
    {
        [Key]
        [StringLength(10)]
        public string 教室代码 { get; set; }

        [Required]
        [StringLength(4)]
        public string 是否占用 { get; set; }

        public DateTime? 占用开始时间 { get; set; }

        public DateTime? 占用结束时间 { get; set; }

        [StringLength(2000)]
        public string 占用理由 { get; set; }

        public int? 参与人数 { get; set; }

        [StringLength(50)]
        public string 负责人账号 { get; set; }

        [Required]
        [StringLength(50)]
        public string 联系方式 { get; set; }

        public virtual 教室代码表 教室代码表 { get; set; }

        public virtual 密码表 密码表 { get; set; }
    }
}
