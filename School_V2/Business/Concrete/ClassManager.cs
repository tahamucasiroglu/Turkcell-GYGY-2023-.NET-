using Business.Abstract;
using Business.Base;
using DataAccess.Abstract;
using DataAccess.Concrete.EfCore;
using Entities.Concrete;
using Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Results.Abstract;
using Utilities.Results.Concrete;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Business.Concrete
{
    public class ClassManager : BusinessVirtualBase<Class>, IClassService
    {
        IClassDal _classDal;
        public ClassManager(IClassDal classDal) : base(classDal) 
        { 
            _classDal = classDal;
        }
  
        private bool CheckClassName(Class entity) =>
            entity.Number > 0 && entity.SectionId > 0 && entity.Size > 10 && entity.TeacherId > 0;
        public new IResult Add(Class entity)
        {
            Console.WriteLine("classmanager");
            //kontroller
            if(CheckClassName(entity))
            {
                try
                {
                    _classDal.Add(entity);
                    return new SuccessResult("Sınıf Başarıyla Eklendi");
                }
                catch (Exception e)
                {
                    return new ErrorResult("Sınıf Eklemede Hata Var.\nHata Mesajı:\n"+e.Message);
                }
            }
            else
            {
                return new ErrorResult("Eklenmek İstenen Sınıf Kurallara Uymuyor");
            }
        }

        public new async Task<IResult> AddAsync(Class entity)
        {
            if (CheckClassName(entity))
            {
                try
                {
                    await _classDal.AddAsync(entity);
                    return new SuccessResult("Sınıf Başarıyla Eklendi");
                }
                catch (Exception e)
                {
                    return new ErrorResult("Sınıf Eklemede Hata Var.\nHata Mesajı:\n" + e.Message);
                }
            }
            else
            {
                return new ErrorResult("Eklenmek İstenen Sınıf Kurallara Uymuyor");
            }
        }

        public new IResult AddMultiple(List<Class> entity)
        {
            try
            {
                foreach (Class item in entity)
                {
                    if(!CheckClassName(item))
                    {
                        return new ErrorResult("Eklenmek İstenen Sınıf Kurallara Uymuyor Uymayan sınıfadı = " + item.Name);
                    }
                }
                _classDal.AddMultiple(entity);
                return new SuccessResult("Sınıf Başarıyla Eklendi");
            }
            catch (Exception e)
            {
                return new ErrorResult("Sınıf Eklemede Hata Var.\nHata Mesajı:\n" + e.Message);
            }
        }
        

        public new async Task<IResult> AddMultipleAsync(List<Class> entity)
        {
            try
            {
                foreach (Class item in entity)
                {
                    if (!CheckClassName(item))
                    {
                        return new ErrorResult("Eklenmek İstenen Sınıf Kurallara Uymuyor Uymayan sınıfadı = " + item.Name);
                    }
                }
                await _classDal.AddMultipleAsync(entity);
                return new SuccessResult("Sınıf Başarıyla Eklendi");
            }
            catch (Exception e)
            {
                return new ErrorResult("Sınıf Eklemede Hata Var.\nHata Mesajı:\n" + e.Message);
            }
        }

        public IDataResult<List<Class>> GetAllByGenderTeacher(Gender gender)
        {
            try
            {
                return new SuccessDataResult<List<Class>>(_classDal.GetAll(c => c.Teacher.GenderId == gender.Id), "Sınıflar Başarıyla Getirildi");
            }
            catch (Exception)
            {
                return new ErrorDataResult<List<Class>>("cinsiyet hocalı sınıf getirmede hata var Getirmede Hata Var");
            }
        }

        public async Task<IDataResult<List<Class>>> GetAllByGenderTeacherAsync(Gender gender)
        {
            try
            {
                return new SuccessDataResult<List<Class>>(await _classDal.GetAllAsync(c => c.Teacher.GenderId == gender.Id), "Sınıflar Başarıyla Getirildi");
            }
            catch (Exception)
            {
                return new ErrorDataResult<List<Class>>("cinsiyet hocalı sınıf getirmede hata var Getirmede Hata Var");
            }
        }

        public IDataResult<List<Class>> GetAllByNumber(int number)
        {
            try
            {
                return new SuccessDataResult<List<Class>>(_classDal.GetAll(c => c.Number == number), "Sınıflar Başarıyla Getirildi");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Class>>($"Sınıfı numarayla getirmede Getirmede Hata Var\nHata : {e.Message}");
            }
        }

        public async Task<IDataResult<List<Class>>> GetAllByNumberAsync(int number)
        {
            try
            {
                return new SuccessDataResult<List<Class>>(await _classDal.GetAllAsync(c => c.Number == number), "Sınıflar Başarıyla Getirildi");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Class>>($"Sınıfı numarayla getirmede Getirmede Hata Var\nHata : {e.Message}");
            }
        }

        public IDataResult<List<Class>> GetAllBySection(Section section)
        {
            try
            {
                return new SuccessDataResult<List<Class>>(_classDal.GetAll(c => c.SectionId == section.Id), "Sınıflar Başarıyla Getirildi");
            }
            catch (Exception)
            {
                return new ErrorDataResult<List<Class>>("Sınıfı section a göre Getirmede Hata Var");
            }
        }

        public async Task<IDataResult<List<Class>>> GetAllBySectionAsync(Section section)
        {
            try
            {
                return new SuccessDataResult<List<Class>>(await _classDal.GetAllAsync(c => c.SectionId == section.Id), "Sınıflar Başarıyla Getirildi");
            }
            catch (Exception)
            {
                return new ErrorDataResult<List<Class>>("Sınıfı section a göre Getirmede Hata Var");
            }
        }

        public IDataResult<List<Class>> GetAllSizeBiggerThan(int size)
        {
            try
            {
                return new SuccessDataResult<List<Class>>(_classDal.GetAll(c => c.Size >= size), "Sınıflar Başarıyla Getirildi");
            }
            catch (Exception)
            {
                return new ErrorDataResult<List<Class>>("Sınıfı sizeın büyüğüne göre getirmede  Getirmede Hata Var");
            }
        }

        public async Task<IDataResult<List<Class>>> GetAllSizeBiggerThanAsync(int size)
        {
            try
            {
                return new SuccessDataResult<List<Class>>(await _classDal.GetAllAsync(c => c.Size >= size), "Sınıflar Başarıyla Getirildi");
            }
            catch (Exception)
            {
                return new ErrorDataResult<List<Class>>("Sınıfı sizeın büyüğüne göre getirmede  Getirmede Hata Var");
            }
        }

        public IDataResult<List<Class>> GetAllSizeLessThan(int size)
        {
                try
                {
                    return new SuccessDataResult<List<Class>>(_classDal.GetAll(c => c.Size <= size), "Sınıflar Başarıyla Getirildi");
                }
                catch (Exception)
                {
                    return new ErrorDataResult<List<Class>>("Sınıfı size ın küçüğüne göre  Getirmede Hata Var");
                }
        }

        public async Task<IDataResult<List<Class>>> GetAllSizeLessThanAsync(int size)
        {
            try
            {
                return new SuccessDataResult<List<Class>>(await _classDal.GetAllAsync(c => c.Size <= size), "Sınıflar Başarıyla Getirildi");
            }
            catch (Exception)
            {
                return new ErrorDataResult<List<Class>>("Sınıfı size ın küçüğüne göre  Getirmede Hata Var");
            }
        }

        public IDataResult<Class> GetById(int Id)
        {
            try
            {
                return new SuccessDataResult<Class>(_classDal.Get(c => c.Id == Id), "Sınıflar Başarıyla Getirildi");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<Class>($"Sınıfı id ye göre Getirmede Hata Var\nHata : {e.Message}");
            }
        }

        public async Task<IDataResult<Class>> GetByIdAsync(int Id)
        {
            try
            {
                return new SuccessDataResult<Class>(await _classDal.GetAsync(c => c.Id == Id), "Sınıflar Başarıyla Getirildi");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<Class>($"Sınıfı id ye göre Getirmede Hata Var\nHata : {e.Message}");
            }
        }

        public IDataResult<List<ClassDetailDto>> GetDetail(int ClassId)
        {
            try
            {
                List<ClassDetailDto> detail = _classDal.GetClassDetail(ClassId);
                if(detail == default)
                {
                    return new ErrorDataResult<List<ClassDetailDto>>("Öyle bir sınıf yok unut onu");
                }
                return new SuccessDataResult<List<ClassDetailDto>>(detail, "Sınıflar Başarıyla Getirildi");
            }
            catch (Exception)
            {
                return new ErrorDataResult<List<ClassDetailDto>>("Sınıf Getirmede Hata Var");
            }
        }

        public async Task<IDataResult<List<ClassDetailDto>>> GetDetailAsync(int ClassId)
        {
            try
            {
                List<ClassDetailDto> detail = await _classDal.GetClassDetailAsync(ClassId);
                if (detail == default)
                {
                    return new ErrorDataResult<List<ClassDetailDto>>("Öyle bir sınıf yok unut onu");
                }
                return new SuccessDataResult<List<ClassDetailDto>>(detail, "Sınıflar Başarıyla Getirildi");
            }
            catch (Exception)
            {
                return new ErrorDataResult<List<ClassDetailDto>>("Sınıf Getirmede Hata Var");
            }
        }
    }
}
