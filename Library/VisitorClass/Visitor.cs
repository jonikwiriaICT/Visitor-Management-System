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

        public bool CRUDVisitor (string RecID, string EmployeeID, string Name, string Mobile,string Organization, string City, string Address, string VisitPurpose, string Visit_Date , string Intime, string OutTime , string StatementType)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("CRUDVisitor", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RecID", RecID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@Mobile", Mobile);
            cmd.Parameters.AddWithValue("@Organization", Organization);
            cmd.Parameters.AddWithValue("@City", City);
            cmd.Parameters.AddWithValue("@Address", Address);
            cmd.Parameters.AddWithValue("@VisitPurpose", VisitPurpose);
            cmd.Parameters.AddWithValue("@Visit_Date", Visit_Date);
            cmd.Parameters.AddWithValue("@Intime", Intime);
            cmd.Parameters.AddWithValue("@OutTime", OutTime);
            cmd.Parameters.AddWithValue("@StatementType", StatementType);
            if (ExecuteNonQuery(cmd) <= 0)
            {
                ErrorMessage = "Unable to process transaction";
                return false;
            }
            ErrorMessage = "Record executed successfully .";
            return true;
        }

        public DataSet GetEmployee()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = " select emp_id as [Code], Name as [Desc] from Employee";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }


    }
}
