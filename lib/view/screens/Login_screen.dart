import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/provider/auth_provider.dart';
import 'package:rathna/services/auth_services.dart';
import 'package:rathna/theme/colors/textstyle.dart';
import 'package:rathna/view/screens/Forgot_password/forgot_password_screen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
//   final bool _isLoading = false;
// Authprovider _authprovider= Authprovider();
  @override
  void initState() {
    super.initState();
    Provider.of<Authprovider>(context, listen: false);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var emailFocus = FocusNode();
  var passwordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    var aupro = Provider.of<Authprovider>(context);
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 80),
              child: const Text(
                "Welcome\nBack",
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    right: 35,
                    left: 35,
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(children: [
                  TextFormField(
                    controller: emailController,
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
                      labelText: 'Email',
                      labelStyle: primaryTextStyle(),
                    ),
                    //isDarkModeOn ? white : blackColor,
                    keyboardType: TextInputType.emailAddress,
                    validator: (s) {
                      if (s.trim().isEmpty) return 'Email is required';
                      // if (!s.trim().validateEmail()) return 'Email is not valid';
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
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
                      labelText: 'Password',
                      labelStyle: primaryTextStyle(),
                    ),
                    //isDarkModeOn ? white : blackColor,
                    // keyboardType: TextInputType.emailAddress,
                    validator: (s) {
                      if (s.trim().isEmpty) return 'Password is required';
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xff4c505b),
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            // Authrepo().login(emailController.text,
                            //     passwordController.text, context);
                            aupro.login(emailController.text,
                                passwordController.text, context);
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Navigator.pushNamed(context, 'register');
                          },
                          child: const Text(
                            '',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color(0xff4c505b),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()));
                          },
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color(0xff4c505b),
                            ),
                          ),
                        ),
                      ]),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
