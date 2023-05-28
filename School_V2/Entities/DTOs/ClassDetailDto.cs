using Entities.Abstract;
using Entities.Concrete;
//using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.DTOs
{
    public class ClassDetailDto : IDto
    {
        public int ClassId { get; set; }
        public string ClassName { get; set; }
        public string ClassSection { get; set; }
        public int TeacherId { get; set; }
        public string TeacherName { get; set; }
        public int ClassNumber { get; set; }
        public int ClassSize { get; set; }
        public List<Student> Students { get; set; } = new List<Student>();
    }
}
