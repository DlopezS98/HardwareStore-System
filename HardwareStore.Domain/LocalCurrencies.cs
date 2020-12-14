using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class LocalCurrencies: Ctg_LocalCurrencies
    {
        public string Description { get => String.Format("{0} ({1})", this.Name, this.Symbol); }
    }
}
