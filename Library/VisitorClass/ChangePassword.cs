﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using _Foundation;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace VisitorClass
{
    public partial class SysAdminModel : _Database
    {
        public bool changePassword(string Username, string NewPassword)
        {
            try
            {


                string sSQL = "update Employee set Password='" + NewPassword + "' where Email='" + Username + "'";
                SqlCommand objCmd = new SqlCommand();
                objCmd.CommandText = sSQL;
                if (ExecuteNonQuery(objCmd) <= 0)
                {
                    ErrorMessage = "Unable to update transaction";
                    return false;
                }
                ErrorMessage = "Password Changed successfully .";
                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = ex.ToString();
                return false;
            }
        }
    }
}
