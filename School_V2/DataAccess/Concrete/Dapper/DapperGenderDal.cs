using DataAccess.Abstract;
using DataAccess.Base;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete.Dapper
{
    public class DapperGenderDal : DapperEntityRepositoryBase<Gender>, IGenderDal
    {
    }
}
