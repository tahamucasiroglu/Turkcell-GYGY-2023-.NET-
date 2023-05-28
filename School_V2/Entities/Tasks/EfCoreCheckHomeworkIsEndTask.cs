using Entities.Abstract;
using Entities.Base;
using Entities.Concrete;
using Entities.Contexts;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Tasks
{
    public class EfCoreCheckHomeworkIsEndTask<T> : TaskBase where T : DbContext, new()
    {
        public EfCoreCheckHomeworkIsEndTask(bool State) : base(State){    }

        public EfCoreCheckHomeworkIsEndTask(int Time) : base(Time){   }

        public EfCoreCheckHomeworkIsEndTask(bool? State, int? Time) : base(State, Time){  }

        public EfCoreCheckHomeworkIsEndTask(bool State, int Time) : base(State, Time){    }

        public override async Task Run()
        {
            while (State)
            {
                using (T context = new T())
                {
                    foreach (Post e in context.Set<Post>().Where(e => e.EndDate < DateTime.Now && !e.IsEnd).ToList())
                    {
                        e.IsEnd = true;
                    }
                    context.SaveChanges();
                    Console.WriteLine(DateTime.Now.ToString());
                }
                await Task.Delay(Time);
                }
            }
    }
}
