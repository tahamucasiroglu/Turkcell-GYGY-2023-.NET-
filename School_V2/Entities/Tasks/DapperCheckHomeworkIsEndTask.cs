using Dapper;
using Entities.Base;
using Entities.Concrete;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Constants;
using Utilities.Extensions;


namespace Entities.Tasks
{
    public class DapperCheckHomeworkIsEndTask : TaskBase
    {
        public DapperCheckHomeworkIsEndTask(bool State) : base(State) { }

        public DapperCheckHomeworkIsEndTask(int Time) : base(Time) { }

        public DapperCheckHomeworkIsEndTask(bool? State, int? Time) : base(State, Time) { }

        public DapperCheckHomeworkIsEndTask(bool State, int Time) : base(State, Time) { }

        public override async Task Run()
        {
            while (State)
            {
                using (SqlConnection context = new SqlConnection(ContextConstant.DapperConnectionString))
                {
                    await context.OpenAsync();
                    string query = @"UPDATE posts SET IsEnd = 1 WHERE IsEnd = 0 AND CONVERT(datetime, EndDate) < @currentDate";
                    await context.ExecuteAsync(query, new { currentDate = DateTime.Now });
                    Console.WriteLine(DateTime.Now.ToString());
                }
                await Task.Delay(Time);
            }
        }
    }
}
