import 'package:flutter/material.dart';

class reUsableRow extends StatelessWidget {
  reUsableRow({Key? key, required this.title, required this.value})
      : super(key: key);
  String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
