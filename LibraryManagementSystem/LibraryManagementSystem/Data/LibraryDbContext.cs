using LibraryManagementSystem.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;

namespace LibraryManagementSystem.Data
{
    public class LibraryDbContext : IdentityDbContext<IdentityUser>
    {
        public LibraryDbContext(DbContextOptions<LibraryDbContext> options)
            : base(options)
        {


        }
        public DbSet<Book> Books { get; set; }
        public DbSet<Member> Members { get; set; }
        public DbSet<Loan> Loans { get; set; }
        public DbSet<Category> Categories { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<Category>().HasData(
                new Category { CategoryId = 1 , CategoryName = "Action"},
                new Category { CategoryId = 2, CategoryName = "SciFi" },
                new Category { CategoryId = 3, CategoryName = "History" }
                );
        //    modelBuilder.Entity<Loan>()
        //.HasOne(l => l.Member)
        //.WithMany(m => m.Loans)
        //.HasForeignKey(l => l.MemberId)
        //.OnDelete(DeleteBehavior.Cascade);
        }
    }
}
