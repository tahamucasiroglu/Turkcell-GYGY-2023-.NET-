using Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Base
{
    public class TaskBase : ITask //burası server taraflı olması gerken kısımda burada halledeyim diye yaptım projeye dahil düşünülmeyecek
    {
        internal bool State { get; set; } = true;
        internal int Time { get; set; } = 1000;

        public TaskBase(bool? State, int? Time)
        {
            this.State = State ?? this.State;
            this.Time = Time ?? this.Time;
        }

        public TaskBase(bool State, int Time) : this((bool?)State,(int?)Time) {  } // atamanın tek yerde yapılması için burada null olarak yukarıdaki constructor a gönderdim doğru mu bilemem ama işlemleri tek yerde topladım bu sayede
        public TaskBase(bool State) : this(State,null) {   }
        public TaskBase(int Time) : this(null, Time) { }

        public virtual async Task Run() { throw new ArgumentException("Burayı override etmeden programı çalıştıramazsın"); }

        public void SetTime(int time) => Time = time;

        public void Start() => State = true;

        public void Stop() => State = false;
    }
}
