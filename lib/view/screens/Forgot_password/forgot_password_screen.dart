import "package:flutter/material.dart";
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/provider/forgot_pass_provider.dart';
import 'package:rathna/theme/colors/color_palette.dart';
import 'package:rathna/theme/colors/textstyle.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  void initState() {
    super.initState();
    Provider.of<Forgotpassprovider>(context, listen: false);
  }

  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var forgotpassprovider = Provider.of<Forgotpassprovider>(context);
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: black,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spacedh40,
            Text(
              "Forgot Password?",
              style: primaryTextStyle(weight: FontWeight.w600, size: 22),
            ),
            spacedh10,
            Text(
              "Enter the email address to get otp your email address",
              style: secondaryTextStyle(
                  weight: FontWeight.w600, size: 16, color: lightGrey),
            ),
            spacedh40,
            spacedh10,
            TextFormField(
              validator: MultiValidator([
                RequiredValidator(
                  errorText: "user@gmail.com",
                ),
              ]),
              keyboardType: TextInputType.emailAddress,
              // maxLines: 5,

              controller: emailcontroller,
              style: primaryTextStyle(),
              // focusNode: emailFocus,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.mail, color: Color(0xFFA8ABAD)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // borderSide: BorderSide(color: appPrimaryColor)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(width: 1, color: Color(0xFFA8ABAD))),
                labelText: 'Email',
                hintText: "user@gmail.com",
                labelStyle: primaryTextStyle(),
              ),
              //isDarkModeOn ? white : blackColor,
              // keyboardType: TextInputType.emailAddress,
              // validator: (s) {
              //   if (s.trim().isEmpty) return 'Password is required';
              //   return null;
              // },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: SizedBox(
                height: 50,
                child: Material(
                  borderRadius: BorderRadius.circular(12.0),
                  color: purple,
                  elevation: 7.0,
                  child: TextButton(
                    onPressed: () {
                      // Forgotpassrepo().forgotpassword(emailcontroller.text, context);
                      forgotpassprovider.forgotpassword(
                          emailcontroller.text, context);
                    },
                    child: const Center(
                        child: Text('Submit',
                            style: TextStyle(color: white, fontSize: 20))),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
