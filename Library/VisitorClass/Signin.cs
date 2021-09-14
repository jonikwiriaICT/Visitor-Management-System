using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using _Foundation;
using System.Data;
using System.Data.SqlClient;

namespace VisitorClass
{
    public partial class SysAdminModel : _Database
    {
        public string UserType = string.Empty;
        public string Username = string.Empty;

        public string CreatedDate = string.Empty;
        public string UserPassword = string.Empty;
        public bool getClientProfile(string username, string sPassword)
        {
            try
            {
                string sPasswordDB = string.Empty;
                DataSet ds = new DataSet();
                string sSQL = "SELECT * FROM qry_employee WHERE [Email]=@Email ";
                SqlCommand objCmd = new SqlCommand();
                objCmd.Parameters.Clear();
                objCmd.Parameters.AddWithValue("@Email", username);
                objCmd.CommandText = sSQL;
                ds = ExecuteDataSet(objCmd);
                if (ds.Tables[0].Rows.Count <= 0)
                {
                    ErrorMessage = "Invalid User. Contact Administrator.";
                    return false;
                }
                Username = ds.Tables[0].Rows[0]["EmployeeName"].ToString();
                sPasswordDB = ds.Tables[0].Rows[0]["Password"].ToString();
                if (sPasswordDB.Trim() == string.Empty)
                {
                    ErrorMessage = "Password Not found in the database.";
                }
                else
                {
                    sPasswordDB = sPasswordDB;
                    if (sPassword != sPasswordDB)
                    {
                        ErrorMessage = "Invalid password.";
                        return false;
                    }
                }
                UserPassword = sPasswordDB;
                UserType = ds.Tables[0].Rows[0]["UserType"].ToString();
                CreatedDate = ds.Tables[0].Rows[0]["CreatedDate"].ToString();
                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = "No Login Connection.";
                return false;
            }
        }

    }
}