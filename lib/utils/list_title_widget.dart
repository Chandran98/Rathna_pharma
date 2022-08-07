import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: must_be_immutable
class TitleListname extends StatelessWidget {
  String caption, name;
  TitleListname({this.caption, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(caption,style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w400,),),
          
          Text(name.toString(), style: GoogleFonts.poppins(
              fontSize: 15,fontWeight: FontWeight.w400,
            ),),
        ],
      ),
    );
  }
}
class Listname extends StatelessWidget {
  String caption, name;
  Listname({this.caption, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(caption,style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,),),
          ),
          
          Expanded(
            child: Text(name.toString(), style: GoogleFonts.poppins(
                fontSize: 15,fontWeight: FontWeight.w400,
              ),),
          ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            caption,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            name.toString(),
            style: GoogleFonts.poppins(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}




// class Listname2 extends StatelessWidget {
//   String caption, name;
//   Listname2({this.caption, this.name});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: ListTile(title: Text(caption),
//       trailing:   Text(name),)
//     );
//   }
// }