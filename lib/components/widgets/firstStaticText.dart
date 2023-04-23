import 'package:flutter/material.dart';

class firstStaticText extends StatelessWidget {
  const firstStaticText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 40,
        top: 40,
      ),
      child: const Text(
        'Enter Your Birth Date',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
