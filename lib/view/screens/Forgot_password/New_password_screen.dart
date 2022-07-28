import 'package:flutter/material.dart';
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
                "New Password",
                style: primaryTextStyle(weight: FontWeight.w600, size: 22),
              ),
              spacedh10,
              Text(
                "Please enter your newpassword ",
                style: secondaryTextStyle(
                    weight: FontWeight.w600, size: 16, color: lightGrey),
              ),
              spacedh40,
              TextField(
                // maxLines: 5,
                controller: newpasswordcontroller,
                style: primaryTextStyle(),
                // focusNode: emailFocus,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Color(0xFFA8ABAD)),
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
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: SizedBox(
                  height: 50,
                  child: Material(
                    borderRadius: BorderRadius.circular(12.0),
                    color: kPrimaryColor,
                    elevation: 7.0,
                    child: TextButton(
                      // ignore: void_checks
                      onPressed: () {
                        Newpasswordrepo().updatepassword(
                            forgotpassprovider.email.toString(),
                            newpasswordcontroller.text,
                            context);
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
      ),
    );
  }
}
