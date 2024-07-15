import 'package:flutter/material.dart';
import 'package:temp_converter/history_item.dart';
import 'package:temp_converter/history_list.dart';
import 'package:temp_converter/display_models.dart';
import 'package:temp_converter/new_temperature.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final List<History> histories = [
    History(
      fromDegree: 75,
      convertedFrom: Temperature.celsius,
      toDegree: 32.5,
      convertedTo: Temperature.fahrenheit,
    ),
    History(
      fromDegree: 75,
      convertedFrom: Temperature.celsius,
      toDegree: 32.5,
      convertedTo: Temperature.fahrenheit,
    ),
    History(
      fromDegree: 75,
      convertedFrom: Temperature.celsius,
      toDegree: 32.5,
      convertedTo: Temperature.fahrenheit,
    ),
  ];

  void _openTemperatureOverlay() {
    showModalBottomSheet(
      // isScrollControlled: true,
      
      context: context,
      builder: (ctx) => NewTemperature(onAddHistory: addToHistory),
    );
  }

  void addToHistory(History history) {
    setState(() {
      histories.insert(0, history);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (histories.isNotEmpty)
              Column(
                children: [
                  Text('Result:'),
                  HistoryItem(history: histories[0])
                ],
              ),
            ElevatedButton(
              onPressed: _openTemperatureOverlay,
              child: const Text('New Conversion'),
            ),
            const SizedBox(height: 20),
             const Text('Whre is my data'),
            Expanded(child: HistoryList(histories: histories)),
          ],
        ),
      ),
    );
  }
}
