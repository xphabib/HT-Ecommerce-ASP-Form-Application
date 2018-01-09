using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HT_Ecommerce.DAL
{
    interface IQuery
    {
        DataSet Select();
    }
}
