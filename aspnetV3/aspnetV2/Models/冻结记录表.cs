namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 冻结记录表
    {
        [Key]
        [StringLength(50)]
        public string 账号 { get; set; }

        public DateTime 冻结时间 { get; set; }

        [Required]
        [StringLength(2)]
        public string 冻结等级 { get; set; }

        public virtual 冻结等级代码表 冻结等级代码表 { get; set; }

        public virtual 密码表 密码表 { get; set; }
    }
}
