using DataAccess.Abstract;
using DataAccess.Base;
using Entities.Concrete;
using Entities.Contexts;
using Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete.EfCore
{
    public class EfStudentDal : EfEntityRepositoryBase<Student, EfSchoolContext>, IStudentDal
    {
        public List<StudentDetailDto> GetStudentDetails(int StudentId)
        {
            try
            {
                using (EfSchoolContext context = new EfSchoolContext())
                {
                    var result = from student in context.Students where @student.Id == StudentId
                                 from @class in context.Classes where @class.Id == student.ClassId
                                 join section in context.Sections on @class.SectionId equals section.Id
                                 join teacher in context.Teachers on @class.TeacherId equals teacher.Id
                                 select new StudentDetailDto()
                                 {
                                     Id = student.Id,
                                     Age = DateTime.Now.Year - student.Bırthdate.Year,
                                     ClassName = @class.Name,
                                     Name = student.Name,
                                     Surname = student.Surname,
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

        public Task<List<StudentDetailDto>> GetStudentDetailsAsync(int StudentId)
        {
            throw new NotImplementedException();
        }
    }
}
