using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace SaltOrderForm.Library
{
    public class dbLibrary
    {
        public static string conStr = ConfigurationManager.ConnectionStrings["saltOrderconStr"].ToString();

        public static DataSet idGetCustomResult(string qry)
        {
            DataSet ds = new DataSet();
            SqlConnection conn1 = new SqlConnection(dbLibrary.conStr);
            SqlDataAdapter dataadapter1 = new SqlDataAdapter(qry, conn1);
            try
            {
                conn1.Open();
                dataadapter1.Fill(ds);
                return ds;

            }
            catch
            {
                throw;
                // ds = null;
                //return ds;
            }
            finally
            {
                conn1.Close();
            }
        }



        public static void idInsertDataTable(string procedureName, string paramName, DataTable dt)
        {

            SqlConnection conn = new SqlConnection(dbLibrary.conStr);
            SqlCommand cmd = new SqlCommand(procedureName, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter dtparam = cmd.Parameters.AddWithValue(paramName, dt);
            dtparam.SqlDbType = SqlDbType.Structured;
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                conn.Close();
            }
        }

        public static string idGetAFieldByQuery(string qur)
        {
            string retStr = "";

            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(dbLibrary.conStr);
            SqlDataAdapter dataadapter1 = new SqlDataAdapter(qur, conn);
            try
            {
                conn.Open();
                dataadapter1.Fill(ds);
                conn.Close();
                if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
                {
                    retStr = ds.Tables[0].Rows[0][0].ToString();
                }
            }
            catch
            {
                throw;
            }
            finally
            {
                conn.Close();
            }
            return retStr.Trim();
        }

        public static bool idHasRows(string qur)
        {
            bool retBool = false;

            SqlConnection conn = new SqlConnection(dbLibrary.conStr);
            SqlCommand command = new SqlCommand(qur, conn);
            try
            {
                conn.Open();
                SqlDataReader reader;
                reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    retBool = true;
                }
                conn.Close();
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }
            return retBool;

        }
        public static void idExecute(string qur)
        {

            SqlConnection conn = new SqlConnection(conStr);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            try
            {
                conn.Open();
                cmd.CommandText = qur;
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception e)
            {
                if (!qur.Contains("sp_ErrorLog"))
                {
                    throw e;
                }
            }
            finally
            {
                conn.Close();
            }
        }

        public static string idBuildQuery(string ProcedureName, params string[] paramStr)
        {
            StringBuilder qur = new StringBuilder();
            qur.Append("Exec ");
            qur.Append(ProcedureName);
            qur.Append(" ");
            for (int i = 0; i <= paramStr.Length - 1; i++)
            {
                string prmstr = paramStr[i];
                if (prmstr.Contains("'"))
                {
                    prmstr = prmstr.Replace("'", "''");
                }
                qur.Append("'");
                qur.Append(prmstr);
                qur.Append("'");
                if (i != paramStr.Length - 1)
                    qur.Append(",");
            }
            return qur.ToString();
        }

      
    }
}
