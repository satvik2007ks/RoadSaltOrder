using SaltOrderForm.Library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;
using System.Web.Configuration;
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
                    LoadMnDotDistrictDropDown();
                    string qry = "Select * from SaltOrderContact";
                    DataSet ds1 = dbLibrary.idGetCustomResult(qry);
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        errorContact.InnerText = "If you continue to have trouble, please contact " + ds1.Tables[0].Rows[0]["ContactName"].ToString() + " - " + ds1.Tables[0].Rows[0]["ContactEmail"].ToString() + " or " + ds1.Tables[0].Rows[0]["ContactPhone"].ToString() + "";
                    }
                    MultiView1.SetActiveView(View2);
                }
            }
        }

        private void LoadMnDotDistrictDropDown()
        {
            string qur = "Select * from MnDOTDistricts";
            if (dbLibrary.idHasRows(qur))
            {
                DataSet ds = dbLibrary.idGetCustomResult(qur);
                ddlMnDotDistrict.DataTextField = "District";
                ddlMnDotDistrict.DataValueField = "DistrictID";
                ddlMnDotDistrict.DataSource = ds;
                ddlMnDotDistrict.DataBind();
                ddlMnDotDistrict.Items.Insert(0, new ListItem("--Select MnDot District--", "-1"));
                ddlMnDotDistrict.SelectedIndex = 0;
            }
        }

        protected void btnValidate_Click(object sender, EventArgs e)
        {
            string qur = "Select contactID from ContactDetails where emailID='" + txtEmail.Text + "'";
            DataSet ds = dbLibrary.idGetCustomResult(qur);
            if (ds.Tables[0].Rows.Count > 0)
            {
                divError.Attributes.Add("style", "display:none;");
                Session["contactID"] = ds.Tables[0].Rows[0]["contactID"].ToString();
                LoadMnDotDistrictDropDown();
                string qry = "Select * from SaltOrderContact";
                DataSet ds1 = dbLibrary.idGetCustomResult(qry);
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    errorContact.InnerText = "If you continue to have trouble, please contact "+ds1.Tables[0].Rows[0]["ContactName"].ToString()+ " - " + ds1.Tables[0].Rows[0]["ContactEmail"].ToString() + " or " + ds1.Tables[0].Rows[0]["ContactPhone"].ToString() + "";
                }
                MultiView1.SetActiveView(View2);
            }
            else
            {
                string qry = "Select * from SaltOrderContact";
                DataSet ds1 = dbLibrary.idGetCustomResult(qry);
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    lblError.Text = "Could not validate your emailID in our records. Please contact " + ds1.Tables[0].Rows[0]["ContactName"].ToString() + " - " + ds1.Tables[0].Rows[0]["ContactEmail"].ToString() + " or " + ds1.Tables[0].Rows[0]["ContactPhone"].ToString() + "";
                }
                //lblError.Text = "Could not validate your emailID in our records. Please contact LuAnn Olson LuAnn.Olson@state.mn.us or 651-201-2447";
                divError.Attributes.Add("style", "display:block;");
                return;
            }
        }

        [WebMethod(EnableSession = true)]
        public static string SendParameters(string opagencypoc, string opemail, string opphone, string opalternatephone, string oplocationtype, string opmndotdistrict, string districtname, string opaltagencypoc, string opaltphone, string opaltalternatephone, string opaltemail, string coname, string coemail, string cophone, List<OrderDetails> orderdetails)
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
            dt.Columns.Add("EarlyFill");
            dt.Columns.Add("earlyFilluntreatedSaltQty");
            dt.Columns.Add("earlyFilluntreatedSaltQtyType");
            dt.Columns.Add("earlyFilltreatedSaltQty");
            dt.Columns.Add("earlyFilltreatedSaltQtyType");

            string qur = dbLibrary.idBuildQuery("[SaveOrder]", HttpContext.Current.Session["contactID"].ToString(), opagencypoc, opemail, opphone, opalternatephone, oplocationtype, opmndotdistrict, opaltagencypoc, opaltphone, opaltalternatephone, opaltemail, coname, coemail, cophone);
            DataSet ds = dbLibrary.idGetCustomResult(qur);
            if (ds.Tables[0].Rows.Count > 0)
            {
                foreach (OrderDetails li in orderdetails)
                {
                    dt.Rows.Add(ds.Tables[0].Rows[0]["id"].ToString(), li.name, li.address, li.city, li.zip, li.unloadmethod, li.untreatedsaltqty, li.untreatedqtyType, li.treatedsaltqty, li.treatedqtyType, li.earlyFill, li.earlyFilluntreatedsaltqty, li.earlyFilluntreatedsaltqtyType, li.earlyFilltreatedsaltqty, li.earlyFilltreatedsaltqtyType);
                    dt.AcceptChanges();
                }
                if (dt.Rows.Count > 0)
                {
                    dbLibrary.idInsertDataTable("[SaveOrderDetails]", "@List", dt);
                }

                //Email Order Details Start
                try
                {


                    System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                    SmtpClient SmtpServer = new SmtpClient(WebConfigurationManager.AppSettings["SmtpClient"]);
                    mail.From = new MailAddress(WebConfigurationManager.AppSettings["FromEmailAddress"]);
                    mail.To.Add(opemail);
                    //  mail.To.Add(WebConfigurationManager.AppSettings["BccEmailAddress"]);
                    mail.Subject = "Salt Order Confirmation";
                    mail.IsBodyHtml = true;
                    string str = @"Dear " + opagencypoc + ", <br /><br /> This email confirms that we received your salt order.";
                    str += "<br /><br />Order Summary:<br /><br />";
                    str += "<h4>Primary Contact Information</h4><br /><table style='border: 1px solid #333'> " +
                        "<thead><tr><th>Primary Agency Contact</th><th>Email</th><th>Direct Phone(Preferred)</th><th>Alternate Phone(Other)</th><th>Are you City / County / Other ?</th><th>MnDOT District</th></tr></thead> " +
                        " <tbody><tr> " +
                        " <td><label style='font-size: 13px; font-weight: 200;'>" + opagencypoc + "</label> </td> " +
                        " <td><label style='font-size:13px;font-weight:200;'>" + opemail + "</label></td> " +
                        " <td><labelstyle='font-size:13px;font-weight:200;'>" + opphone + "</label></td> " +
                        " <td><label style='font-size:13px;font-weight:200;'>" + opalternatephone + "</label></td> " +
                        " <td><label style='font-size:13px;font-weight:200;'>" + oplocationtype + "</label></td> " +
                        " <td><label style='font-size:13px;font-weight:200;'>" + districtname + "</label></td> " +
                        " </tr></tbody></table>";

                    str += "<br /><br /><h4>Alternative Contact Information</h4><br /><table style='border: 1px solid #333'> " +
                        " <thead><tr><th>Agency Contact Alternate</th><th>Email</th><th>Direct Phone(Preferred)</th><th>Alternate Phone(Other)</th></tr></thead> " +
                        " <tbody><tr> " +
                        " <td><label style='font-size: 13px; font-weight: 200;'>" + opaltagencypoc + "</label> </td> " +
                        " <td><label style='font-size:13px;font-weight:200;'>" + opaltphone + "</label></td> " +
                        " <td><labelstyle='font-size:13px;font-weight:200;'>" + opaltalternatephone + "</label></td> " +
                        " <td><label style='font-size:13px;font-weight:200;'>" + opaltemail + "</label></td> " +
                        " </tr></tbody></table>";

                    str += "<br /><br /><h4>Contract Obligation</h4><br /><table style='border: 1px solid #333'> " +
                        " <thead><tr><th>Agency Contact Alternate</th><th>Email</th><th>Direct Phone</th></tr></thead> " +
                        " <tbody><tr> " +
                        " <td><label style='font-size: 13px; font-weight: 200;'>" + coname + "</label> </td> " +
                        " <td><label style='font-size:13px;font-weight:200;'>" + coemail + "</label></td> " +
                        " <td><labelstyle='font-size:13px;font-weight:200;'>" + cophone + "</label></td> " +
                        " </tr></tbody></table>";

                    str += "<br /><br /><table style='border: 1px solid #333'> " +
                        " <thead><tr><th>Name of Municipal Agency<br /></th> " +
                        " <th>Salt Delivery Street Address</th><th style='width: 180px;'>City</th><th style='width: 100px;'>Zip</th> " +
                         " <th style='width: 165px;'>Unloading Method </th><th style='width: 215px'>UNTREATED SALT</th> " +
                         " <th style='width: 215px'>TREATED SALT</th> " +
                         " <th> Able to take Early Fill?</th><th style='width: 215px'>UNTREATED SALT Early Fill Quantity</th> " +
                         " <th style='width: 215px'>TREATED SALT Early Fill Quantity</th></tr></thead> " +
                         " <tbody>";
                    // string rws = "";
                    foreach (DataRow dr in dt.Rows)
                    {
                        string earlyFill = dr["EarlyFill"].ToString() == "True" ? "Yes" : "No";
                        string earlyfilluntreated = "";
                        string earlyfilltreated = "";
                        if (earlyFill == "Yes")
                        {
                            earlyfilluntreated = dr["earlyFilluntreatedSaltQty"].ToString() + " " + dr["earlyFilluntreatedSaltQtyType"].ToString();
                            earlyfilltreated = dr["earlyFilltreatedSaltQty"].ToString() + " " + dr["earlyFilltreatedSaltQtyType"].ToString();
                        }
                        str += "<tr> " +
                            " <td><label style='font-size: 13px; font-weight: 200;'>" + dr["municipalAgencyName"].ToString() + "</label></td> " +
                            " <td><label style='font-size: 13px; font-weight: 200;'>" + dr["streetAddress"].ToString() + "</label></td> " +
                            " <td><label style='font-size: 13px; font-weight: 200;'>" + dr["city"].ToString() + "</label></td> " +
                            " <td><label style='font-size: 13px; font-weight: 200;'>" + dr["zip"].ToString() + "</label></td> " +
                            " <td><label style='font-size: 13px; font-weight: 200;'>" + dr["unloadingMethod"].ToString() + "</label></td> " +
                            " <td><label style='font-size: 13px; font-weight: 200;'>" + dr["untreatedSaltQty"].ToString() + " " + dr["untreatedSaltQtyType"].ToString() + "</label></td> " +
                            " <td><label style='font-size: 13px; font-weight: 200;'>" + dr["treatedSaltQty"].ToString() + " " + dr["treatedSaltQtyType"].ToString() + "</label></td> " +
                            " <td><label style='font-size: 13px; font-weight: 200;'>" + earlyFill + "</label></td> " +
                            " <td><label style='font-size: 13px; font-weight: 200;'>" + earlyfilluntreated + "</label></td> " +
                            " <td><label style='font-size: 13px; font-weight: 200;'>" + earlyfilltreated + "</label></td> " +
                            " </tr>";
                    }
                    str += "</tbody></table><br /><br /><br />";

                    AlternateView AV = AlternateView.CreateAlternateViewFromString(str, null, MediaTypeNames.Text.Html);
                    mail.AlternateViews.Add(AV);
                    SmtpServer.Port = int.Parse(WebConfigurationManager.AppSettings["EmailPort"]);
                    SmtpServer.EnableSsl = Boolean.Parse(WebConfigurationManager.AppSettings["EnableSSL"]);
                    SmtpServer.Send(mail);
                }
                catch (Exception ex)
                {

                }
                //End Email
                return "success";
            }
            else
            {
                return "failed";
            }
        }
    }
}