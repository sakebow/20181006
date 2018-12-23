namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 登陆验证视图
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string 账号 { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(80)]
        public string 密码 { get; set; }

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
