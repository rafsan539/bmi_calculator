import 'dart:math';

import 'package:bmi_calculator/age_weight_widget.dart';
import 'package:bmi_calculator/foot_to_cm.dart';
import 'package:bmi_calculator/gender_widget.dart';
import 'package:bmi_calculator/height_widget.dart';
import 'package:bmi_calculator/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.pinkAccent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/images/man.png", height: 50),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "User Name.",
                    style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.translate),
              title: Text('Foot to CM'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FootToCmConverter()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Optional: show a dialog or navigate
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
            color: Colors.white10,
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                children: [
                  GenderWidget(
                    onChange: (genderVal) {
                      _gender = genderVal;
                    },
                  ),
                  HeightWidget(
                    onChange: (heightVal) {
                      _height = heightVal;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AgeWeightWidget(
                        onChange: (ageVal) {
                          _age = ageVal;
                        },
                        title: "Age",
                        initValue: 30,
                        min: 0,
                        max: 100,
                      ),
                      SizedBox(width: 20),
                      AgeWeightWidget(
                        onChange: (weightVal) {
                          _weight = weightVal;
                        },
                        title: "Weight(Kg)",
                        initValue: 50,
                        min: 0,
                        max: 200,
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 60,
                    ),
                    child: SwipeableButtonView(
                      isFinished: _isFinished,
                      onFinish: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            child: ScoreScreen(bmiScore: _bmiScore, age: _age),
                            type: PageTransitionType.fade,
                          ),
                        );

                        setState(() {
                          _isFinished = false;
                        });
                      },
                      onWaitingProcess: () {
                        //Calculate BMI here
                        calculateBmi();

                        Future.delayed(Duration(seconds: 1), () {
                          setState(() {
                            _isFinished = true;
                          });
                        });
                      },
                      activeColor: Colors.pink,
                      buttonWidget: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                      buttonText: "CALCULATE",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}
