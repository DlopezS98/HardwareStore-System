using HardwareStore.Domain;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Core.Interfaces
{
    public interface ITransferRepository
    {
        DataTable ExecSpListProductTransfers(DateTime StartDate, DateTime EndDate, int Status);
        List<Transfers> GetTrasnfers(DateTime StartDate, DateTime EndDate, int Status);
        List<Transfers> GetTrasnfers();
        ResponseStatus CreateTransferRecord();
    }
}
