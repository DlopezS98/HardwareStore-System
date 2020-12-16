using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Core.Interfaces
{
    public interface IInternalTransfersRepository
    {
        List<Transfers> GetTranfersList(DateTime StartDate, DateTime EndDate, int Status);
        void MainTransferTransaction(int Id, Tbl_Transfers transfer, List<TemporaryTransferList> TempList);
        List<TransferDetails> GetTransferDetails(int Id);

        void CreateDeletedProduct(Tbl_RemovedProducts RemovedProduct);
        List<RemovedProducts> GetRemovedProductsList(DateTime StartDate, DateTime EndDate, int Status);
    }
}
