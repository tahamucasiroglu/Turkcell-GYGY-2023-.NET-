using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using XSystem.Security.Cryptography;

namespace SatayimSana.Services.DTOs.Request
{
    public class UserLogin
    {
        public string Email { get; set;}
        private string _password;
        public string Password
        {
            get { return _password; }
            set
            {
                byte[] bytes = Encoding.UTF8.GetBytes(value);
                SHA256Managed sha256 = new SHA256Managed();
                byte[] hashedBytes = sha256.ComputeHash(bytes);
                string hashedPassword = BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
                _password = hashedPassword;
            }
        }
    }
}
