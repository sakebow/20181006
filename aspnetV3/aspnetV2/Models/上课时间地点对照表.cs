namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 上课时间地点对照表
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(5)]
        public string 上课时间段代码 { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string 上课地点代码 { get; set; }

        public int 星期 { get; set; }

        public virtual 教室代码表 教室代码表 { get; set; }

        public virtual 上课时间段代码表 上课时间段代码表 { get; set; }
    }
}
