// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/provider/company_list_provider.dart';
import 'package:rathna/provider/query_provider.dart';
import 'package:rathna/services/query_services.dart';
import 'package:rathna/theme/colors/color_palette.dart';
import 'package:rathna/theme/colors/textstyle.dart';
import 'package:rathna/utils/app_services.dart';
import 'package:rathna/utils/hover_message.dart';
import '../../provider/theme_provider.dart';

class Queryscreen extends StatefulWidget {
  const Queryscreen({Key key}) : super(key: key);
  @override
  State<Queryscreen> createState() => _QueryscreenState();
}

class _QueryscreenState extends State<Queryscreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    Queryrepo();
    Provider.of<CompanylistProvider>(context, listen: false)
        .getApiCall(context);

    super.initState();
  }

  var servicename;
  var companyname;
  List servicelist = ["LR-Update", "Covers", "Returns"];
  List companylist = [
    "Alembic",
    "Wockhardt Ltd",
    "Oaknet Healthcare (P) Ltd",
    "Charak Pharma Pvt Ltd",
    "MSN Labs Pvt. Ltd",
    "Koye Pharma",
    "Rathna Specialities",
    "Apex Labs Pvt. Ltd",
    "Comed Chemicals",
    "Sun Dayota Numantis",
    "Q Check Pharma",
    "By By Pharma",
    "Lupin Ltd",
    "Alembic Stock Transfer Only",
    "Oaknet Healthcare Sample Details",
    "Personal Covers",
    "Sri Rathna Specialities",
    "Sri Rathna Specialities - MI Lab",
    "Sri Rathna Specialities - Q-Check",
    "Rathna Enterprises",
    "Neoveda Pvt Ltd",
    "STCS logistics pvt .ltd",
    "PARVATHY AGENCIES",
    "Vedistry Pvt Ltd ",
    "AXOLE PHARMA",
    "YOURS VACCINE",
    "THRIVID CONSULTING",
    "PULSE PHARMACEUTICALS PVT LTD",
    "Elbrit life sciences pvt ltd",
    "GRIN O LIFE CARE PVT LTD",
    "SAYEE PHARMACY",
    "MEDMANOR ORGANIC",
    "ELBRIT LIFE SCIENCE PVT LTD SAMPLES"
  ];

  TextEditingController querycontroller = TextEditingController();
  TextEditingController datacontroller = TextEditingController();
  final bool _isLoading = false;
  final Queryprovider _queryprovider = Queryprovider();

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<Themeprovider>(context);
    final data = Provider.of<CompanylistProvider>(context);
    // ignore: prefer_typing_uninitialized_variables
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Queries"),
            centerTitle: true,
            backgroundColor: kPrimaryColor,
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SizedBox(
                          child: Image.asset(
                        "assets/images/q2.png",
                        scale: 2.5,
                      )),
                      spacedh30,
                      const Text(
                        "Please submit your queries below. Our supporting staff will reply you as soon as possible",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: grey),
                      ),
                      spacedh30,
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(5),
                        child: DropdownButton(
                          underline: const SizedBox(),
                          iconSize: 35,
                          isExpanded: true,
                          hint: const Text(
                            "Select Services",
                          ),
                          items: servicelist.map((valueitem) {
                            return DropdownMenuItem(
                              value: valueitem,
                              child: Text(valueitem),
                            );
                          }).toList(),
                          onChanged: (selected) {
                            setState(() {
                              servicename = selected;
                            });
                          },
                          value: servicename,
                        ),
                      ),
                      spacedh30,
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(5),
                        child: DropdownButton(
                          underline: const SizedBox(),
                          iconSize: 35,
                          isExpanded: true,
                          hint: const Text(
                            "Select Company",
                          ),
                          items: companylist.map((valueitem) {
                            return DropdownMenuItem(
                              value: valueitem,
                              child: Text(valueitem.toString()),
                            );
                          }).toList(),
                          onChanged: (selected) {
                            setState(() {
                              companyname = selected;
                            });
                          },
                          value: companyname,
                        ),
                      ),
                      spacedh20,
                      spacedh20,
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Please type something';
                          }
                          return null;
                        },
                        maxLines: 5,
                        controller: querycontroller,
                        style: primaryTextStyle(
                          color: theme.darktheme ? white : black,
                        ),
                        // focusNode: emailFocus,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email,
                              color: kPrimaryColor,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              // borderSide: BorderSide(color: appPrimaryColor)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    width: 1, color: Color(0xFFA8ABAD))),
                            labelText: 'Tell your Queries here',
                            prefixIconColor: kPrimaryColor
                            // labelStyle: primaryTextStyle(),
                            ),
                        //isDarkModeOn ? white : blackColor,
                        // keyboardType: TextInputType.emailAddress,
                        // validator: (s) {
                        //   if (s.trim().isEmpty) return 'Password is required';
                        //   return null;
                        // },
                      ),
                      spacedh20,
                      spacedh20,
                      spacedh20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: kPrimaryColor,
                              elevation: 7.0,
                              child: TextButton(
                                onPressed: () {
                                  if (servicename == null) {
                                    Utils.toastmessage(
                                        "Select service in dropdown");
                                  } else {
                                    if (_formkey.currentState.validate()) {
                                      Appservies()
                                          .checkInternet()
                                          .then((connection) async {
                                        if (connection == false) {
                                          Utils.toastmessage(
                                              "No internet connection");
                                        } else {
                                          _queryprovider.queryupload(
                                              servicename.toString(),
                                              querycontroller.text,
                                              context);
                                        }
                                      });
                                    }
                                  }
                                },
                                child: const Center(
                                    child: Text('Submit',
                                        style: TextStyle(
                                            color: white, fontSize: 20))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: theme.darktheme
                                  ? Colors.black45
                                  : Colors.grey.shade300,
                              elevation: 7.0,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Center(
                                    child: _isLoading
                                        ? const CircularProgressIndicator()
                                        : Text('Back',
                                            style: TextStyle(
                                                color: theme.darktheme
                                                    ? white
                                                    : kPrimaryColor,
                                                fontSize: 20))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          )),
    );
  }
}


// "Q Check Pharma"    ,
// "By By Pharma"    ,
//  "Lupin Ltd"    ,
//  "Alembic Stock Transfer Only"    ,
//  "Oaknet Healthcare Sample Details"    ,
//   "Personal Covers"    ,
//  "Sri Rathna Specialities"    ,
// "Sri Rathna Specialities - MI Lab"    ,
// "Sri Rathna Specialities - Q-Check"    ,
//  "Rathna Enterprises"    ,
// "Neoveda Pvt Ltd"    ,
// "STCS logistics pvt .ltd"    ,
// "PARVATHY AGENCIES"    ,
// "Vedistry Pvt Ltd "    ,
//  "AXOLE PHARMA"    ,
//  "YOURS VACCINE"    ,
//  "THRIVID CONSULTING"    ,
// "PULSE PHARMACEUTICALS PVT LTD"    ,
// "Elbrit life sciences pvt ltd"    ,
// "GRIN O LIFE CARE PVT LTD"    ,
// "SAYEE PHARMACY"    ,
// "MEDMANOR ORGANIC"    ,
// "ELBRIT LIFE SCIENCE PVT LTD SAMPLES"  