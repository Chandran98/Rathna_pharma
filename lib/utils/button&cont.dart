import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/theme/colors/color_palette.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 46,
        width: 340,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            "Welcome to Rathna check your service",
            style: GoogleFonts.poppins(color: gray, fontSize: 15),
          ),
        ));
  }
}

class CircleButton extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback onPressed;
  final Color color;
  const CircleButton({Key key, this.icon, this.color, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryLight,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: color,
          ),
        ),
      ),
    );
  }
}
