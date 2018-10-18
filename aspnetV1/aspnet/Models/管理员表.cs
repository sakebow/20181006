namespace aspnet.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 管理员表
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string 账号 { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(20)]
        public string 密码 { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(10)]
        public string 管理对象 { get; set; }

        [StringLength(100)]
        public string obligate1 { get; set; }

        [StringLength(100)]
        public string obligate2 { get; set; }

        [StringLength(100)]
        public string obligate3 { get; set; }

        [StringLength(100)]
        public string obligate4 { get; set; }

        [StringLength(100)]
        public string obligate5 { get; set; }

        [StringLength(100)]
        public string obligate6 { get; set; }

        [StringLength(100)]
        public string obligate7 { get; set; }

        [StringLength(100)]
        public string obligate8 { get; set; }

        [StringLength(100)]
        public string obligate9 { get; set; }

        [StringLength(100)]
        public string obligate10 { get; set; }
    }
}
