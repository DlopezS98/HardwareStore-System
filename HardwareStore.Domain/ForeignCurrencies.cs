using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class ForeignCurrencies: Ctg_ForeignCurrencies
    {
        public string Description { get => String.Format("{0} ({1})", this.Cy_Name, this.Cy_Symbol); }
    }
}
