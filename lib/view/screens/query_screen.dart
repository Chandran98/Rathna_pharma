import 'package:flutter/material.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/provider/query_provider.dart';
import 'package:rathna/services/query_services.dart';
import 'package:rathna/theme/colors/color_palette.dart';
import 'package:rathna/theme/colors/textstyle.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Queryscreen extends StatefulWidget {
  const Queryscreen({Key key}) : super(key: key);

  @override
  State<Queryscreen> createState() => _QueryscreenState();
}

class _QueryscreenState extends State<Queryscreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    Queryrepo();
    super.initState();
  }

  var gendertry;
  List genderlist = ["LR-Update", "Covers", "Returns"];
  TextEditingController querycontroller = TextEditingController();
  TextEditingController datacontroller = TextEditingController();
  final bool _isLoading = false;
  final Queryprovider _queryprovider = Queryprovider();

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
              child: Form(
                child: Column(
                  children: [
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
                          "Services",
                        ),
                        items: genderlist.map((valueitem) {
                          return DropdownMenuItem(
                            value: valueitem,
                            child: Text(valueitem),
                          );
                        }).toList(),
                        onChanged: (selected) {
                          setState(() {
                            gendertry = selected;
                          });
                        },
                        value: gendertry,
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
                      style: primaryTextStyle(),
                      // focusNode: emailFocus,
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.email, color: Color(0xFFA8ABAD)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // borderSide: BorderSide(color: appPrimaryColor)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFFA8ABAD))),
                        labelText: 'Tell your Queries here',
                        labelStyle: primaryTextStyle(),
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
                    TextFormField(
                      validator: MultiValidator([
                        RequiredValidator(errorText: "usernamenull"),
                      ]),
                      // maxLines: 5,
                      controller: datacontroller,
                      style: primaryTextStyle(),
                      // focusNode: emailFocus,
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.person, color: Color(0xFFA8ABAD)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // borderSide: BorderSide(color: appPrimaryColor)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFFA8ABAD))),
                        labelText: 'Customer ID',
                        labelStyle: primaryTextStyle(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.green,
                            elevation: 7.0,
                            child: TextButton(
                              onPressed: () {
                                // if (_formkey.currentState.validate()) {
                                _queryprovider.queryupload(
                                    gendertry.toString(),
                                    querycontroller.text,
                                   
                                    context);
                                //   querycontroller.clear();
                                //   datacontroller.clear();
                                // }
                                // Queryrepo().queryupload(
                                //     gendertry.toString(),
                                //     querycontroller.text,
                                //     datacontroller.text,context,
                                //     );
                                // print(querycontroller.toString());
                                // print(gendertry.toString());
                                // if (_formkey.currentState!.validate()) {
                                //   servicesform();

                                // _emailcontroller.clear();
                                // _namecontroller.clear();
                                // _mobilecontroller.clear();
                                // _addresscontroller.clear();

                                //   Navigator.of(context).pop();
                                //   ScaffoldMessenger.of(context)
                                //       .showSnackBar(SnackBar(
                                //     content: Text("Submitted"),
                                //   ));
                                // }
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
                            color: Colors.red,
                            elevation: 7.0,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                  child: _isLoading
                                      ? const CircularProgressIndicator()
                                      : const Text('Back',
                                          style: TextStyle(
                                              color: white, fontSize: 20))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ));
  }
}
