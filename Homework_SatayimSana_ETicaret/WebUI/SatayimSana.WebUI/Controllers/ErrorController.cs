using Microsoft.AspNetCore.Mvc;

namespace SatayimSana.WebUI.Controllers
{
    public class ErrorController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        new public IActionResult NotFound()
        {
            return View();
        }

        public IActionResult UnAuthorizedLogin()
        {
            return View();
        }
    }
}
