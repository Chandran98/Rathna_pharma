
import 'package:flutter/material.dart';

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
