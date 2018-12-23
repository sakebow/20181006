namespace aspnetV2.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class identity : DbContext
    {
        public identity()
            : base("name=identity1")
        {
        }

        public virtual DbSet<身份对照表> 身份对照表 { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<身份对照表>()
                .Property(e => e.身份代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<身份对照表>()
                .Property(e => e.账号)
                .IsUnicode(false);
        }
    }
}
