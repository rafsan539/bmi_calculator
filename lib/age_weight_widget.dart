import 'package:flutter/material.dart';

class AgeWeightWidget extends StatefulWidget {
  final Function(int) onChange;

  final String title;

  final int initValue;

  final int min;

  final int max;

  const AgeWeightWidget(
      {Key? key,
        required this.onChange,
        required this.title,
        required this.initValue,
        required this.min,
        required this.max})
      : super(key: key);

  @override
  _AgeWeightWidgetState createState() => _AgeWeightWidgetState();
}

class _AgeWeightWidgetState extends State<AgeWeightWidget> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.lightBlue.shade50,
            elevation: 12,
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.pinkAccent,
                        child: Icon(Icons.remove, color: Colors.tealAccent),
                      ),
                      onTap: () {
                        setState(() {
                          if (counter > widget.min) {
                            counter--;
                          }
                        });
                        widget.onChange(counter);
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      counter.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.pinkAccent,
                        child: Icon(Icons.add, color: Colors.tealAccent),
                      ),
                      onTap: () {
                        setState(() {
                          if (counter < widget.max) {
                            counter++;
                          }
                        });
                        widget.onChange(counter);
                      },
                    ),
                  ],
                ),
              )
            ])));
  }
}