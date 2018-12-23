namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 申请材料表
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int 申请编号 { get; set; }

        [StringLength(150)]
        public string 申请材料文件路径 { get; set; }

        public virtual 申请表 申请表 { get; set; }
    }
}
