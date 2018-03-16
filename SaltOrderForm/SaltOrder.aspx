<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaltOrder.aspx.cs" Inherits="SaltOrderForm.SaltOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Road Salt Order Form</title>
    <link href="CSS/bootstrap.min.css" rel="stylesheet" />
    <%--<link rel="STYLESHEET" type="text/css" href="http://www.mmd.admin.state.mn.us/common.css">--%>
    <%--<script src="Scripts/angular.js"></script>--%>
    <script src="Scripts/angular.min.js"></script>
    <script src="Scripts/Script.js"></script>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/bootstrap-formhelpers-phone.js"></script>
    <link runat="server" rel="shortcut icon" href="Images/faviconLogo.ico" type="image/x-icon" />
    <link runat="server" rel="icon" href="Images/faviconLogo.ico" type="image/ico" />
     <meta http-equiv="X-UA-Compatible" content="IE=10" />
    <script type="text/javascript">
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
        });
    </script>
    <style>
        .mmdheader, td {
            margin-left: 0px;
            margin-top: 0px;
            font-family: arial, helvetica, sans-serif;
            font-size: 70%;
        }

        th {
            text-align: center !important;
        }

        footer {
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 70px;
        }

        .head {
            font-family: verdana, Arial, sans-serif;
            font-size: 20px;
            font-weight: bold;
            color: #003865;
        }

        .head2 {
            font-family: verdana, Arial, sans-serif;
            font-size: 18px;
            font-weight: bold;
            color: #003865;
        }

        .FooterText {
            font-family: verdana, Arial, sans-serif;
            font-size: 11px;
            color: #333333;
        }

        .searchBarBG, .searchBar, .surveyBorder {
            background-color: #003865;
        }

        .searchBar, .whiteLink {
            color: #FFFFFF;
        }

        .searchBar, .copy {
            font-size: 65%;
        }

        a:visited {
            font-family: verdana, Arial, sans-serif;
            font-size: 10px;
            text-decoration: none;
            font-weight: bold;
        }

        a:link {
            font-family: verdana, Arial, sans-serif;
            font-size: 10px;
            text-decoration: none;
            font-weight: bold;
        }

        .blackLink {
            color: #000000;
        }

        .topNav, .topNavBG {
            background-color: #CCCCCC;
        }

        .topNav {
            font-size: 71%;
        }

        .darkGray {
            background-color: #999999;
        }

        .white {
            background-color: #FFFFFF;
        }
    </style>
