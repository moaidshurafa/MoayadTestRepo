using LibraryManagementSystem.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllersWithViews();
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddDbContext<LibraryDbContext>(options => options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString)));
builder.Services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = false)
                .AddRoles<IdentityRole>() 
                .AddEntityFrameworkStores<LibraryDbContext>();



builder.Services.AddRazorPages();



var app = builder.Build();

using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    var roleManager = services.GetRequiredService<RoleManager<IdentityRole>>();
    var userManager = services.GetRequiredService<UserManager<IdentityUser>>();

    // Add Roles
    if (!await roleManager.RoleExistsAsync("Admin"))
    {
        await roleManager.CreateAsync(new IdentityRole("Admin"));
    }

    if (!await roleManager.RoleExistsAsync("Librarian"))
    {
        await roleManager.CreateAsync(new IdentityRole("Librarian"));
    }

    // Assign Admin role to a specific user
    var adminUser = await userManager.FindByEmailAsync("admin@library.com");
    if (adminUser != null && !(await userManager.IsInRoleAsync(adminUser, "Admin")))
    {
        await userManager.AddToRoleAsync(adminUser, "Admin");
    }
}

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();
app.MapRazorPages();
app.MapControllerRoute(
    name: "default",
    pattern: "{area=Librarian}/{controller=Home}/{action=Index}/{id?}");

app.Run();

static async Task SeedRolesAndAdminAsync(RoleManager<IdentityRole> roleManager, UserManager<IdentityUser> userManager)
{
    if (!await roleManager.RoleExistsAsync("Admin"))
    {
        await roleManager.CreateAsync(new IdentityRole("Admin"));
    }

    if (!await roleManager.RoleExistsAsync("Librarian"))
    {
        await roleManager.CreateAsync(new IdentityRole("Librarian"));
    }

    string adminEmail = "admin@example.com";
    string adminPassword = "Admin@123";

    var adminUser = await userManager.FindByEmailAsync(adminEmail);

    if (adminUser == null)
    {
        var newAdminUser = new IdentityUser
        {
            UserName = adminEmail,
            Email = adminEmail,
            EmailConfirmed = true
        };

        var result = await userManager.CreateAsync(newAdminUser, adminPassword);

        if (result.Succeeded)
        {
            await userManager.AddToRoleAsync(newAdminUser, "Admin");
        }
    }
}

