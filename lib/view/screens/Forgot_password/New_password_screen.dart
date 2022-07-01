import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/provider/forgot_pass_provider.dart';
import 'package:rathna/services/New_password_services.dart';
import 'package:rathna/theme/colors/color_palette.dart';

import '../../../theme/colors/textstyle.dart';

class NewPasswordscreen extends StatelessWidget {
  const NewPasswordscreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController newpasswordcontroller = TextEditingController();
    var forgotpassprovider = Provider.of<Forgotpassprovider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                  height: 60,
                  width: double.maxFinite,
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black38)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.mail,
                        color: Colors.black38,
                      ),
                      spacedw20,
                      Text(
                        forgotpassprovider.email,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: grey),
                      )
                    ],
                  )),
              spacedh40,
              TextField(
                // maxLines: 5,
                controller: newpasswordcontroller,
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
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFFA8ABAD))),
                  labelText: 'New password',
                  labelStyle: primaryTextStyle(),
                ),
              ),
              spacedh40,
              Container(
                height: 50,
                width: 150,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.green,
                  elevation: 7.0,
                  child: TextButton(
                    onPressed: () {
                      Newpasswordrepo().updatepassword(
                          forgotpassprovider.email.toString(),
                          newpasswordcontroller.text,
                          context);
                      // forgotpassprovider.forgotpassword(
                      //     emailcontroller.text, context);
                    },
                    child: const Center(
                        child: Text('Submit',
                            style: TextStyle(color: white, fontSize: 20))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
