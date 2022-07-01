import 'dart:async';

import "package:flutter/material.dart";
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/provider/forgot_pass_provider.dart';
import 'package:rathna/services/forgot_password_services.dart';
import 'package:rathna/theme/colors/color_palette.dart';
import 'package:rathna/theme/colors/textstyle.dart';
import 'package:rathna/utils/hover_message.dart';
import 'package:rathna/view/screens/Forgot_password/New_password_screen.dart';

class OTPscreen extends StatefulWidget {
  const OTPscreen({Key key}) : super(key: key);

  @override
  State<OTPscreen> createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  TextEditingController otpcontroller = TextEditingController();
  final OTPPrefservice prefservice = OTPPrefservice();

  @override
  Widget build(BuildContext context) {
    var forgotpassprovider = Provider.of<Forgotpassprovider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            spacedh20,
            Text(forgotpassprovider.otp.toString()),
            spacedh20,
            TextFormField(keyboardType: TextInputType.number,
              validator: MultiValidator([
                RequiredValidator(errorText: "OTP"),
              ]),
              // maxLines: 5,
              controller: otpcontroller,
              style: primaryTextStyle(),
              // focusNode: emailFocus,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person, color: Color(0xFFA8ABAD)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // borderSide: BorderSide(color: appPrimaryColor)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(width: 1, color: Color(0xFFA8ABAD))),
                labelText: 'OTP',
                labelStyle: primaryTextStyle(),
              ),
              //isDarkModeOn ? white : blackColor,
              // keyboardType: TextInputType.emailAddress,
              // validator: (s) {
              //   if (s.trim().isEmpty) return 'Password is required';
              //   return null;
              // },
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
                  // ignore: void_checks
                  onPressed: () {
                    print(otpcontroller.text.toString());
                    if (otpcontroller.text
                            .compareTo(forgotpassprovider.otp.toString()) ==
                        0) {
                      return Timer(const Duration(seconds: 2), (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => NewPasswordscreen()));
                        Utils.toastmessage("valid credentials");
                      }));
                    } else {
                      return Timer(const Duration(seconds: 2),
                          (() => Utils.toastmessage("Invalid credentials")));
                    }
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
    );
  }
}
