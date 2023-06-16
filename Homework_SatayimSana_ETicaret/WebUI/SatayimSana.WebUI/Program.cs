using Microsoft.AspNetCore.Cors.Infrastructure;
using SatayimSana.Infrastructure.Mappings;
using SatayimSana.Services.Abstract.Base;
using SatayimSana.Services.Abstract;
using SatayimSana.Services.Concrete;
using SatayimSana.Infrastructure.Contexts;
using Microsoft.EntityFrameworkCore;
using SatayimSana.Infrastructure.Repositories.Abstract;
using SatayimSana.Infrastructure.Repositories.Concrete;
using SatayimSana.Entities.Concrete;
using SatayimSana.WebUI.Models;
using SatayimSana.WebUI.Middlewares;
using Microsoft.AspNetCore.Authentication.Cookies;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddAutoMapper(typeof(EntityToDtoMapProfile));

var connectionString = builder.Configuration.GetConnectionString("db");

builder.Services.AddScoped<ICategoryFeatureItemRepository, EFCategoryFeatureItemRepository>();
builder.Services.AddScoped<ICategoryFeatureItemService, CategoryFeatureItemService>();

builder.Services.AddScoped<ICategoryFeatureRepository, EFCategoryFeatureRepository>();
builder.Services.AddScoped<ICategoryFeatureService, CategoryFeatureService>();

builder.Services.AddScoped<IMainCategoryRepository, EFMainCategoryRepository>();
builder.Services.AddScoped<IMainCategoryService, MainCategoryService>();

builder.Services.AddScoped<IProductFeatureRepository, EFProductFeatureRepository>();
builder.Services.AddScoped<IProductFeatureService, ProductFeatureService>();

builder.Services.AddScoped<IProductRepository, EFProductRepository>();
builder.Services.AddScoped<IProductService, ProductService>();

builder.Services.AddScoped<ISituationRepository, EFSituationRepository>();
builder.Services.AddScoped<ISituationService, SituationService>();

builder.Services.AddScoped<ISubCategoryRepository, EFSubCategoryRepository>();
builder.Services.AddScoped<ISubCategoryService, SubCategoryService>();

builder.Services.AddScoped<IUserRepository, EFUserRepository>();
builder.Services.AddScoped<IUserService, UserService>();

//IoC
builder.Services.AddDbContext<SatayimSanaDbContext>(opt => opt.UseSqlServer(connectionString));
builder.Services.AddDatabaseDeveloperPageExceptionFilter();



// categorileri her sayfada db den çekmek veya her view içine göndermeyi önlemek için baþta hazýrlayýp içeri gömdük
using var context = new SatayimSanaDbContext(connectionString);
List<MainCategory> mainCategories = context.MainCategories.AsNoTracking().ToList();
List<SubCategory> subCategories = context.SubCategories.AsNoTracking().ToList();
List<CategoryViewModel> categoryModel = new List<CategoryViewModel>();
foreach (var category in mainCategories)
{
    categoryModel.Add(new() { MainCategory = category, SubCategories = subCategories.Where(s => s.MainCategoryId == category.Id).ToList() });
}
builder.Services.AddSingleton(categoryModel);
builder.Services.AddHttpContextAccessor();

builder.Services.AddMemoryCache();
builder.Services.AddResponseCaching(opt =>
{
    opt.SizeLimit = 100000;
});
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
                .AddCookie(opt =>
                {
                    opt.LoginPath = "/User/Login";
                    opt.ReturnUrlParameter = "Home";
                    opt.LogoutPath = "/User/Logout";
                    opt.AccessDeniedPath = "/Error/UnAuthorizedLogin";
                });

/*
 * sayfalama eklenecek
 * ekleme sayfalarý eklenecek
 * ekleme sayfalarýnda kiþi güvenliði eklenecek
 * üyelik eklenecek üye giriþi sadece üye ol koyma
 * sepete ekle eklencek ve bu session ile tutulacak
 * 
 * 
 */


var app = builder.Build();

app.UseMiddleware<CheckControllerMiddleware>();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

//using var scope = app.Services.CreateScope();
//var services = scope.ServiceProvider;
//var context = services.GetRequiredService<SatayimSanaDbContext>();






app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
