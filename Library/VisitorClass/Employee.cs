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

        public bool CRUDEmployee (string RecID, string Department, string Email, string Password,string Name,string UserTypeID,string StatementType)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("CRUDEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RecID", RecID);
            cmd.Parameters.AddWithValue("@Department", Department);
            cmd.Parameters.AddWithValue("@Email", Email);
            cmd.Parameters.AddWithValue("@Password", Password);
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@UserTypeID", UserTypeID);
            cmd.Parameters.AddWithValue("@StatementType", StatementType);
            if (ExecuteNonQuery(cmd) <= 0)
            {
                ErrorMessage = "Unable to process transaction";
                return false;
            }
            ErrorMessage = "Record executed successfully .";
            return true;
        }

        public DataSet GetDepartment()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = " select department_id as [Code], department_name as [Desc] from Department";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }

        public DataSet GetUserType()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = " select userTypeID as [Code], User_Type as [Desc] from UserType";
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
