using Azure;
using Business.Abstract;
using Business.Base;
using DataAccess.Abstract;
using DataAccess.Concrete.EfCore;
using Entities.Concrete;
using Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Results.Abstract;
using Utilities.Results.Concrete;

namespace Business.Concrete
{
    public class StudentManager : BusinessVirtualBase<Student>, IStudentService
    {
        IStudentDal _studentDal;
        public StudentManager(IStudentDal studentDal) : base(studentDal)
        {
            _studentDal = studentDal;
        }

        public IDataResult<List<Student>> GetByAgeBiggerThan(int Age)
        {
            try
            {
                return new SuccessDataResult<List<Student>>(_studentDal.GetAll(s => DateTime.Now.Year - s.Bırthdate.Year >= Age ), "Öğrenci getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Student>>("öğrenci getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Student>>> GetByAgeBiggerThanAsync(int Age)
        {
            try
            {
                return new SuccessDataResult<List<Student>>(await _studentDal.GetAllAsync(s => DateTime.Now.Year - s.Bırthdate.Year >= Age), "Öğrenci getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Student>>("öğrenci getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Student>> GetByAgeLessThan(int Age)
        {
            try
            {
                return new SuccessDataResult<List<Student>>(_studentDal.GetAll(s => DateTime.Now.Year - s.Bırthdate.Year <= Age), "Öğrenci getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Student>>("öğrenci getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Student>>> GetByAgeLessThanAsync(int Age)
        {
            try
            {
                return new SuccessDataResult<List<Student>>(await _studentDal.GetAllAsync(s => DateTime.Now.Year - s.Bırthdate.Year <= Age), "Öğrenci getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Student>>("öğrenci getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Student>> GetByGender(int GenderId)
        {
            try
            {
                return new SuccessDataResult<List<Student>>(_studentDal.GetAll(s => s.GenderId == GenderId), "Öğrenci getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Student>>("öğrenci getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Student>>> GetByGenderAsync(int GenderId)
        {
            try
            {
                return new SuccessDataResult<List<Student>>(await _studentDal.GetAllAsync(s => s.GenderId == GenderId), "Öğrenci getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Student>>("öğrenci getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<Student> GetById(int Id)
        {
            try
            {
                return new SuccessDataResult<Student>(_studentDal.Get(s => s.Id == Id), "Öğrenci getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<Student>("öğrenci getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<Student>> GetByIdAsync(int Id)
        {
            try
            {
                return new SuccessDataResult<Student>(await _studentDal.GetAsync(s => s.Id == Id), "Öğrenci getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<Student>("öğrenci getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Student>> GetByName(string Name)
        {
            try
            {
                return new SuccessDataResult<List<Student>>(_studentDal.GetAll(s => s.Name.Contains(Name)), "Öğrenci getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Student>>("öğrenci getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Student>>> GetByNameAsync(string Name)
        {
            try
            {
                return new SuccessDataResult<List<Student>>(await _studentDal.GetAllAsync(s => s.Name.Contains(Name)), "Öğrenci getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Student>>("öğrenci getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Student>> GetBySurname(string Surname)
        {
            try
            {
                return new SuccessDataResult<List<Student>>(_studentDal.GetAll(s => s.Surname.Contains(Surname)), "Öğrenci getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Student>>("öğrenci getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Student>>> GetBySurnameAsync(string Surname)
        {
            try
            {
                return new SuccessDataResult<List<Student>>(await _studentDal.GetAllAsync(s => s.Surname.Contains(Surname)), "Öğrenci getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Student>>("öğrenci getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<StudentDetailDto>> GetStudentDetail(int StudentId)
        {
            try
            {
                List<StudentDetailDto> detail = _studentDal.GetStudentDetails(StudentId);
                if (detail == default)
                {
                    return new ErrorDataResult<List<StudentDetailDto>>("Öyle bir sınıf yok unut onu");
                }
                return new SuccessDataResult<List<StudentDetailDto>>(detail, "Sınıflar Başarıyla Getirildi");
            }
            catch (Exception)
            {
                return new ErrorDataResult<List<StudentDetailDto>>("Sınıf Getirmede Hata Var");
            }
        }

        public async Task<IDataResult<List<StudentDetailDto>>> GetStudentDetailAsync(int StudentId)
        {
            try
            {
                List<StudentDetailDto> detail = await _studentDal.GetStudentDetailsAsync(StudentId);
                if (detail == default)
                {
                    return new ErrorDataResult<List<StudentDetailDto>>("Öyle bir sınıf yok unut onu");
                }
                return new SuccessDataResult<List<StudentDetailDto>>(detail, "Sınıflar Başarıyla Getirildi");
            }
            catch (Exception)
            {
                return new ErrorDataResult<List<StudentDetailDto>>("Sınıf Getirmede Hata Var");
            }
        }
    }
}
