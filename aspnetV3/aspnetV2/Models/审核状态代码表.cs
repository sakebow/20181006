namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 审核状态代码表
    {
        [Key]
        [StringLength(3)]
        public string 审核状态代码 { get; set; }

        [Required]
        [StringLength(30)]
        public string 审核状态 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }
    }
}
