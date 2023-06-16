using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using SatayimSana.Services.Concrete;
using System.Security.Claims;
using SatayimSana.WebUI.Models;
using SatayimSana.Services.Abstract;
using SatayimSana.Services.DTOs.Request;

namespace SatayimSana.WebUI.Controllers
{
    public class UserController : Controller
    {
        private readonly ISituationService situationService;
        private readonly IUserService userService;
        public UserController(IUserService userService, ISituationService situationService)
        {
            this.userService = userService;
            this.situationService = situationService;

        }
        public IActionResult Index()
        {
            return View();
        }

        
        public IActionResult Login(string? gidilecekSayfa)
        {
            ViewBag.ReturnUrl = gidilecekSayfa;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(UserLoginModel userLogin, string? gidilecekSayfa)
        {

            UserLogin user = new UserLogin() { Email = userLogin.Email, Password = userLogin.Password};
            bool IsUser = userService.CheckPassword(user);
            if (IsUser)
            {
                var verifyUser = userService.GetByEmail(user.Email);
                var situation = situationService.GetById(verifyUser.StatusId);
                Claim[] claims = new Claim[]
                {
                    new Claim(ClaimTypes.Name,verifyUser.Name),
                    new Claim(ClaimTypes.Email,verifyUser.Email),
                    new Claim(ClaimTypes.Role,situation.Name)
                };
                ClaimsIdentity identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                ClaimsPrincipal principal = new ClaimsPrincipal(identity);
                await HttpContext.SignInAsync(principal);

                if (!string.IsNullOrEmpty(gidilecekSayfa) && Url.IsLocalUrl(gidilecekSayfa))
                {
                    return Redirect(gidilecekSayfa);
                }
                return Redirect("/");

            }
            ModelState.AddModelError("login", "Kullanıcı adı ya da şifre yanlış!");
            return View();
        }
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync();
            return Redirect("/");
        }
    }
}
