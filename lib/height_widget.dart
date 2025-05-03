import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  final Function(int) onChange;

  const HeightWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  _HeightWidgetState createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  int _height = 150;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
        padding:  EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.pink, // 🔴 Background color
          borderRadius: BorderRadius.circular(20), // 🟢 Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Column(
          children: [
            const Text(
              "Height",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _height.toString(),
                  style: const TextStyle(fontSize: 40),
                ),
                const SizedBox(width: 10),
                const Text(
                  "cm",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
            Slider(
              min: 0,
              max: 240,
              value: _height.toDouble(),
              thumbColor: Colors.pink,
              activeColor: Colors.grey,
              inactiveColor: Colors.pink.shade100,
              onChanged: (value) {
                setState(() {
                  _height = value.toInt();
                });
                widget.onChange(_height);
              },
            ),
          ],
        ),
      ),
    );
  }
}
