using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Events
{
    public class KeyCreatedEventArgs : EventArgs
    {
        public string KeyName { get; set; }
    }
    public class KeyService
    {
        public event EventHandler<KeyCreatedEventArgs> KeyBuild;
        public void CreateKey(string key)
        {
            if (KeyBuild != null && key.Length == 1)
            {
                KeyCreatedEventArgs arg = new KeyCreatedEventArgs
                {
                    KeyName = key,
                };
                KeyBuild(this, arg);
            }
        }
        
    }
}
