using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Core.Interfaces
{
    public interface ICurrencyRepository
    {
        List<ForeignCurrencies> ListForeignCurrencies();
        List<LocalCurrencies> ListLocalCurrencies();
        Ctg_CurrencyExchange GetACurrencyExchange(int local, int foreign);
    }
}
