namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 冻结时间详细日志视图
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string 账号 { get; set; }

        [StringLength(100)]
        public string 设备ID { get; set; }

        [StringLength(100)]
        public string 移动设备PIN { get; set; }

        public int? 单次登陆尝试次数 { get; set; }

        public int? 单次密保问题尝试次数 { get; set; }

        [Key]
        [Column(Order = 1)]
        public DateTime 冻结时间 { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int 冻结时长 { get; set; }
    }
}