</head>
<body data-ng-app="saltOrderApp">
    <div>
        <table border="0" style="width: 100%" class="mmdheader">
            <tr>
                <td style="width: 50%">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <img src="http://www.mmd.admin.state.mn.us/gifs/osplogo.jpg" alt="Office of State Procurement Logo" /></td>
                <td></td>
                <td width="50%" nowrap valign="bottom" align="right"><span class="head">&nbsp; &nbsp; &nbsp; &nbsp; Office of State Procurement</span><br />
                    <br />
                    <span class="head2">Road Salt Order Form</span><br />
                    <br />
                    <a href="https://mn.gov">
                        <img src="http://www.mmd.admin.state.mn.us/gifs/mngov.jpg" border="0" alt="Go To Minnesota's Home Page" /></a>
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="2" cellspacing="0" border="0" class="mmdheader">
            <tr class="searchBarBG">
                <td align="left" class="searchBar" nowrap valign="center">
                    <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="10" height="25" hspace="0" vspace="0" border="0" align="center" /><a href="http://www.mmd.admin.state.mn.us/mn01000.htm" class="whiteLink" align="center">About OSP</a> | <a href="http://www.mmd.admin.state.mn.us/mn01085.asp" class="whiteLink" align="center">Contact Us</a> | <a href="https://mn.gov/admin" class="whiteLink" align="center">Admin Home</a></td>
            </tr>
        </table>
        <!-- top nav table -->
        <table width="100%" cellpadding="2" cellspacing="0" border="0" class="mmdheader">
            <tr>
                <td class="topNavBG">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <!-- theme navigation -->
                            <!-- topnav item with its borders -->
                            <td class="topNav" align="center">
                                <center>  					
                  &nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.mmd.admin.state.mn.us" CLASS="blackLink"><!--A-->Home</a>&nbsp;&nbsp;&nbsp;&nbsp;
               </center>
                            </td>
                            <td class="darkGray">
                                <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="1" height="25" hspace="0" vspace="0" border="0" /></td>
                            <td class="white">
                                <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="1" height="25" hspace="0" vspace="0" border="0" /></td>
                            <!-- topnav item with its borders -->
                            <td class="topNav" align="center">
                                <center>  					
                  &nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.mmd.admin.state.mn.us/mn06000.htm" CLASS="blackLink"><!--B-->Acquisitions</a>&nbsp;&nbsp;&nbsp;&nbsp;
               </center>
                            </td>
                            <td class="darkGray">
                                <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="1" height="25" hspace="0" vspace="0" border="0" /></td>
                            <td class="white">
                                <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="1" height="25" hspace="0" vspace="0" border="0" /></td>
                            <!-- topnav item with its borders -->
                            <td class="topNav" align="center">
                                <center>  					
                  &nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.mmd.admin.state.mn.us/mn07000.htm" CLASS="blackLink"><!--C-->Construction</a>&nbsp;&nbsp;&nbsp;&nbsp;
               </center>
                            </td>
                            <td class="darkGray">
                                <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="1" height="25" hspace="0" vspace="0" border="0" /></td>
                            <td class="white">
                                <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="1" height="25" hspace="0" vspace="0" border="0" /></td>
                            <!-- topnav item with its borders -->
                            <td class="topNav" align="center">
                                <center>  					
                  &nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.mmd.admin.state.mn.us/mn05000.htm" CLASS="blackLink"><!--D-->Professional/Technical Contracting</a>&nbsp;&nbsp;&nbsp;&nbsp;
               </center>
                            </td>
                            <td class="darkGray">
                                <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="1" height="25" hspace="0" vspace="0" border="0" /></td>
                            <td class="white">
                                <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="1" height="25" hspace="0" vspace="0" border="0" /></td>
                            <!-- topnav item with its borders -->
                            <td class="topNav" align="center">
                                <center>  					
                  &nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.mmd.admin.state.mn.us/mn02000.htm" CLASS="blackLink"><!--E-->Vendor Information</a>&nbsp;&nbsp;&nbsp;&nbsp;
               </center>
                            </td>
                            <td class="darkGray">
                                <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="1" height="25" hspace="0" vspace="0" border="0" /></td>
                            <td class="white">
                                <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="1" height="25" hspace="0" vspace="0" border="0" /></td>
                            <!-- topnav item with its borders -->
                            <td class="topNav" align="center" valign="center">
                                <center>  					
                  &nbsp;&nbsp;&nbsp;<A HREF="http://www.mmd.admin.state.mn.us/coop.htm" CLASS="blackLink"><!--G-->Cooperative Purchasing</A>&nbsp;&nbsp;&nbsp;
               </center>
                            </td>
                            <td class="darkGray">
                                <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="1" height="25" hspace="0" vspace="0" border="0" /></td>
                            <td class="white">
                                <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="1" height="25" hspace="0" vspace="0" border="0" /></td>
                            <!-- topnav item with its borders -->
                            <td class="topNav" align="center" valign="center">
                                <center>  					
                  &nbsp;&nbsp;&nbsp;<a href="http://www.mmcap.org" class="blackLink" target="_blank"><!--H-->MMCAP</a>&nbsp;&nbsp;&nbsp;
               </center>
                            </td>
                            <td class="darkGray">
                                <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="1" height="25" hspace="0" vspace="0" border="0" /></td>
                            <td class="white">
                                <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="1" height="25" hspace="0" vspace="0" border="0" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <!-- blank 1 px gray row -->
            <tr>
                <td class="darkGray">
                    <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="1" height="1" hspace="0" vspace="0" border="0"></td>
            </tr>
            <!-- blank 1 px white row -->
            <tr>
                <td class="white">
                    <img src="http://www.mmd.admin.state.mn.us/gifs/blank.gif" alt="" width="650" height="1" hspace="0" vspace="0" border="0"></td>
            </tr>
        </table>
        <!-- end top nav -->
    </div>
    <div>
        <div class="container">
            <div style="text-align: center">
                <h3 class="HeaderStyle">Road Salt Order Form</h3>
            </div>
            <hr />
        </div>
    </div>
    <div data-ng-controller="saltOrderController" style="display: block; overflow: auto">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <form id="form1" runat="server">
                    <div class="container" style="min-height: 375px;">
                        <div class="row" style="margin-top: 10%">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-4"></div>
                                    <div class="col-md-4" style="background-color: #EEEEEE">
                                        <br />
                                        <div class="row">
                                            <div class="col-md-1"></div>
                                            <div class="col-md-10">
                                                <div class="form-group">
                                                    <asp:Label ID="Label1" runat="server" Text="Enter Your Registered e-mail-ID:"></asp:Label>
                                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ValidationGroup="vd"></asp:TextBox>
                                                    <div class="help-block">
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid e-mail ID" ControlToValidate="txtEmail" Style="color: red;" ValidationGroup="vd" ValidationExpression="^[a-zA-Z0-9._+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$"></asp:RegularExpressionValidator>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="e-mail ID cannot be blank" ControlToValidate="txtEmail" Style="color: red; margin-left: -35%;" ValidationGroup="vd"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <asp:Button ID="btnValidate" runat="server" Text="Validate" CssClass="btn btn-primary" OnClick="btnValidate_Click" ValidationGroup="vd" Style="margin-left: 35%" />
                                            </div>
                                            <div class="col-md-1"></div>
                                        </div>
                                        <div class="row" id="divError" runat="server" style="display: none">
                                            <div class="col-md-1"></div>
                                            <div class="col-md-10">
                                                <asp:Label ID="lblError" runat="server" Style="color: red;"></asp:Label>
                                            </div>
                                            <div class="col-md-1"></div>

                                        </div>
                                        <br />
                                    </div>
                                    <div class="col-md-4"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

            </asp:View>
            <asp:View ID="View2" runat="server">
                <form id="form2" data-ng-submit="saveAll()">
                    <div class="container">
                        <div>
                            <div class="col-md-12">
                                <h4>Order Placement</h4>
                                <p style="color: orange">List the name and contact information of individual who is responsible for order placement</p>
                            </div>
                        </div>
                        <div>
                            <div class="col-md-12">
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Agency Point of Contact</th>
                                            <th>Email</th>
                                            <th>Direct Phone (Preferred)</th>
                                            <th>Alternate Phone (Other)</th>
                                            <th>Are you City / Country / Other ?</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <input type="text" class="form-control" data-ng-model="opagencypoc" required="required" /></td>
                                            <td>
                                                <input type="email" class="form-control" data-ng-model="opemail" required="required" /></td>
                                            <td>
                                                <input id="txtOpPhone" type="text" class="form-control bfh-phone" data-format=" (ddd) ddd-dddd" data-ng-model="opphone" required="required" /></td>
                                            <td>
                                                <input id="txtOpAltPhone" type="text" class="form-control bfh-phone" data-format=" (ddd) ddd-dddd" data-ng-model="opalternatephone" /></td>
                                            <td>
                                                <select id="ddlCityCounty" class="form-control" data-ng-model="oplocationtype">
                                                    <option value="-1">--Select--</option>
                                                    <option value="City">City</option>
                                                    <option value="County">County</option>
                                                    <option value="Other">Other</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <br />
                        <div>
                            <div class="col-md-12">
                                <h4>Contract Obligation</h4>
                                <p style="color: orange">List the name and contact information for the individual authorized to contractually obligate your organization</p>
                            </div>
                        </div>
                        <div>
                            <div class="col-md-12">
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Direct Phone (Preferred)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <input type="text" class="form-control" data-ng-model="coname" required="required" /></td>
                                            <td>
                                                <input type="email" class="form-control" data-ng-model="coemail" required="required" /></td>
                                            <td>
                                                <input id="txtCOPhone" type="text" class="form-control bfh-phone" data-format=" (ddd) ddd-dddd" data-ng-model="cophone" required="required" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="col-md-12">
                        <div>
                            <div class="col-md-10 col-md-offset-1">
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>
                                                <input type="checkbox" data-ng-model="selectedAll" data-ng-click="checkAll()" /></th>
                                            <th>Name of Municipal Agency
                                            <br />
                                                (You may list multiple)</th>
                                            <th>Salt Delivery Street Address</th>
                                            <th style="width: 180px;">City</th>
                                            <th style="width: 100px;">Zip</th>
                                            <th style="width: 165px;">Unloading Method</th>
                                            <th style="width: 215px">UNTREATED SALT<br />
                                                <small>Guarantee 80% min / 120% max</small><br />
                                                Estimated Annual Usage</th>
                                            <th style="width: 215px">TREATED SALT<br />
                                                <small>Guarantee 80% min / 120% max</small><br />
                                                Estimated Annual Usage</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr data-ng-repeat="orderDetail in orderDetails">
                                            <td>
                                                <input type="checkbox" data-ng-model="orderDetail.selected" /></td>
                                            <td>
                                                <input type="text" class="form-control" data-ng-model="orderDetail.name" required="required" /></td>
                                            <td>
                                                <input type="text" class="form-control" data-ng-model="orderDetail.address" required="required" /></td>
                                            <td>
                                                <input type="text" class="form-control" data-ng-model="orderDetail.city" required="required" /></td>
                                            <td>
                                                <input type="text" class="form-control" maxlength="5" data-ng-model="orderDetail.zip" required="required" onkeypress="return AllowNumbersOnly(event)" /></td>
                                            <td>
                                                <select class="form-control" data-ng-model="orderDetail.unloadmethod">
                                                    <option value="-1">--Select--</option>
                                                    <option value="End Dump">End Dump</option>
                                                    <option value="Belly Dump">Belly Dump</option>
                                                    <option value="Conveyor">Conveyor</option>
                                                    <option value="Agency Pick up">Agency Pick up</option>
                                                </select>
                                            </td>
                                            <td>
                                                <div class="form-inline">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" maxlength="8" style="width: 90px" data-ng-model="orderDetail.untreatedsaltqty" required="required" onkeypress="return AllowNumbersOnly(event)" />
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" style="width: 100px" data-ng-model="orderDetail.untreatedqtyType" disabled="disabled">
                                                            <option selected="selected" value="TONs">TONs</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-inline">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" maxlength="8" style="width: 90px" data-ng-model="orderDetail.treatedsaltqty" required="required" onkeypress="return AllowNumbersOnly(event)" />
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" style="width: 100px" data-ng-model="orderDetail.treatedqtyType" disabled="disabled">
                                                            <option selected="selected" value="TONs">TONs</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div>
                            <div class="col-md-10 col-md-offset-1" style="text-align: center;">
                                <div class="form-group">
                                    <input type="button" class="btn btn-primary addnew" value="Add New" data-ng-click="addNew()" style="margin-right: 10px;" />
                                    <input data-ng-hide="!orderDetails.length" type="button" class="btn btn-danger" data-ng-click="remove()" value="Remove" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="col-md-12" id="divFailure" style="display: none">
                        <div>
                            <div class="col-md-10 col-md-offset-1" style="text-align: center; margin-top: 50px;">
                                <div class="form-group">
                                    <h4 style="color: red">Failed to place order. Please try again.</h4>
                                    <h5 style="color:red">If you continue to have trouble, please contact LuAnn Olson <b>LuAnn.Olson@state.mn.us</b> or <b>651/201-2447</b></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="col-md-12">
                        <div>
                            <div class="col-md-10 col-md-offset-1" style="text-align: center; margin-top: 50px;">
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" value="Submit Order" style="width: 350px;" />
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div id="divSuccess" style="display: none; text-align: center;">
                    <h3 style="color: green">Order Placed Successfully</h3>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
    <footer>
        <hr />
        <table width="70%" align="center">
            <tr>
                <td class="FooterText" align="center">You will need <a href="http://www.adobe.com/products/acrobat/readstep2.html">Adobe Acrobat Reader</a> to print or view PDF files.<br />
                    Information found on this website can be made available in alternative formats, such as large print, Braille, or on tape, by calling 651.296.2600. Persons with a hearing or speech disability can contact us through the Minnesota Relay Service by dialing 711 or 1.800.627.3529.<br />
                    The State of Minnesota is an Equal Opportunity Employer.</P>
                </td>
            </tr>
            <tr>
                <td class="FooterText" align="center"><font color="#8000FF">&copy;2000-2017 State of Minnesota, Department of Administration</font></P>
                </td>
            </tr>
            <tr>
                <td align="CENTER"><a href="http://www.mmd.admin.state.mn.us/mn01005.htm">What's New</a> | <a href="http://www.mmd.admin.state.mn.us/contents.htm">Site Map</a> | <a href="http://www.mmd.admin.state.mn.us/mn09000.asp">Staff Directory</a> | <a href="mailto:luke.jannett@state.mn.us">Send Email</a>
                </td>
            </tr>
        </table>
    </footer>
</body>
<script>
    function AllowNumbersOnly(e) {
        var charCode = (e.which) ? e.which : e.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            e.preventDefault();
        }
    }
</script>
</html>
