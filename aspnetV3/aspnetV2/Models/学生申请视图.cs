namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 学生申请视图
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int 申请编号 { get; set; }

        [StringLength(120)]
        public string 申请标题 { get; set; }

        [StringLength(7500)]
        public string 申请概述 { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(2)]
        public string 是否需要材料 { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(30)]
        public string 审核状态 { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(30)]
        public string 申请等级 { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(30)]
        public string 身份名称 { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(2)]
        public string 身份代码 { get; set; }
    }
}
