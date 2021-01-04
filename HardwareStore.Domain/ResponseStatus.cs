using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class ResponseStatus
    {
        public string Title { get; set; }
        public string Message { get; set; }
        public bool Success { get; set; }
    }
}
