import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:human_pin_code/components/constants.dart';
import 'package:human_pin_code/components/widgets/firstStaticText.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();
  String birthDate = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appName)),
      body: Center(
        child: Column(
          children: [
            const firstStaticText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                dayInput(),
                monthInput(),
                yearInput(),
              ],
            ),
            const SizedBox(height: 40),
            showCodeButton(),
            const SizedBox(height: 70),

            // This will be deleted
            Text(
              birthDate,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  TextButton showCodeButton() {
    return TextButton(
      onPressed: () {
        pinCodeCalculator();
      },
      child: const Text(
        'Show Pin Code',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  SizedBox yearInput() {
    return SizedBox(
      width: 120,
      height: 80,
      child: TextField(
        onTap: () {
          setState(() {
            yearController.clear();
          });
        },
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        controller: yearController,
        keyboardType: TextInputType.number,
        keyboardAppearance: Brightness.dark,
        maxLength: 4,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Year',
          hintText: '1995',
        ),
      ),
    );
  }

  SizedBox monthInput() {
    return SizedBox(
      width: 70,
      height: 80,
      child: TextField(
        onTap: () {
          setState(() {
            monthController.clear();
          });
        },
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        controller: monthController,
        keyboardType: TextInputType.number,
        keyboardAppearance: Brightness.dark,
        maxLength: 2,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Month',
          hintText: '01',
        ),
      ),
    );
  }

  SizedBox dayInput() {
    return SizedBox(
      width: 70,
      height: 80,
      child: TextField(
        onTap: () {
          setState(() {
            dayController.clear();
          });
        },
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        controller: dayController,
        keyboardType: TextInputType.number,
        keyboardAppearance: Brightness.dark,
        maxLength: 2,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: 'Day', hintText: "27"),
      ),
    );
  }

  int calculatePinCode(int giveNumber) {
    int calculated = giveNumber;
    while (calculated >= 10) {
      int temporary = 0;
      while (calculated > 0) {
        temporary += calculated % 10;
        calculated ~/= 10;
      }
      calculated = temporary;
    }
    return calculated;
  }

  void pinCodeCalculator() {
    int rowOne = calculatePinCode(int.parse(dayController.text));
    int rowTwo = calculatePinCode(int.parse(monthController.text));
    int rowThree = calculatePinCode(int.parse(yearController.text));
    int rowFour = calculatePinCode(rowOne + rowTwo + rowThree);
    int rowFive = calculatePinCode(rowOne + rowFour);
    int rowSix = calculatePinCode(rowOne + rowTwo);
    int rowSeven = calculatePinCode(rowTwo + rowThree);
    int rowEight = calculatePinCode(rowSix + rowSeven);
    int rowNine = calculatePinCode(rowOne +
        rowTwo +
        rowThree +
        rowFour +
        rowFive +
        rowSix +
        rowSeven +
        rowEight);

    print('rowOne: $rowOne' +
        ' rowTwo: $rowTwo' +
        ' rowThree: $rowThree' +
        ' rowFour: $rowFour' +
        ' rowFive: $rowFive' +
        ' rowSix: $rowSix' +
        ' rowSeven: $rowSeven' +
        ' rowEight: $rowEight' +
        ' rowNine: $rowNine');
  }
}
