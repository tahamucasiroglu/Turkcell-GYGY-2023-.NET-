using SatayimSana.Infrastructure.DTOs.Response;

namespace SatayimSana.WebUI.Models
{
    public class PaginationProductViewModel
    {
        public IList<ProductList> Products { get; set; }
        public PagingInfo PagingInfo { get; set; }
    }
}
