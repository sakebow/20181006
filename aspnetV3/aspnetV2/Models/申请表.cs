namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 申请表
    {
        [Required]
        [StringLength(50)]
        public string 账号 { get; set; }

        [Key]
        public int 申请编号 { get; set; }

        [StringLength(120)]
        public string 申请标题 { get; set; }

        [StringLength(7500)]
        public string 申请概述 { get; set; }

        [Required]
        [StringLength(5)]
        public string 申请等级代码 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否需要材料 { get; set; }

        [Required]
        [StringLength(3)]
        public string 审核状态代码 { get; set; }

        public virtual 密码表 密码表 { get; set; }

        public virtual 申请材料表 申请材料表 { get; set; }
    }
}
