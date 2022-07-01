import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/provider/User_provider.dart';
import 'package:rathna/provider/auth_provider.dart';
import 'package:rathna/theme/colors/color_palette.dart';
import 'package:rathna/view/screens/Lr_update_details_page.dart';
import 'package:rathna/view/screens/Returns_page.dart';
import 'package:rathna/view/screens/covers_page.dart';
import 'package:rathna/view/screens/query_screen.dart';
import '../../provider/theme_provider.dart';
import '../../services/auth_services.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  
    @override
    void initState() {
      super.initState();
      setState(() {
        
      });
      Provider.of<UserProvider>(context,listen: false).getApiCall(context);
    }
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<Themeprovider>(context);
    var userprovider = Provider.of<UserProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 80,
                      child: Image.asset(
                        "assets/images/rathna.jpg",
                      ),
                    ),
                     Text(
                      "User no. : ${ userprovider.customerid}",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
        
              // InkWell(
              //     onTap: () {
              //       Navigator.pushReplacement(
              //           context, MaterialPageRoute(builder: (_) => Testingno()));
              //     },
              //     child: Text("data"))
              // Huik(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [const Text(
                            "Profile",
                            style:
                                 TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                          ),spacedh10,
                           Text(
                            "User name. : ${ userprovider.name}",
                            style:
                                 TextStyle(fontSize: 16,color: grey),
                          ),  Text(
                        "Customer ID : ${ userprovider.customerid}",
                        style:
                            TextStyle(fontSize: 16,color: grey),
                      ),  Text(
                        "Cusotmer email:${ userprovider.email}",
                        style:
                             TextStyle(fontSize: 16,color: grey),
                      ),
                        ],
                      ),
                    ),spacedh20,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Reports :',
                        style: TextStyle(
                          fontSize: 22,
                          color: black,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    spacedh30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card1(
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Coverpage()));
                          },
                          title: "Covers",
                          subtitle: "services",
                          image: 'assets/images/Covers.jpg',
                        ),
                        Card1(
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Returnspage()));
                          },
                          title: "Returns",
                          subtitle: "services",
                          image: 'assets/images/Returns.jpg',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Card1(
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Lrupdatepage()));
                          },
                          title: "Lr-Update",
                          subtitle: "services",
                          image: 'assets/images/Lr_updated.jpg',
                        ),
                        Card1(
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Queryscreen()));
                          },
                          title: "Query",
                          subtitle: "services",
                          image: 'assets/images/query.jpg',
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    )
                  ],
                ),
              )
              //  ,Card1(title: "Covers",subtitle: "services",image:  'assets/images/Covers.jpg',),
            ],
          ),
        ),
      ),
    );
  }
}

//  Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             height: 30,
//             width: 30,
//             decoration: BoxDecoration(
//                 color: Colors.grey.shade600,
//                 borderRadius: BorderRadius.circular(5)),
//             child: const Icon(CupertinoIcons.moon_stars,
//                 size: 20, color: Colors.white),
//           ),
//           Switch(
//               activeColor: Theme.of(context).primaryColor,
//               value: Provider.of<Themeprovider>(context).darktheme,
//               onChanged: (active) {
//                 Provider.of<Themeprovider>(context, listen: false)
//                     .toggletheme();
//               })
//         ],
//       ),

//       InkWell(
//           onTap: () {
//             prefservice.removestatus("status").then((value) {
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (_) => Loginscreen()));
//             });
//           },
//           child: Text("Log-out")),

class Card1 extends StatelessWidget {
  String title, image, subtitle;
  VoidCallback ontap;

  Card1({this.image, this.subtitle, this.title, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Container(
              margin: const EdgeInsets.all(16),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0.8,
                        blurRadius: 0.7,
                        color: grey.withOpacity(0.3))
                  ]),
              // decoration: boxDecorationWithRoundedCorners(
              //   boxShadow: [BoxShadow(spreadRadius: 0.8, blurRadius: 0.7, color: grey.withOpacity(0.3))],
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  spacedh20,
                  Text(title, style: const TextStyle(color: black, fontSize: 20)),
                  spacedh10,
                  Text(subtitle, style: const TextStyle(color: grey, fontSize: 16)),
                ],
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
          ),
          Positioned(
            top: 0,
            left: 32,
            child: Image.asset(
              image,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
