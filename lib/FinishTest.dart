import 'package:flutter/material.dart';

import 'HomePage.dart';

class FinishTest extends StatefulWidget {
  const FinishTest({super.key});

  @override
  State<FinishTest> createState() => _FinishTestState();
}

class _FinishTestState extends State<FinishTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
                "Your test is going on. You can finish your test before your time but you can not re-login if test is finished once"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => HomePage(),
                  ),
                  (route) =>
                      false, //if you want to disable back feature set to false
                );
              },
              child: const Text("Finish"))
        ],
      )),
    );
  }
}
