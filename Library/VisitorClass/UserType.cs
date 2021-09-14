using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using _Foundation;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace VisitorClass
{
    public partial class SysAdminModel : _Database
    {
        public static int PageSize = 10;
        public bool CRUDUserType( string RecID , string UserType, string StatementType)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("CRUDUserType", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RecID", RecID);
            cmd.Parameters.AddWithValue("@UserType", UserType);
            cmd.Parameters.AddWithValue("@StatementType", StatementType);
            if (ExecuteNonQuery(cmd) <= 0)
            {
                ErrorMessage = "Unable to process transaction";
                return false;
            }
            ErrorMessage = "Record executed successfully .";
            return true;
        }

       


    }
}
