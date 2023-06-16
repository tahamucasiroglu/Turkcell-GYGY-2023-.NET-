namespace SatayimSana.WebUI.Middlewares
{
    public class CheckControllerMiddleware
    {
        private readonly RequestDelegate _next;

        public CheckControllerMiddleware(RequestDelegate next)
        {
            _next = next;
        }
        public async Task Invoke(HttpContext context)
        {
            string method = context.Request.Method;
            string ContentType = context.Request.ContentType;

            Console.WriteLine($"istek methodu = {method}  content type ı = {ContentType}");

            await _next(context);

            if (context.Response.StatusCode == 404 && !context.Response.HasStarted)
            {
                context.Response.Redirect("/Error/NotFound");
            }
        }
    }
}
