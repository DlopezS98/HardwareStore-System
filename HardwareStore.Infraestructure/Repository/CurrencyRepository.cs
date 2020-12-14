using HardwareStore.Core.Interfaces;
using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Core.Repository
{
    public class CurrencyRepository : HardwareStoreRepository, ICurrencyRepository
    {
        private readonly HardwareStoreEntities Context;
        public CurrencyRepository(HardwareStoreEntities Context): base(Context)
        {
            this.Context = Context;
        }

        public Ctg_CurrencyExchange GetACurrencyExchange(int local, int foreign)
        {
            var obj = this.Context.Ctg_CurrencyExchange
                .FirstOrDefault(e => e.Fk_LocalCurrency == local &&
                                     e.Fk_ForeignCurrency == foreign &&
                                     e.Cye_Deleted == false);
            return obj;
        }

        public List<ForeignCurrencies> ListForeignCurrencies()
        {
            var list = this.Context.Ctg_ForeignCurrencies.Select(e => new ForeignCurrencies()
            {
                Pk_CurrencyID = e.Pk_CurrencyID,
                Cy_Name = e.Cy_Name,
                Cy_Symbol = e.Cy_Symbol,
                Cy_Deleted = e.Cy_Deleted
            }).Where(e => e.Cy_Deleted == false).ToList();

            return list;
        }

        public List<LocalCurrencies> ListLocalCurrencies()
        {
            var list = this.Context.Ctg_LocalCurrencies.Select(e => new LocalCurrencies()
            {
                Id = e.Id,
                Name = e.Name,
                Symbol = e.Symbol,
                Deleted = e.Deleted
            }).Where(e => e.Deleted == false).ToList();

            return list;
        }
    }
}
