namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 申请等级代码表
    {
        [Key]
        [StringLength(5)]
        public string 申请等级代码 { get; set; }

        [Required]
        [StringLength(30)]
        public string 申请等级 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }
    }
}
