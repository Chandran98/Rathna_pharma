import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/utils/button&cont.dart';
import 'package:rathna/helper/Internet%20connectivity/Network_status.dart';
import 'package:rathna/provider/User_provider.dart';
import 'package:rathna/provider/auth_provider.dart';
import 'package:rathna/theme/colors/color_palette.dart';
import 'package:rathna/view/screens/Lr_update_details_page.dart';
import 'package:rathna/view/screens/Main_home_screen.dart';
import 'package:rathna/view/screens/Returns_page.dart';
import 'package:rathna/view/screens/covers_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../provider/theme_provider.dart';
import 'query_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key key}) : super(key: key);

  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  void onback() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      borderSide: BorderSide(color: white, width: 2),
      width: 350,
      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.LEFTSLIDE,
      title: 'Exit',
      desc: 'Are sure you want to exit...',
      // buttonsTextStyle: dfont,
      showCloseIcon: true,
      btnCancelOnPress: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => BaseScreen()));
      },
      btnOkOnPress: () {
        SystemNavigator.pop();
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: NetworkSensitive(
        child: SafeArea(
          child: WillPopScope(
            onWillPop: () {
              onback();
              return Future.value(false);
            },
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: const [
                    AppBar(),
                    Body(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<Themeprovider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore Service",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: kPrimaryColor),
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            Card23(
              theme: theme,
              titlecard: "Covers",
              thumbnail: "assets/icons/laptop.png",
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Coverpage()));
              },
            ),
            Card23(
              theme: theme,
              titlecard: "Returns",
              thumbnail: 'assets/icons/return.png',
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Returnspage()));
              },
            ),
          ],
        ),
        Row(
          children: [
            Card23(
              theme: theme,
              titlecard: "Lr-Update",
              thumbnail: 'assets/icons/lr_update.png',
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Lrupdatepage()));
              },
            ),
            Card23(
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Queryscreen()));
                },
                theme: theme,
                titlecard: "Query",
                thumbnail: 'assets/icons/design.png'),
          ],
        ),
        // GridView.builder(
        //   physics: const BouncingScrollPhysics(),
        //   shrinkWrap: true,
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 20,
        //     vertical: 8,
        //   ),
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     childAspectRatio: 0.8,
        //     crossAxisSpacing: 20,
        //     mainAxisSpacing: 24,
        //   ),
        //   itemBuilder: (context, index) {
        //     return CategoryCard(
        //       category: categoryList[index],
        //     );
        //   },
        //   itemCount: categoryList.length,
        // ),
      ],
    );
  }
}

class Card23 extends StatelessWidget {
  const Card23(
      {Key key,
      @required this.theme,
      this.thumbnail,
      this.titlecard,
      this.ontap})
      : super(key: key);

  final Themeprovider theme;
  final String titlecard, thumbnail;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 20),
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: 210,
          width: 165,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: theme.darktheme ? Colors.black45 : white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 4.0,
                spreadRadius: .05,
              ), //BoxShadow
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  thumbnail,
                  height: kCategoryCardImageSize,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(titlecard),
              Text(
                "Services",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CategoryCard extends StatelessWidget {
//   final Category category;
//   const CategoryCard({
//     Key key,
//     this.category,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var theme = Provider.of<Themeprovider>(context);
//     return GestureDetector(
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => CourseScreen(),
//         ),
//       ),
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: theme.darktheme ? Colors.black45 : white,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(.1),
//               blurRadius: 4.0,
//               spreadRadius: .05,
//             ), //BoxShadow
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Align(
//               alignment: Alignment.topRight,
//               child: Image.asset(
//                 category.thumbnail,
//                 height: kCategoryCardImageSize,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(category.name),
//             Text(
//               "Services",
//               style: Theme.of(context).textTheme.bodySmall,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class AppBar extends StatefulWidget {
  const AppBar({
    Key key,
  }) : super(key: key);

  @override
  State<AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  final Userprefservice userprefservice = Userprefservice();
  // ignore: prefer_typing_uninitialized_variables

  @override
  void initState() {
    super.initState();
    setState(() {
      Provider.of<UserProvider>(context, listen: false).getApiCall(context);
      Provider.of<Authprovider>(context, listen: false);
      getuserid();
    });
  }

  var userid = "";
  var useremail = "";
  var usercity = "";
  var username = "";

  getuserid() async {
    var prefservice = await SharedPreferences.getInstance();
    var userprefservice = await SharedPreferences.getInstance();
    setState(() {
      userid = prefservice.getString("userid");
      useremail = userprefservice.getString("useremail");
      username = userprefservice.getString("username");
      usercity = userprefservice.getString("usercity");
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<Themeprovider>(context);
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            Color(0xff886ff2),
            Color(0xff6849ef),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello  $username",
                      style: Theme.of(context).textTheme.titleLarge),
                  spacedh5,
                  Text("$userid", style: TextStyle(color: white, fontSize: 18)),
                ],
              ),
              CircleButton(
                color: white,
                icon: theme.darktheme
                    ? (Icons.nightlight_outlined)
                    : (Icons.sunny),
                onPressed: () {
                  Provider.of<Themeprovider>(context, listen: false)
                      .toggletheme();
                },
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const SearchTextField()
        ],
      ),
    );
  }
}
