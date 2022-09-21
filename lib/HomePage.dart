import 'package:flutter/material.dart';
import 'package:mobigic_test/FinishTest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences pref;
  late dynamic data;
  String initialDate = "2000-09-20 10:47:00";

  @override
  void initState() {
    super.initState();
    retrieve();
  }

  save() async {
    setState(() async {
      pref = await SharedPreferences.getInstance();
      final currentDT = DateTime.now();
      pref.setString('key', currentDT.toString());
    });
  }

  retrieve() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      data = pref.getString('key');

      data ??= initialDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    var text;

    String lastPressed = data;
    String nowPressing = DateTime.now().toString();

    DateTime dt1 = DateTime.parse(lastPressed);
    DateTime dt2 = DateTime.parse(nowPressing);

    Duration diff = dt1.difference(dt2);
    var diffMint = (diff.inMinutes).abs();

    final startDate = DateTime(2022, 9, 19);
    final endDate = DateTime(2022, 9, 22);

    final currentDT = DateTime.now();

    var hr = currentDT.hour;

    return Scaffold(
        body: Center(
      child: ElevatedButton(
          onPressed: () {
            save();
            if (currentDT.isAfter(startDate) && currentDT.isBefore(endDate)) {
              if (hr >= 8 && hr <= 10) {
                if (diffMint >= 360) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FinishTest()),
                  );
                } else {
                  var snackBar = const SnackBar(
                      content: Text('You have finished your test'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              } else {
                var snackBar =
                    const SnackBar(content: Text('You are out of Time'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            } else {
              var snackBar =
                  const SnackBar(content: Text('You are out of Time'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: const Text("Start Test")),
    ));
  }
}
