using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class LoginResponse : ResponseStatus
    {
        public Users User { get; set; }
    }
}
