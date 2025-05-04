import 'package:flutter/material.dart';

class FootToCmConverter extends StatefulWidget {
  const FootToCmConverter({Key? key}) : super(key: key);

  @override
  State<FootToCmConverter> createState() => _FootToCmConverterState();
}

class _FootToCmConverterState extends State<FootToCmConverter> {
  TextEditingController _footController = TextEditingController();
  double? _result;

  void convertFootToCm() {
    double foot = double.tryParse(_footController.text) ?? 0;
    setState(() {
      _result = foot * 30.48;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Foot to CM Converter"),
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.pink.shade50,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _footController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter value in foot",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertFootToCm,
              child: const Text("Convert"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            if (_result != null)
              Text(
                "${_footController.text} foot = ${_result!.toStringAsFixed(2)} cm",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
