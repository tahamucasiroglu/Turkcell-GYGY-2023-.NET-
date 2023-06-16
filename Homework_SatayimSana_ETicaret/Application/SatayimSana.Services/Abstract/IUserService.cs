using SatayimSana.Entities.Concrete;
using SatayimSana.Services.Abstract.Base;
using SatayimSana.Services.DTOs.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Services.Abstract
{
    public interface IUserService : IService<User>
    {
        public IList<User> GetUsersByName(string name);
        public Task<IList<User>> GetUsersByNameAsync(string name);
        public IList<User> GetUsersBySurname(string surname);
        public Task<IList<User>> GetUsersBySurnameAsync(string surname);
        public User? GetUserByIdentificationNumber(string identificationNumber);
        public Task<User?> GetUserByIdentificationNumberAsync(string identificationNumber);
        public User? GetUserByPhoneNumber(string identificationNumber);
        public Task<User?> GetUserByPhoneNumberAsync(string identificationNumber);
        public IList<User> GetUsersByStatusId(int id);
        public Task<IList<User>> GetUsersByStatusIdAsync(int id);
        public bool CheckPassword(UserLogin user, string password);
        public bool CheckPassword(int userId, string password);
        public bool CheckPassword(UserLogin user);
        public Task<bool> CheckPasswordAsync(UserLogin user, string password);
        public Task<bool> CheckPasswordAsync(int userId, string password);
        public Task<bool> CheckPasswordAsync(UserLogin user);
        public User GetById(int id);
        public Task<User> GetByIdAsync(int id);
        public User GetByEmail(string email);
        public Task<User> GetByEmailAsync(string email);
        public User GetByPhone(string phone);
        public Task<User> GetByPhoneAsync(string phone);
    }
}
