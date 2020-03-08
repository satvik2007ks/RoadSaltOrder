/// <reference path="jquery-1.10.2.min.js" />
/// <reference path="angular.min.js" />

var myApp = angular
            .module("saltOrderApp", [])
            .controller("saltOrderController", function ($scope) {

                //Order Placement
                $scope.opagencypoc = "";
                $scope.opemail = "";
                $scope.opphone = "";
                $scope.opalternatephone = "";
                $scope.oplocationtype = "-1";
                $scope.opmndotdistrict = "-1";

                //Contract Obligation
                $scope.coname = "";
                $scope.coemail = "";
                $scope.cophone = "";

                //Order Details
                $scope.orderDetails = [
                    { name: "", address: "", city: "", zip: "", unloadmethod: "-1", untreatedsaltqty: "", untreatedqtyType: "TONs", treatedsaltqty: "", treatedqtyType: "TONs", earlyfilluntreatedsaltdisabled: true, earlyFilluntreatedsaltqtyType: "TONs", earlyfilltreatedsaltdisabled: true, earlyFilltreatedsaltqtyType: "TONs" }
                ];
                // console.log($scope.orderDetails);

                $scope.earlyFillCheck = function (orderDetail) {
                    if (orderDetail.earlyFill == true) {
                        orderDetail.earlyfilluntreatedsaltdisabled = false;
                        orderDetail.earlyfilltreatedsaltdisabled = false;
                    } else {
                        orderDetail.earlyFilluntreatedsaltqty = "";
                        orderDetail.earlyFilltreatedsaltqty = "";
                        orderDetail.earlyfilluntreatedsaltdisabled = true;
                        orderDetail.earlyfilltreatedsaltdisabled = true;
                    }
                };

                $scope.addNew = function () {
                    var empty = false;
                    angular.forEach($scope.orderDetails, function (value, key) {
                        if (value.name == '' || value.address == '' || value.city == '' || value.zip == '' || value.unloadmethod == '-1' || value.untreatedsaltqty == '' || value.treatedsaltqty == '' || value.name == undefined || value.address == undefined || value.city == undefined || value.zip == undefined || value.untreatedsaltqty == undefined || value.treatedsaltqty == undefined) {
                            empty = true;
                            alert("Fields cannot be empty or dropdown cannot be unselected");
                            return false;
                        }
                    });
                    if (!empty) {
                        $scope.orderDetails.push(
                            { name: "", address: "", city: "", zip: "", unloadmethod: "-1", untreatedsaltqty: "", untreatedqtyType: "TONs", treatedsaltqty: "", treatedqtyType: "TONs", earlyfilluntreatedsaltdisabled: true, earlyFilluntreatedsaltqtyType: "TONs", earlyfilltreatedsaltdisabled: true, earlyFilltreatedsaltqtyType: "TONs" }
                            );
                    }
                };

                $scope.remove = function () {
                    var newDataList = [];
                    $scope.selectedAll = false;
                    angular.forEach($scope.orderDetails, function (selected) {
                        if (!selected.selected) {
                            newDataList.push(selected);
                        }
                    });
                    $scope.orderDetails = newDataList;
                };

                $scope.checkAll = function () {
                    if (!$scope.selectedAll) {
                        $scope.selectedAll = true;
                    } else {
                        $scope.selectedAll = false;
                    }
                    angular.forEach($scope.orderDetails, function (orderDetail) {
                        orderDetail.selected = $scope.selectedAll;
                    });
                };

                $scope.saveAll = function () {
                    if ($.trim($scope.opphone) == '') {
                        //alert($scope.opphone);
                        alert("Please enter direct phone for order placement");
                        return false;
                    }
                    if ($.trim($scope.cophone) == '') {
                        alert("Please enter direct phone for Contract Obligation");
                        return false;
                    }
                    if ($('#ddlCityCounty').val() == '-1') {
                        alert("Please select City / County / Other for order placement");
                        return false;
                    }
                    var obj = {};
                    obj.opagencypoc = $scope.opagencypoc;
                    obj.opemail = $scope.opemail;
                    obj.opphone = $.trim($('#txtOpPhone').val());
                    obj.opalternatephone = $.trim($('#txtOpAltPhone').val());
                    obj.oplocationtype = $scope.oplocationtype;
                    obj.opmndotdistrict = $scope.opmndotdistrict;
                    obj.districtname = $("#ddlMnDotDistrict option:selected").text();
                    obj.opaltagencypoc = $scope.opaltagencypoc;
                    obj.opaltphone = $.trim($('#txtAltOpPhone').val());
                    obj.opaltalternatephone = $.trim($('#txtAltOpAltPhone').val());
                    obj.opaltemail=$scope.opaltemail;
                    obj.coname = $scope.coname;
                    obj.coemail = $scope.coemail;
                    obj.cophone = $.trim($('#txtCOPhone').val());
                    obj.orderdetails = $scope.orderDetails;
                 //   console.log = obj.orderdetails;
                    $.ajax({
                        type: "POST",
                        url: "SaltOrder.aspx/SendParameters",
                        data: JSON.stringify(obj),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            if (r.d == "success") {
                                $("#myModal").modal("hide");
                                $('#form2').css("display", "none");
                                $('#form2').remove();
                                $('#divSuccess').css("display", "block");
                                $('#divFailure').css("display", "none");
                                window.location.href = 'Success.html';
                            }
                            else if (r.d == "failed") {
                                $('#divFailure').css("display", "block");
                            }
                        }
                    });
                    return false;
                };
            });

