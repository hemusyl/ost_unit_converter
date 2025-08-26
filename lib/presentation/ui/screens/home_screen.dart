import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _controller = TextEditingController();


  final Map<String, double> convertionTypes  = {
    'Meters': 1.0,
    'Kilometers': 0.001,
    'Centimeters': 100,
    'Inches': 39.37,
    'Feet': 3.28084,
    "Yards": 1.09361,
    "Miles": 0.000621371,
  };

  String fromUnit = 'Meters'; /// Set default unit
  String toUnit = 'Kilometers'; /// Set default unit
  double inputValue = 0;
  double result = 0.0;

  void convert() {
    double valueInMeters = inputValue   / convertionTypes[fromUnit]!;
    setState(() {
      result = valueInMeters * convertionTypes [toUnit]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Unit',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                    value: fromUnit,
                  onChanged: (value) {
                    setState(() {
                      fromUnit = value!;
                    });
                  },
                  items: convertionTypes.keys.map((unit) {
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                ),
                Text('to'),
                DropdownButton<String>(
                  value: toUnit,
                  onChanged: (value) {
                    setState(() {
                      toUnit = value!;
                    });
                  },
                  items: convertionTypes.keys.map((unit) {
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                ),

              ],
            ),
            FractionallySizedBox(
              // width: double.infinity,
                widthFactor: 0.6,
                child: ElevatedButton(onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                  ),
                  child: Text('Convert'),
                )
            )
          ],
        ),
      ),
    );
  }
}