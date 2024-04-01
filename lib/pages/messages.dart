import 'package:flutter/material.dart';
import '../main.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Page1()));
            },
            child: const Text("goto page1")));
  }
}
