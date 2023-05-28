//using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Abstract
{
    public interface ITask
    {
        public virtual async Task Run() { throw new ArgumentException("Burayı override etmeden programı çalıştıramazsın"); }
        public void SetTime(int time);
        public void Stop();
        public void Start();
    }
}
