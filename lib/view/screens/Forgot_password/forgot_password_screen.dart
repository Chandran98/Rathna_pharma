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
    Provider.of<Forgotpassprovider>(context,listen: false);
  }

  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var forgotpassprovider = Provider.of<Forgotpassprovider>(context);
    return Scaffold(
      body: Column(
        children: [
          spacedh20,
          spacedh20,
          TextFormField(
            validator: MultiValidator([
              RequiredValidator(errorText: "user@gmail.com"),
            ]),keyboardType: TextInputType.emailAddress,
            // maxLines: 5,
            controller: emailcontroller,
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
              labelText: 'Email',
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
        ],
      ),
    );
  }
}
