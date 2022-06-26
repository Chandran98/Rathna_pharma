import 'package:rathna/services/auth_services.dart';

class AppURl {

  // final Prefservice prefservice = Prefservice();

  //  var id= prefservice.getcredits("customerId");

  static var baseurl = "https://libsitservices.com/";
  static var loginurl = baseurl + "core/api/customer/login";
  static var userprofileurl = baseurl +"core/api/customer/getById?customer_id=RE1234";
  static var lrupdateurl = baseurl +"core/api/lrupdation/getById?customer_id=RE1234";
  static var coverurl = baseurl +"core/api/cover/getById?customer_id=RE1234";
  static var returnsurl = baseurl +"core/api/return/getById?customer_id=RE1234";
  static var queryurl = baseurl +"core/api/query/querry";
}
