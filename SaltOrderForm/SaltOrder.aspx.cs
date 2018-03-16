using SaltOrderForm.Library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaltOrderForm
{
    public partial class SaltOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["contactID"] == null)
                {
                    MultiView1.SetActiveView(View1);
                }
                else
                {
                    MultiView1.SetActiveView(View2);
                }
            }
        }

        protected void btnValidate_Click(object sender, EventArgs e)
        {
            string qur="Select contactID from ContactDetails where emailID='"+ txtEmail.Text + "'";
            DataSet ds = dbLibrary.idGetCustomResult(qur);
            if(ds.Tables[0].Rows.Count>0)
            {
                divError.Attributes.Add("style", "display:none;");
                Session["contactID"] = ds.Tables[0].Rows[0]["contactID"].ToString();
                MultiView1.SetActiveView(View2);
            }
            else
            {
                lblError.Text = "Could not validate your emailID in our records. Please contact LuAnn Olson LuAnn.Olson@state.mn.us or 651/201-2447";
                divError.Attributes.Add("style", "display:block;");
                return;
            }
        }

        [WebMethod(EnableSession =true)]
        public static string SendParameters(string opagencypoc, string opemail, string opphone, string opalternatephone, string oplocationtype, string coname, string coemail, string cophone, List<OrderDetails> orderdetails)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("orderID");
            dt.Columns.Add("municipalAgencyName");
            dt.Columns.Add("streetAddress");
            dt.Columns.Add("city");
            dt.Columns.Add("zip");
            dt.Columns.Add("unloadingMethod");
            dt.Columns.Add("untreatedSaltQty");
            dt.Columns.Add("untreatedSaltQtyType");
            dt.Columns.Add("treatedSaltQty");
            dt.Columns.Add("treatedSaltQtyType");
            string qur = dbLibrary.idBuildQuery("[SaveOrder]", HttpContext.Current.Session["contactID"].ToString(), opagencypoc, opemail, opphone, opalternatephone, oplocationtype, coname, coemail, cophone);
            DataSet ds = dbLibrary.idGetCustomResult(qur);
            if(ds.Tables[0].Rows.Count>0)
            {
                foreach(OrderDetails li in orderdetails)
                {
                    dt.Rows.Add(ds.Tables[0].Rows[0]["id"].ToString(), li.name, li.address, li.city, li.zip, li.unloadmethod, li.untreatedsaltqty, li.untreatedqtyType, li.treatedsaltqty, li.treatedqtyType);
                    dt.AcceptChanges();
                }
                if(dt.Rows.Count>0)
                {
                    dbLibrary.idInsertDataTable("[SaveOrderDetails]", "@List", dt);
                }
                return "success";
            }
            else
            {
                return "failed";
            }
        }
    }
}