class AppURl {
  static var baseurl = "https://libsitservices.com/";
  static var loginurl = baseurl + "core/api/customer/login";
  static var userprofileurl = baseurl + "core/api/customer/getById?customer_id=";
  static var lrupdateurl = baseurl + "core/api/lrupdation/getById?customer_id=";
  static var coverurl = baseurl + "core/api/cover/getById?customer_id=";
  static var returnsurl = baseurl + "core/api/return/getById?customer_id=";
  static var queryurl = baseurl + "core/api/query/querry";
  static var forgotpass = baseurl + "core/api/customer/forgotpassword";
  static var newpassword = baseurl + "core/api/customer/newPassword";
}
