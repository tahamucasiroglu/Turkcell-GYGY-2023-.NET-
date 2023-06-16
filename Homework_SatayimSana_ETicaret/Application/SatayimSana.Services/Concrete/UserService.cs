using AutoMapper;
using SatayimSana.Entities.Concrete;
using SatayimSana.Infrastructure.Repositories.Abstract;
using SatayimSana.Infrastructure.Repositories.Abstract.Base;
using SatayimSana.Services.Abstract;
using SatayimSana.Services.DTOs.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Services.Concrete
{
    public class UserService : IUserService
    {
        private readonly IUserRepository repository;
        private readonly IMapper mapper;
        public UserService(IUserRepository repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }
        public bool CheckPassword(UserLogin user, string password) =>
            repository.Get(u => u.Email == user.Email)?.Password == password;

        public bool CheckPassword(int userId, string password) =>
            repository.Get(u => u.Id == userId)?.Password == password;

        public bool CheckPassword(UserLogin user) =>
            repository.Get(u => u.Email == user.Email)?.Password == user.Password;

        public async Task<bool> CheckPasswordAsync(UserLogin user, string password) =>
            (await repository.GetAsync(u => u.Email == user.Email))?.Password == password;

        public async Task<bool> CheckPasswordAsync(int userId, string password) =>
            (await repository.GetAsync(u => u.Id == userId))?.Password == password;

        public async Task<bool> CheckPasswordAsync(UserLogin user) =>
            (await repository.GetAsync(u => u.Email == user.Email))?.Password == user.Password;

        public IList<User> GetAll() =>
            repository.GetAll();

        public async Task<IList<User>> GetAllAsync() =>
            await repository.GetAllAsync();

        public User? GetUserByIdentificationNumber(string identificationNumber) =>
            repository.Get(u => u.IdentificationNumber == identificationNumber);

        public async Task<User?> GetUserByIdentificationNumberAsync(string identificationNumber) =>
            await repository.GetAsync(u => u.IdentificationNumber == identificationNumber);

        public User? GetUserByPhoneNumber(string identificationNumber) =>
            repository.Get(u => u.IdentificationNumber == identificationNumber);

        public async Task<User?> GetUserByPhoneNumberAsync(string identificationNumber) =>
            await repository.GetAsync(u => u.IdentificationNumber == identificationNumber);
        public IList<User> GetUsersByName(string name) =>
            repository.GetAll(u => u.Name.Contains(name)).ToList();

        public async Task<IList<User>> GetUsersByNameAsync(string name) =>
            await repository.GetAllAsync(u => u.Name.Contains(name));

        public IList<User> GetUsersByStatusId(int id) =>
            repository.GetAll(u => u.StatusId == id).ToList();

        public async Task<IList<User>> GetUsersByStatusIdAsync(int id) =>
            await repository.GetAllAsync(u => u.StatusId == id);

        public IList<User> GetUsersBySurname(string surname) =>
            repository.GetAll(u => u.Surname.Contains(surname));

        public async Task<IList<User>> GetUsersBySurnameAsync(string surname) =>
            await repository.GetAllAsync(u => u.Surname.Contains(surname));
        public User GetById(int id) => repository.Get(u => u.Id == id);
        public async Task<User> GetByIdAsync(int id) => await repository.GetAsync(u => u.Id == id);
        public User GetByEmail(string email) => repository.Get(u => u.Email == email);
        public async Task<User> GetByEmailAsync(string email) => await repository.GetAsync(u => u.Email == email);
        public User GetByPhone(string phone) => repository.Get(u => u.Phone == phone);
        public async Task<User> GetByPhoneAsync(string phone) => await repository.GetAsync(u => u.Phone == phone);
    }
}
