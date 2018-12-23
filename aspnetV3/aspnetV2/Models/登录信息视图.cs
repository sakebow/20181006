namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 登录信息视图
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

        public DateTime? 注册时间 { get; set; }

        public DateTime? 最近登录时间 { get; set; }

        public DateTime? 最近登出时间 { get; set; }

        [StringLength(4)]
        public string 账号是否被冻结 { get; set; }

        [StringLength(2)]
        public string 冻结等级 { get; set; }

        public DateTime? 解冻时间 { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int 冻结时长 { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(2)]
        public string 身份代码 { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(30)]
        public string 身份名称 { get; set; }
    }
}
