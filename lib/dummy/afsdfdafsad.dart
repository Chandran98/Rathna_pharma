import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rathna/dummy/home_screen_widget.dart';
import 'package:rathna/theme/colors/color_palette.dart';

class Huik extends StatelessWidget {
  const Huik({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                const Text(
                  'Reports :',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 22,
                    color: black,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
                // DropdownButton(
                //   items: [
                //     DropdownMenuItem(
                //       child: const Text(
                //         'Services',
                //         style: TextStyle(
                //           fontFamily: 'Avenir',
                //           fontSize: 18,
                //           color: Color(0x7cdbf1ff),
                //           fontWeight: FontWeight.w500,
                //         ),
                //         textAlign: TextAlign.left,
                //       ),
                //     ),
                //   ],
                //   onChanged: (value) {},
                //   icon: const Padding(
                //     padding: EdgeInsets.only(left: 16.0),
                //     child: Icon(Icons.ac_unit),
                //     // child: Image.asset('assets/drop_down_icon.png'),
                //   ),
                //   underline: const SizedBox(),
                // ),
              ],
            ),
          ),
          Container(
            height: 400,
            padding: const EdgeInsets.only(left: 32),
            child: Swiper(
              itemCount: categorylist.length,
              itemWidth: MediaQuery.of(context).size.width - 2 * 64,
              layout: SwiperLayout.STACK,
              pagination: const SwiperPagination(
                builder: DotSwiperPaginationBuilder(activeSize: 10, space: 5),
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder: (context, a, b) => DetailPage(
                    //       planetInfo: planets[index],
                    //     ),
                    //   ),
                    // );
                  },
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          const SizedBox(height: 50),
                          Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            color: steelBlue,
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(height: 50),
                                  Text(
                                    categorylist[index].categorytitle,
                                    style: const TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 25,
                                      color: white,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  const Text(
                                    'Services',
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 23,
                                      color: white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(height: 80),
                                  // Image.asset(categorylist[index].categorypageimages,)
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(horizontal:18.0),
                                  //   child: SizedBox(
                                  //       height: 120,
                                  //       child: Image.asset(categorylist[index].categorypageimages,)),
                                  // ),
                                 const SizedBox(height: 60),
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: <Widget>[
                                      const Text(
                                        'Know more',
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 18,
                                          color: white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Positioned(
                      //     top: 20,
                      //     right: 24,
                      //     child: SizedBox(
                      //         height: 120,
                      //         child: Image.asset(planets[index].iconImage))),
                      // Hero(
                      //   tag: planets[index].position,
                      //   child: Image.asset(planets[index].iconImage),
                      // ),
                      Positioned(
                        right: 24, top: 120,
                        // bottom: 60,
                        child: Text(
                          categorylist[index].index.toString(),
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 70,
                            color: white.withOpacity(0.5),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
