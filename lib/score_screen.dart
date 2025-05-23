import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class ScoreScreen extends StatelessWidget {
  final double bmiScore;

  final int age;

  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;

  ScoreScreen({Key? key, required this.bmiScore, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: const Text("BMI Score"),
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Your Score",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                            letterSpacing: 2,
                        shadows: [
                          Shadow(
                            blurRadius: 5,
                            color: Colors.black45,
                            offset: Offset(2, 2)
                          )
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PrettyGauge(
                        gaugeSize: 300,
                        minValue: 0,
                        maxValue: 40,
                        segments: [
                          GaugeSegment('UnderWeight', 18.5, Colors.red),
                          GaugeSegment('Normal', 6.4, Colors.green),
                          GaugeSegment('OverWeight', 5, Colors.orange),
                          GaugeSegment('Obese', 10.1, Colors.pink),
                        ],
                        valueWidget: Text(
                          bmiScore.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 40),
                        ),
                        currentValue: bmiScore.toDouble(),
                        needleColor: Colors.blue,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        bmiStatus!,
                        style: TextStyle(fontSize: 20, color: bmiStatusColor!),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        bmiInterpretation!,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purpleAccent, // 🟣 Re-calculate button color
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Re-calculate"),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal, // 🟢 Share button color
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            ),
                            onPressed: () {
                              Share.share("Your BMI is ${bmiScore.toStringAsFixed(1)} at age $age");
                            },
                            child: const Text("Share"),
                          ),
                        ],
                      ),
                    ]),
              ))),
    );
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Colors.pink;
    } else if (bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise & reduce the weight";
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy, You are fit";
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to increase the weight";
      bmiStatusColor = Colors.red;
    }
  }
}