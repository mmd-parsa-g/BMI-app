import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/gender_button.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int value = 0;
  double answer = 0;
  @override
  Widget build(BuildContext context) {
    Color? containerColor;
    String? containerText;
    var formatCount = NumberFormat("#0.0## , en_US");
    final TextEditingController controller1 = TextEditingController();
    final TextEditingController controller2 = TextEditingController();

    switch (answer) {
      case < 10:
        containerColor = const Color.fromARGB(255, 136, 136, 136);
        containerText = "OUT OF RANGE";
        break;
      case >= 10 && < 15:
        containerColor = Colors.blue.shade800;
        containerText = "VERY ULTRA UNDERWEIGHT";
        break;
      case >= 15 && < 16:
        containerColor = Colors.blue.shade500;
        containerText = "ULTRA UNDERWEIGHT";
        break;
      case >= 16 && < 17:
        containerColor = Colors.blue.shade300;
        containerText = "UNDERWEIGHT";
        break;
      case >= 17 && < 18.5:
        containerColor = Colors.green.shade300;
        containerText = "MILD UNDERWEIGHT";
        break;
      case >= 18.5 && < 25:
        containerColor = Colors.green.shade700;
        containerText = "NORMAL WEIGHT";
        break;
      case >= 25 && < 30:
        containerColor = Colors.yellowAccent;
        containerText = "OVERWEIGHT";
        break;
      case >= 30 && < 35:
        containerColor = Colors.amber.shade800;
        containerText = "OBESE";
        break;
      case >= 35 && < 40:
        containerColor = Colors.red.shade900;
        containerText = "EXTREMELY OBESE";
      case >= 40:
        containerColor = Colors.purple.shade900;
        containerText = "ULTRA EXTREMELY OBESE";
        break;
      default:
        null;
    }

    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.circular(30),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.grey.shade700,
        brightness: Brightness.light,
      ),
      title: 'BMI Calculator',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 25, 25, 35),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 60, 60, 85),
          title: const Center(
            child: Text(
              'BMI Calculator',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white70,
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonItemApp<int>(
              onChanged: (v) {
                setState(() {
                  value = v;
                });
              },
              groupValue: value,
              children: [
                ButtonItem1(
                    value: 0,
                    icon: Icons.male,
                    text: 'Male',
                    color: Colors.white70),
                ButtonItem2(
                    value: 1,
                    icon: Icons.female,
                    text: "Female",
                    color: Colors.white70),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(6),
                  width: 225,
                  child: TextField(
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    cursorColor: const Color.fromARGB(255, 0, 0, 0),
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 134, 134, 134)),
                      hintText: "Meter",
                      label: const Text(
                        "Hight",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                            fontSize: 20),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 60, 60, 85),
                      focusedBorder: border,
                      enabledBorder: border,
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    controller: controller1,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(6),
                  width: 225,
                  child: TextField(
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    cursorColor: const Color.fromARGB(255, 0, 0, 0),
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 134, 134, 134)),
                      hintText: "kilogram",
                      label: const Text(
                        "Weight",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                            fontSize: 20),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 60, 60, 85),
                      focusedBorder: border,
                      enabledBorder: border,
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    controller: controller2,
                  ),
                )
              ],
            ),
            Container(
              height: 360,
              width: 460,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 60, 60, 85)),
              margin: const EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  answer != 0
                      ? const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text("Your Result",
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white70)),
                        )
                      : const SizedBox(),
                  answer == 0
                      ? const Text(
                          'Please Enter Hight and Weight',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.white70),
                        )
                      : Text(
                          formatCount.format(answer),
                          style: const TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: answer == 0
                        ? null
                        : Container(
                            decoration: BoxDecoration(
                                color: containerColor,
                                borderRadius: BorderRadius.circular(30)),
                            width: 250,
                            height: 70,
                            child: Center(
                              child: Text(
                                containerText!,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                  )
                ],
              ),
            ),
            OverflowBar(
              alignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (answer == 0) {
                      setState(
                        () {
                          final hight = double.parse(controller1.text);
                          final hightPow2 = pow(hight, 2);
                          final weight = double.parse(controller2.text);
                          answer = weight / hightPow2;
                        },
                      );
                    } else {
                      setState(
                        () {
                          answer = 0;
                        },
                      );
                    }
                  },
                  child: Container(
                    height: 75,
                    width: double.infinity,
                    color: const Color.fromARGB(255, 143, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          answer == 0 ? "Compute BMI" : "Reset BMI",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
