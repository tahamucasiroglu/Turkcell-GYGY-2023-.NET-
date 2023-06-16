using Microsoft.EntityFrameworkCore;
using SatayimSana.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Infrastructure.Contexts
{
    public partial class SatayimSanaDbContext : DbContext
    {
        private readonly string? connectionString;
        public SatayimSanaDbContext()
        {
            
        }
        public SatayimSanaDbContext(string? connectionString)
        {
            this.connectionString = connectionString;
        }

        public SatayimSanaDbContext(DbContextOptions<SatayimSanaDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<CategoryFeature> CategoryFeatures { get; set; }

        public virtual DbSet<CategoryFeatureItem> CategoryFeatureItems { get; set; }

        public virtual DbSet<MainCategory> MainCategories { get; set; }

        public virtual DbSet<Product> Products { get; set; }

        public virtual DbSet<ProductFeature> ProductFeatures { get; set; }

        public virtual DbSet<Situation> Situations { get; set; }

        public virtual DbSet<SubCategory> SubCategories { get; set; }

        public virtual DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking);  //heryere AsNoTracking koyduktan sonra burası aklıma geldi :D
            if(connectionString != null)
            {
                optionsBuilder.UseSqlServer(connectionString);
            }
            //optionsBuilder.UseSqlServer("Server=(localdb)\\MSSQLLocalDB; Database=SatayimSanaDB; Trusted_Connection=True;");
        }
            

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            modelBuilder.UseCollation("Turkish_CI_AS"); 

            modelBuilder.Entity<CategoryFeature>(entity =>
            {
                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.SubCategory).WithMany(p => p.CategoryFeatures)
                    .HasForeignKey(d => d.SubCategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CategoryFeatures_SubCategories");
            });

            modelBuilder.Entity<CategoryFeatureItem>(entity =>
            {
                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.CategoryFeature).WithMany(p => p.CategoryFeatureItems)
                    .HasForeignKey(d => d.CategoryFeatureId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CategoryFeatureItems_CategoryFeatures");
            });

            modelBuilder.Entity<MainCategory>(entity =>
            {
                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.Property(e => e.Describtions)
                    .HasMaxLength(250)
                    .IsUnicode(false);
                entity.Property(e => e.ImageURl)
                .HasMaxLength(100)
                .IsUnicode(false);
                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.SubCategory).WithMany(p => p.Products)
                    .HasForeignKey(d => d.SubCategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Products_SubCategories");

                entity.HasOne(d => d.User).WithMany(p => p.Products)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Products_Users");
            });

            modelBuilder.Entity<ProductFeature>(entity =>
            {
                entity.HasOne(d => d.Feature).WithMany(p => p.ProductFeatures)
                    .HasForeignKey(d => d.FeatureId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductFeatures_CategoryFeatureItems");

                entity.HasOne(d => d.Product).WithMany(p => p.ProductFeatures)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductFeatures_Products");
            });

            modelBuilder.Entity<Situation>(entity =>
            {
                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<SubCategory>(entity =>
            {
                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.MainCategory).WithMany(p => p.SubCategories)
                    .HasForeignKey(d => d.MainCategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SubCategories_MainCategories");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.IdentificationNumber)
                    .HasMaxLength(11)
                    .IsUnicode(false);
                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false);
                entity.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false);
                entity.Property(e => e.Password)
                    .HasMaxLength(64)
                    .IsUnicode(false);
                entity.Property(e => e.Phone)
                    .HasMaxLength(11)
                    .IsUnicode(false);
                entity.Property(e => e.Surname)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.Status).WithMany(p => p.Users)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Users_Situations");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
