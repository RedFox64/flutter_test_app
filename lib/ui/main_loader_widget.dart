import 'package:flutter/material.dart';

class MainLoader extends StatelessWidget {
  const MainLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
            child: Center(
          child: CircularProgressIndicator(),
        ))
      ],
    );
  }
}
