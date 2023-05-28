using DataAccess.Abstract;
using DataAccess.Base;
using Entities.Concrete;
using Entities.Contexts;
using Entities.DTOs;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Results.Abstract;
using Utilities.Results.Base;
using Utilities.Results.Concrete;

namespace DataAccess.Concrete.EfCore
{
    public class EfClassDal : EfEntityRepositoryBase<Class, EfSchoolContext>, IClassDal
    {
        public List<ClassDetailDto> GetClassDetail(int ClassId)
        {
            throw new NotImplementedException();
            try
            {
                using (EfSchoolContext context = new EfSchoolContext())
                {
                    var result = from @class in context.Classes where @class.Id == ClassId
                                 from student in context.Students where @student.Id == ClassId
                                 join section in context.Sections on @class.SectionId equals section.Id
                                 join teacher in context.Teachers on @class.TeacherId equals teacher.Id
                                 select new ClassDetailDto()
                                 {
                                     ClassId = @class.Id,
                                     ClassName = @class.Name,
                                     ClassNumber = @class.Number,
                                     ClassSection = section.Name,
                                     ClassSize = @class.Size,
                                     TeacherId = teacher.Id,
                                     TeacherName = teacher.Name
                                 };
                    return result.ToList();
                }
            }
            catch (Exception e)
            {
                return default;
            }
        }

        public Task<List<ClassDetailDto>> GetClassDetailAsync(int ClassId)
        {
            throw new NotImplementedException();
        }
    }
}
