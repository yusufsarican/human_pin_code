import 'package:flutter/material.dart';
import 'components/homePage.dart';
import 'components/constants.dart';

void main() {
  runApp(const HumanPinCode());
}

class HumanPinCode extends StatelessWidget {
  const HumanPinCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
