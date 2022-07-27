import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rathna/theme/colors/color_palette.dart';

class Listname extends StatelessWidget {
  String caption, name;
  Listname({this.caption, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(caption),
          Text(name.toString()),
        ],
      ),
    );
  }
}

class Listcolname extends StatelessWidget {
  String caption, name;
  Listcolname({this.caption, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(caption,style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w600, color: black),),
          Text(
            name.toString(),
            style: GoogleFonts.poppins(fontSize: 15, color: grey),
          ),
        ],
      ),
    );
  }
}
