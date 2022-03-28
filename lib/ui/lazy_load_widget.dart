import 'package:flutter/material.dart';

class LazyLoadWidget extends StatelessWidget {
  const LazyLoadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [CircularProgressIndicator()],
      ),
    );
  }
}
